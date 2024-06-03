from audioop import avg
from calendar import month
from cgitb import enable
import imp
from urllib.request import Request
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets

from .models import *
from .serializers import *
from rest_framework import status
import pdb

import json
import requests

from django.views.generic import TemplateView

from django.core.serializers import serialize
from django.http import HttpResponse

from django.contrib.gis.geos import fromstr
from django.contrib.gis.db.models.functions import Distance
from django.contrib.gis.geos import Point
from django.conf import settings

from reciever.sender_auth import get_user, user_detail_response
from django.contrib.gis.geos import Polygon
from rest_framework.generics import *

from django.db.models import F

## for distance calculation Api
from django.contrib.gis.measure import D 
from django.contrib.gis.geos import GEOSGeometry


### NOTES
"""
update this to only display API
NO Update here
"""


# ---------------------------------------------------------------------------- #
#                                 Reciever OUTLINE                             #
# ---------------------------------------------------------------------------- #
# SUB NOT FILLED

# SECTION BBOX
#       API Polygon Cordinates
# SECTION Country
#       API recieved_pothole_images_for_country
# SECTION State
#       API
# SECTION Nearby
#       API NearByLocationApiView
# SECTION Username
#       API

# ---------------------------------------------------------------------------- #



BASE_URL = 'https://sender.paplilabs.com'
# SECTION Helper functions
# ---------------------------------------------------------------------------- #
#                               Helper Functions                               #
# ---------------------------------------------------------------------------- #
from rest_framework import permissions

def bbox_json_make(queryset):
    potholes_list = []
    for value in queryset:
        potholes_list.append({
        'name'                        :value.name,
        'area'                        :value.area,
        'number'                      :value.number,
        'cordinate_X'                 :value.cordinate_X,
        'cordinate_Y'                 :value.cordinate_Y,
        'RCreated_date'               :value.RCreated_date,
        'user_id'                     :value.user_id,
        'company_id'                  :value.company_id,
        'rawImage'                    :value.rawImageUrl,
        'maskedImage'                 :value.maskedImageUrl,
        'point'                       :value.point,
        'premise'                     :value.premise,
        'park'                        :value.park,
        'airport'                     :value.airport,
        'natural_feature'             :value.natural_feature,
        'postal_code'                 :value.postal_code,
        'plus_code'                   :value.plus_code,
        'subpremise'                  :value.subpremise,
        'neighborhood'                :value.neighborhood,
        'sublocality_level_1'         :value.sublocality_level_1,
        'sublocality_level_2'         :value.sublocality_level_2,
        'sublocality_level_3'         :value.sublocality_level_3,
        'sublocality_level_4'         :value.sublocality_level_4,
        'sublocality_level_5'         :value.sublocality_level_5,
        'locality'                    :value.locality,
        'colloquial_area'             :value.colloquial_area,
        'administrative_area_level_1' :value.administrative_area_level_1,
        'administrative_area_level_2' :value.administrative_area_level_2,
        'administrative_area_level_3' :value.administrative_area_level_3,
        'administrative_area_level_4' :value.administrative_area_level_4,
        'administrative_area_level_5' :value.administrative_area_level_5,
        'country'                     :value.country,
        'intersection'                :value.intersection,
        'route'                       :value.route,
        'street_address'              :value.street_address,
        'formatted_address'           :value.formatted_address
    })
    return potholes_list

def get_state(longitude, latitude):
    """return states from cordinates"""
    url = BASE_URL+"/maps/Egeocoding/{},{}/".format(longitude, latitude)
    payload = {}
    headers= {}
    result = requests.request("GET", url, headers=headers, data = payload)
    json_response = result.json()
    state = json_response['result'][0]['state']
    return state

def get_country(longitude, latitude):
    """return country from cordinates"""
    url = BASE_URL+"/maps/Egeocoding/{},{}/".format(longitude, latitude)
    payload = {}
    headers= {}
    result = requests.request("GET", url, headers=headers, data = payload)
    json_response = result.json()
    country = json_response['result'][0]['country']
    return country

# ---------------------------------------------------------------------------- #
from . import logger
from cryptography.fernet import Fernet
from django.core.serializers import serialize
from django.utils import timezone, dateformat

def daterange(start_date, end_date):
    for n in range(int((end_date - start_date).days)):
        yield start_date + timezone.timedelta(n)

class UserAvailableApisApiView(APIView):
    def delete(self, request, *args, **kwargs):
        result = {}
        status_code = status.HTTP_401_UNAUTHORIZED
        token = request.GET.get('key')
        if token != None:
            qs = ProvidedApis.objects.filter(user_id=request.client_user.id).filter(token=token)
            status_code = status.HTTP_200_OK
            if qs.count() > 0:
                qs = qs.first().api_stat
                qs.stat='DEL'
                qs.save()
                result['message'] = 'Deleted'
            else:
                result['message'] = "No api found by key '%s'" % token
        else:
            result['message'] = 'No API_KEY provided'
        return Response(result, status_code)
    
    def patch(self, request, *args, **kwargs):
        result = {}
        data = request.data
        status_code = status.HTTP_401_UNAUTHORIZED
        token = request.GET.get('key')
        statusKey = 'status'
        if token != None:
            status_code = status.HTTP_200_OK
            if statusKey in data.keys():
                prQs = ProvidedApis.objects.filter(user_id=request.client_user.id).filter(token=token)
                if prQs.count() > 0:
                    statusKeyValue = data[statusKey]
                    if statusKeyValue == 'RUN' or statusKeyValue == 'STOP':
                        prQs = prQs.first().api_stat
                        if prQs.stat != 'DEL':
                            prQs.stat = statusKeyValue
                            prQs.save()
                            result['message'] = 'Updated'
                        else:
                            result['message'] = 'Not able to update'
                    else:
                        result['message'] = 'Status can only be updated to running or stopped'
                else:
                    result['message'] = "No apis found by key '%s'" % token
            else:
                result['message'] = "Field '%s' required" % statusKey
        else:
            result['message'] = 'No key found in params provided'


        return Response(result, status_code)

    def get(self, request, *args, **kwargs):
        
        result = {}
        status_code = status.HTTP_401_UNAUTHORIZED
        if logger.isUserExist(request):
            qs = ProvidedApis.objects.filter(user_id=request.client_user.id)
            data = []
            queryType = request.GET.get('queryType', 'coherent')

            token =  request.GET.get('key')

            if token != None:
                if ProvidedApis.objects.filter(token=token).count() == 0:
                    return Response({'message': 'No history found for provided api token'})
                
                if queryType == 'daily': #Provied data today - 1 week before
                    start = timezone.now()
                    abQs = Ab.objects.filter(token=token)
                    end = start - timezone.timedelta(weeks=1)
                    result['from'] = end.date()
                    result['to'] = start.date()
                    
                
                    for i in range(0, 8): # 0-7
                        res = {}
                        dateTime = end + timezone.timedelta(days=i)
                        correctedAbQs = abQs.filter(requested_at__date=dateTime.date())
                        avg = correctedAbQs.aggregate(avg=Avg('response_ms',))['avg']
                        res['requests'] = correctedAbQs.count()
                        res['requestsFailed'] = correctedAbQs.filter(status_code__range=[400, 500]).count()
                        res['avgLatencyMs'] = 0 if avg == None else avg
                        res['date'] = dateTime.date()
                        data.append(res)
                    result['data'] = data
                elif queryType == 'weekly':
                    start = timezone.now()
                    abQs = Ab.objects.filter(token=token)
                    tillWeeks = 4
                    end = start - timezone.timedelta(weeks=tillWeeks)
                    result['from'] = end.date()
                    result['to'] = start.date()

                    for i in range(0,tillWeeks+1):
                        dateTime = end + timezone.timedelta(weeks=i)
                        res = {}
                        res['week_end_date'] = dateTime.date()
                        correctedAbQs = abQs.filter(requested_at__week=dateTime.strftime("%W"))
                        avg = correctedAbQs.aggregate(avg=Avg('response_ms',))['avg']
                        res['avgLatencyMs'] = 0 if avg == None else avg
                        res['requestsFailed'] = correctedAbQs.filter(status_code__range=[400, 500]).count()
                        res['requests'] = correctedAbQs.count()
                        data.append(res)
                    result['data'] = data
                elif queryType == 'monthly':
                    start = timezone.now()
                    abQs = Ab.objects.filter(token=token)
                    tillWeeks = 52
                    end = start - timezone.timedelta(weeks=tillWeeks)
                    result['from'] = end.date()
                    result['to'] = start.date()
                    prevMonth = -1
                    for day in daterange(end.date(), start.date()):
                        # dateTime = end + timezone.timedelta(weeks=i)
                        res = {}
                        if prevMonth != -1 and prevMonth == day.month:
                            continue
                        
                        correctedAbQs = abQs.filter(requested_at__year=day.year).filter(requested_at__month=day.month)
                        avg = correctedAbQs.aggregate(avg=Avg('response_ms',))['avg']
                        res['avgLatencyMs'] = 0 if avg == None else avg
                        res['requests'] = correctedAbQs.count()
                        res['requestsFailed'] = correctedAbQs.filter(status_code__range=[400, 500]).count()
                        res['date'] = '%s-%s' % (day.year, day.month)
                        data.append(res)
                        prevMonth = day.month
                    result['data'] = data
            elif queryType == 'coherent':
                for d in qs:
                    res = {}
                    abQs = Ab.objects.filter(user=request.client_user).filter(token=d.token)
                    res['apis'] = d.api.values('name', 'iconHex', 'iconImage', 'group')
                    res['status'] = d.api_stat.stat
                    res['created_date'] = d.created_date
                    res['token'] = d.token
                    res['planType'] = d.plan.name
                    res['maxQuotaOfRequests'] = d.plan.maxQuota
                    res['maxQuotaOfRequestsPerMinute'] = d.plan.maxQuotaPerMinute
                    res['requestsToday'] = abQs.filter(requested_at__gte=timezone.now() - timezone.timedelta(days=1)).count()
                    res['requestsLastHour'] = abQs.filter(requested_at__gte=timezone.now() - timezone.timedelta(hours=1)).count()
                    res['requestsLastMinute'] = abQs.filter(requested_at__gte=timezone.now() - timezone.timedelta(minutes=1)).count()
                    res['requests'] = d.totalRequests
                    res['requestsFailed'] = d.failedRequestsCount
                    res['avgLatencyMs'] = d.avgResponseMs
                    data.append(res)
                
                result['data'] = data
            status_code = status.HTTP_200_OK
        else:
            result['message'] = 'Unauthorized'
        return Response(result, status_code)

class AvailableApisApiView(APIView):
    def get(self, request, *args, **kwargs):
        
        result = {}
        status_code = status.HTTP_401_UNAUTHORIZED
        if logger.isUserExist(request):
            data = []
            qs = AvailableApi.objects.all()
            pQs = ProvidedApis.objects.filter(user_id=request.client_user.id)

            for api in qs:
                res = {}
                prApiQs = pQs.filter(api = api)
                prApiQsFirst = prApiQs.first()
                abQs = None if prApiQsFirst == None or prApiQsFirst.token == None else Ab.objects.filter(token=prApiQsFirst.token)
                avg = 0 if abQs == None else abQs.aggregate(avg=Avg('response_ms',))['avg']
                res['name'] = api.name
                res['group'] = api.group
                res['iconHex'] = api.iconHex
                res['iconImage'] = api.iconImage
                res['avgLatencyMs'] = 0 if avg == None else avg
                res['requests'] = 0 if abQs == None else abQs.count()
                res['requestsFailed'] = 0 if abQs == None else abQs.filter(status_code__range=[400, 500]).count()
                res['status'] =  prApiQsFirst.api_stat.stat if prApiQsFirst != None else 'DEL'
                data.append(res)

            result['data'] = data
            status_code = status.HTTP_200_OK
        else:
            result['message'] = 'Unauthorized'
        return Response(result, status_code)

def generateTokenFernet():
    token = Fernet.generate_key()
    token = token.decode('utf-8')
    try: 
        token = token.replace('=', '')
    except:
        pass 
    return token

class GenerateTokenSingleApiView(APIView):
    def post(self, request):
        token = {
            'token' : generateTokenFernet()
        }
        return Response(token)
    
class GenerateTokenForApiView(CreateAPIView):
    def post(self, request):
        result = {}
        status_code = status.HTTP_401_UNAUTHORIZED
        if logger.isUserExist(request):
            apis = request.data['apis']
            apiQs = AvailableApi.objects.filter(name__in=apis)
            if apiQs.count() > 0:
                user = request.client_user
                oldApiToken = ProvidedApis.objects.filter(user_id=user.id).filter(api__in=apiQs)
                if True:
                    token = generateTokenFernet()
                    
                    data = {
                        'token': token,
                        'user_id': user.id,
                        'plan': ProvidedApiPlan.objects.get(name='Basic'),
                        'api_stat': ProvidedApisStatus.objects.create(stat='RUN'),
                    }
                    # psSer = ProvidedApiSerializer(data=data)
                    # psSer.is_valid(raise_exception=True)
                    
                    # print("saving ", data, psSer.api)
                    ps = ProvidedApis(**data)
                    print("saving ", data)
                    ps.save()
                    ps.api.set(apiQs)
                    outData = {
                        'token': ps.token,
                        'user': request.client_user.email,
                        'api': apiQs.values('name'),
                        'created_date': ps.created_date,
                    }
                    result['data'] = outData
                    status_code = status.HTTP_201_CREATED
                else:
                    ps = oldApiToken.first()
                    outData = {
                        'token': ps.token,
                        'user': request.client_user.email,
                        'api': apiQs.values('name'),
                        'created_date': ps.created_date
                    }
                    result['data'] = outData
                    status_code = status.HTTP_200_OK
            else:
                result['message'] = "No APIs found by name %s" % apis

        else:
            status_code = status.HTTP_400_BAD_REQUEST
            result['message'] = 'Unauthorized User, unable to create token'

        return Response(result, status_code)

from rest_framework.generics import RetrieveUpdateDestroyAPIView, RetrieveAPIView

class HelloView(RetrieveAPIView):
    # queryset = ProvidedApis.objects.all()
    # serializer_class = ProvidedApiSerializer
    lookup_field = 'token'

    def get_queryset(self):
        print("qs ", super().get_queryset())
        return super().get_queryset()

class ProcessSenderImages(RetrieveAPIView):
    # queryset = ProvidedApis.objects.all()
    # serializer_class = ProvidedApiSerializer
    lookup_field = 'token'

    def post(self, request, **kwargs):
        status_code = status.HTTP_201_CREATED
        print("wew", request.data)
        request.data['area'] = 0
        ser = RecievingPotholeImagesSerializer(request.data, many=True)
        print('Wew', ser.data)
        return Response(status=status_code)


# SECTION Recieve Images
# ---------------------------------------------------------------------------- #
#                          RECIEVE IMAGES FROM SENDER                          #
# ---------------------------------------------------------------------------- #

class RecievingPotholeImagesView(CreateAPIView):
    """reciever images from sender daily"""

    serializer_class =  RecievingPotholeImagesSerializer
    queryset = RecievingPotholeImages.objects.all()



# SECTION BBOX
# ---------------------------------------------------------------------------- #
#                       BBOX Polygon GEOMETRY̱ (NOT FILLED)                     #
# ---------------------------------------------------------------------------- #

# API BBOX
from django.db.models import Avg

class polygon_cordinates(APIView):
    """Return values under bounding box
    ne = (50.0, -90) (longitude, latitude)
    sw = (45.5, -95) 
    
    xmin = sw[0]
    ymin = ne[1]
    xmax = sw[1]
    ymax = ne[0]
    bbox = (xmin, ymin, xmax, ymax)

    https://stackoverflow.com/a/9471740/7999665
    """
    def post(self, request):
        # pdb.set_trace()
        potholes_list = []
        total_images = 0
        try:
            # import pdb; pdb.set_trace()
            ## for getting user_id
            # token    = request.headers['Authorization'] 
            # middle = user_detail_response(token)
            ### logic for BBox
            data = request.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid(raise_exception=True):
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                # queryset = RecievingPotholeImages.objects.filter(poly__contained=geom)
                # queryset = RecievingPotholeImages.objects.filter(point__contained=geom)
                queryset = RecievingPotholeImages.objects.filter(point__coveredby=geom)
                total_images = RecievingPotholeImages.objects.filter(point__coveredby=geom).count()
                print(total_images)
                status_code = status.HTTP_200_OK
                # queryset = RecievingPotholeImages.objects.filter(point__within=geom)
                potholes_list = bbox_json_make(queryset)
            results = BBLocationSerializer(potholes_list, many=True).data
            
            output = {
                'results' : results,
                'total_count' : total_images,
                'status' : status_code,
                # 'user_id' : middle
            }
            return Response(output, status=status.HTTP_200_OK)
        except Exception as e:
            return Response(str(e), status=status.HTTP_400_BAD_REQUEST)


# ---------------------------------------------------------------------------- #


from reciever.logger import LoggingUserMixin
from reciever.file_utils import file_response

# SECTION LOCATIONS AND NEARBY
# ---------------------------------------------------------------------------- #
#                             LOCATIONS AND NEARBY̱                            #
# ---------------------------------------------------------------------------- #
"""Reference for Api
https://docs.djangoproject.com/en/3.0/ref/contrib/gis/db-api/#distance-queries
"""

class ReceivingPointsAdminApiView(APIView):
    
    def get(self, request):
        qs = RecievingPotholeImages.objects.all()
        res = {}
        res['results'] =  RecievingPotholeImagesShortSerializer(qs, many=True).data
        res['count'] = qs.count()
        return Response(res)

class ReceivingPointsAdminApiViewSingle(APIView):
    
    def get(self, request, id):
        qs = RecievingPotholeImages.objects.filter(name=id)
        res = {}
        res['data'] =  RecievingPotholeImagesSerializer(qs, many=True).data
        res['count'] = qs.count()
        return Response(res)
from django.db.models import Q

class GeneratePlanForApiView(APIView):
    def post(self, request, **kwargs):
        data = request.data
        keys = data.keys()
        apis = AvailableApi.objects.filter(name__in=list(data['apis']))
        locality = list(RecievingPotholeImages.objects.filter(locality__in=list(data['locality'])).distinct().values_list('locality', flat=True))
        token = request.GET.get('key')
        
        print(data['apis'])
        print(apis)
        print(locality)
        pi = ProvidedApis.objects.get(token=token)
        pi.api.set(apis)
        pi.locality = locality
        pi.save()
        # try:
        #     pi = ProvidedApis.objects.get(token=token)
        #     pi.api.set(apis)
        #     pi.locality = locality
        #     pi.save()
        # except ProvidedApis.DoesNotExist:
        #     if "single" in keys:
        #         pass
        return Response()
from . import asset_dict
import numpy as np
import csv
from django.http import StreamingHttpResponse, FileResponse
from django.utils.text import slugify

def removeNegativeAssets(d: dict):
    return {k: v for k, v in d.items() if k <= 0}

class ReturnFileCsvToClientSenderImages(APIView):
    # permissions = permissions.AllowAny
    
    formatter = 'Y-m-d_H:i:s'
    dateParser = '%Y-%m-%d'
    def post(self, request):
        headerContent = ['name', 'link', 'longitude', 'latitude', 'pothole', 'waterlogging', 'barricade', 'summary']

        # path = os.path.join(settings.STATIC_ROOT, 'my_project_colored.png')
        # img = open(path, 'rb')
        # print(path)
        
        # response = FileResponse(img)
        # response['Content-Disposition'] = f'attachment; filename=my_project_colored.png'
        # # response['Content-Disposition'] = f'attachment; filename={slugify('my_project_colored.png')}'
        # response['Access-Control-Expose-Headers'] = 'Content-Disposition'
        # return response
        # return file_response(request, '2023-07-11 08:42:22.929583+00:00.csv')
        
        ogDict = removeNegativeAssets(asset_dict.items)
        
        headerContent += list(ogDict.values())
        ogItems = ogDict.fromkeys(ogDict, 'N')
        dd = timezone.localtime()
        fileName = f'{dateformat.format(dd, self.formatter)}.csv'
        path = os.path.join(settings.STATIC_ROOT, fileName)
        data = request.data
        
        print(data)
        selectedApis = list(data['apis'])
        selectedRoadAsset = list(data['roadasset'])
        
        tFrom = data['from']
        tTo = data['to']
        tSize = data['tileSize']
        geom = Polygon.from_bbox(data['bbox'])
        
        rootContent = [] 
        subBody = []
        selectedParams = 0
        
        subBody.append('Novae Avenue | Papli Labs Pvt Ltd')
        subBody.append(f"Issued to {request.client_user_email}")
        subBody.append(f"Issued on {dateformat.format(dd, self.formatter)}")
        subBody.append(f"From to {tFrom} to {tTo}")
        subBody.append(f"Tile size {tSize}")
        
        assetIds = []
        valuesByKeys = replacedDict(ogDict)
        
        joined = ', '.join(selectedApis+selectedRoadAsset)
        subBody.append(f'Selected Parameters {joined}')
        for qq in selectedRoadAsset:
            qq = str(qq).lower().replace(' ', '_')
            if qq in valuesByKeys:
                assetIds.append(valuesByKeys[qq])
                
        if not tFrom == tTo:
            aaaqa = RecievingPotholeImages.objects.filter(RCreated_date__date__range=[tFrom, tTo])
        else:
            aaaqa = RecievingPotholeImages.objects.filter(RCreated_date__date=tFrom)
        aaaqa = aaaqa.filter(point__coveredby=geom).filter(Q(pothole__verified=True) | Q(barricade__verified=True) | Q(waterlogging__verified=True) | Q(roadasset__verified=None))
        
        subBody.append(f'Total Images {aaaqa.count()}')
        print(subBody)
        
        for q in aaaqa:
            mainContent = []
            assetContent = []
            
            mainContent.append(q.name)
            # mainContent.append(RecievingPotholeImages.objects.exclude(name=q.name).filter(point__distance_lte=(q.point,D(m=5.0))).filter(roadasset__classes__contains=[125]).count())
            
            mainContent.append(q.rawImageUrl)
            mainContent.append(q.cordinate_X)
            mainContent.append(q.cordinate_Y)
            
            if 'Potholes' in selectedApis and q.pothole:
                mainContent.append('Y')
            else:
                mainContent.append('N')
                
            if 'Waterlogging' in selectedApis and q.waterlogging:
                mainContent.append('Y')
            else:
                mainContent.append('N')
                
            if 'Barricade' in selectedApis and q.barricade:
                mainContent.append('Y')
            else:
                mainContent.append('N')
            
            if 'Roadasset' in selectedApis and q.roadasset:
                common = list(np.intersect1d(q.roadasset.classes, assetIds))
                if len(common) > 0:
                    ogItems.update({}.fromkeys(common, 'Y')) # Create dict from common assetIds with def value 'Y'
                    mainContent.append([ogDict[k] for k in common if k in ogDict])
                else:
                    mainContent.append('-')
            else:
                mainContent.append('-')

            mainContent += list(ogItems.values())
            # mainContent += ', '.join(ogItems.values())
            rootContent.append(mainContent)
            
            # rd = q.roadasset
            # if rd != None and len(rd.classes) > 0:
            #     mainContent = []
            #     assetContent = []
                
            #     mainContent.append(q.name)
            #     mainContent.append(q.rawImageUrl)
            #     mainContent.append(q.cordinate_X)
            #     mainContent.append(q.cordinate_Y)
                
            #     for cl in rd.classes:
            #         assetContent.append(asset_dict.items[cl].replace('_', ' '))
                    
            #     mainContent.append(', '.join(assetContent))
            #     rootContent.append(mainContent)
        print(headerContent)
        print(rootContent)
        print(len(rootContent[0]), len(headerContent))
        
        with open(path, 'w+') as myfile:
            wr = csv.writer(myfile, quoting=csv.QUOTE_ALL,delimiter=',')
            
            for s in subBody:
                wr.writerow([s])
            wr.writerow(headerContent)
            wr.writerows(rootContent)
            # for content in rootContent:
            #     wr.writerow(content)
        response = file_response(request, path)
        response['X-filename'] = fileName
        response['Access-Control-Expose-Headers'] = 'X-filename'
        return response
        # return Response()
    
class ImageMetaApiView(APIView):
    def post(self, request):
        data = request.data
        image_id = data['image']
        
        assetNames = list(data['roadasset'])
        assetIds = []
            
        valuesByKeys = replacedDict(removeNegativeAssets(asset_dict.items))
        
        for qq in assetNames:
            qq = str(qq).lower().replace(' ', '_')
            if qq in valuesByKeys:
                assetIds.append(valuesByKeys[qq])
            
        ogList = RecievingPotholeImages.objects.get(name=image_id).roadasset.classes
        common = list(np.intersect1d(ogList, assetIds))
        res = []
        for q in common:
            res.append({
                "link": 'https://nasenderstorage.blob.core.windows.net/roadasset/' + asset_dict.items[q] + '.svg',
                "name": asset_dict.items[q].replace("_", " ") 
            })
        return Response(res)
        
def keyByValueDict(dict: dict, search_age): 
    return [name for name,age in dict.items() if age == search_age] 

def replacedDict(dict: dict):
    d={}
    for k,v in dict.items():
       d[v] = k
    return d
    
''' Compare with range and return color '''
def peopleRangeColor(number):
    if 1 <= number <= 10:
        return '#ffff99' #yellow
    elif 11 <= number <= 30:
        return '#fff68f' #dk yellow
    else:
        return '#ff4040' #red

class InitialApiViewBbox(APIView):
    
    formatter = '%Y-%m-%d'
    def post(self, request, **kwargs):
        data = request.data
        
        outData = {}
        print("Gawd ", data)
        
        # Removed from front-end
        # bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
        
        geom = Polygon.from_bbox(data['bbox'])
        # queryset = RecievingPotholeImages.objects.filter(poly__contained=geom)
        # queryset = RecievingPotholeImages.objects.filter(point__contained=geom)
        
        # queryset = RecievingPotholeImages.objects.filter(point__coveredby=geom).filter(Q(pothole__verified=True) | Q(barricade__verified=True) | Q(waterlogging__verified=True))
        
        queryset = RecievingPotholeImages.objects.filter(point__coveredby=geom).filter(Q(pothole__verified=True) | Q(barricade__verified=True) | Q(waterlogging__verified=True) | Q(roadasset__verified=None))
        
        timeData = []
        preExTime = [[10, 14], [14, 18], [18, 22]]
        
        senderQs = queryset.none()
              
        if 'from' in data.keys():
            # pass
            queryset = queryset.filter(RCreated_date__date__range=[datetime.datetime.strptime(data['from'], self.formatter), datetime.datetime.strptime(data['to'],  self.formatter)])
            senderQs = PotholeImages.objects.using('users').filter(point__coveredby=geom).filter(created_date__range=[datetime.datetime.strptime(data['from'], self.formatter), datetime.datetime.strptime(data['to'],  self.formatter)])
            print("Wew ", senderQs)
        apis = list(data['apis'])
        assetNames = list(data['roadasset'])
        assetIds = []
        valuesByKeys = replacedDict(asset_dict.items)
        
        for qq in assetNames:
            qq = str(qq).lower().replace(' ', '_')
            if qq in valuesByKeys:
                assetIds.append(valuesByKeys[qq])
        # print(assetIds)
        
        points = []
        pointsSender = []
        peoplePoints = []
        
        print('Total bfpr ', queryset.count(), )
        if len(apis) == 0 :
            queryset = queryset.none()
        else:
            if 'startTime' in data.keys():
                for t in preExTime:
                    timeData.append(queryset.filter(Q(RCreated_date__hour__range=t)).count())
                queryset = queryset.filter(Q(RCreated_date__hour__range=[data['startTime'], data['endTime']]))
                senderQs = PotholeImages.objects.using('users').filter(point__coveredby=geom).filter(created_date=datetime.datetime.strptime(data['from'], self.formatter)).filter(Q(created_date__hour__range=[data['startTime'], data['endTime']]))
                print("Wew ", data['from'], self.formatter, senderQs.count())
            
            pointsSender = list(senderQs.values_list('cordinate_X', 'cordinate_Y'))
            potsQs = queryset.filter(pothole__verified=True) if 'Potholes' in apis else queryset.none()
            barrQs = queryset.filter(barricade__verified=True) if 'Barricade' in apis else queryset.none()
            waterQs = queryset.filter(waterlogging__verified=True) if 'Waterlogging' in apis else queryset.none()
            assetQs = queryset.exclude(roadasset=None) if 'Roadasset' in apis else queryset.none()
                        
            for q in potsQs:
                res = {}
                res['lat'] = q.cordinate_X
                res['lng'] = q.cordinate_Y
                res['pt_show_url'] = 'https://points.novaeavenue.com/point/pothole/1643'
                points.append(res)
            for q in barrQs:
                res = {}
                res['lat'] = q.cordinate_X
                res['lng'] = q.cordinate_Y
                res['pt_show_url'] = 'https://points.novaeavenue.com/point/barricade/2872'
                points.append(res)
            for q in waterQs:
                res = {}
                res['lat'] = q.cordinate_X
                res['lng'] = q.cordinate_Y
                res['pt_show_url'] = 'https://points.novaeavenue.com/point/waterlogging/3621'
                points.append(res)
            
            for q in assetQs:
                ogList = q.roadasset.classes
                
                print('ogList', ogList)
                print('assetIds', assetIds)
                common = list(np.intersect1d(ogList, assetIds))
                
                totalClasses = len(common)
                
                if -1 in assetIds and q.roadasset and 125 in q.roadasset.classes:
                    # aq = assetQs.order_by('cordinate_X', 'cordinate_Y').distinct('cordinate_X', 'cordinate_Y').filter(point__distance_lte=(q.point,D(m=1000.0))).filter(roadasset__classes__contains=[125])
                    aq = assetQs.filter(point__distance_lte=(q.point,D(m=10.0))).filter(roadasset__classes__contains=[125])
                    aq = aq.order_by('RCreated_date')
                    # aq = aq.order_by('RCreated_date').distinct('cordinate_X', 'cordinate_Y')
                    cc = aq.count()
                    if cc > 1:
                        peoplePoints.append({
                            'color': peopleRangeColor(cc),
                            'coords': aq.values_list('cordinate_X', 'cordinate_Y')
                        })
                if len(common) > 0:
                        

                    if totalClasses > 1:
                        res = {
                            'isSpecial': True,
                            'total': totalClasses,
                            'image_id': q.name,
                            'lat': q.cordinate_X,
                            'lng': q.cordinate_Y,
                        }
                    else :
                        res = {
                        'lat': q.cordinate_X,
                        'lng': q.cordinate_Y,
                        # 'pt_show_url': 'https://points.novaeavenue.com/point/waterlogging/3621'
                        'pt_show_url': 'https://nasenderstorage.blob.core.windows.net/roadasset/' + asset_dict.items[common[0]] + '.svg'
                    }
                    points.append(res)
                
            
            # if 'Potholes' in apis and 'Barricade' in apis and 'Waterlogging' in apis:
            #     pass
            # elif 'Potholes' in apis and 'Barricade' in apis:
            #     queryset = queryset.filter(Q(pothole__verified=True) | Q(barricade__verified=True))
            # elif 'Potholes' in apis and 'Waterlogging' in apis:
            #     queryset = queryset.filter(Q(pothole__verified=True) | Q(waterlogging__verified=True))
            # elif 'Barricade' in apis and 'Waterlogging' in apis:
            #     queryset = queryset.filter(Q(barricade__verified=True) | Q(waterlogging__verified=True))
            # elif 'Potholes' in apis:
            #     queryset = queryset.filter(pothole__verified = True)
            # elif 'Waterlogging' in apis:
            #     queryset = queryset.filter(waterlogging__verified=True)
            # elif 'Barricade' in apis:
            #     queryset = queryset.filter(barricade__verified=True)
            
        queryset = queryset.order_by('RCreated_date')
        outData['points'] = points
        outData['pointsSender'] = pointsSender
        outData['peoplePoints'] = peoplePoints
        # outData['points'] = queryset.values_list('cordinate_X', 'cordinate_Y', )
        outData['apis'] = apis
        outData['timeData'] = timeData
        outData['Total'] = queryset.count()
        print('Total ', queryset.count())
        # print(outData)
        
        return Response(outData)
    
class InitialApiView(APIView):
    formatter = '%Y-%m-%d'
    def post(self, request, **kwargs):
        data = request.data
        
        outData = {}
        print("Gawd ", data)
        asset = list(ChildHeaderSender.objects.using('users').all().values('name', 'image_url'))
        locality = list(RecievingPotholeImages.objects.values_list('locality', flat=True).distinct('locality'))
        apis = list(AvailableApi.objects.values_list('name', flat=True)) 
        
        outData['locality'] = locality
        outData['asset'] = asset
        outData['apis'] = apis
        # data['points'] = points
        
        
        # bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
        # geom = Polygon.from_bbox(data['bbox'])
        
        # queryset = RecievingPotholeImages.objects.filter(poly__contained=geom)
        # queryset = RecievingPotholeImages.objects.filter(point__contained=geom)
        # queryset = RecievingPotholeImages.objects.filter(Q(pothole__verified=True) | Q(barricade__verified=True) | Q(waterlogging__verified=True) | Q(roadasset__verified=None))
        # queryset = RecievingPotholeImages.objects.filter(point__coveredby=geom).filter(Q(pothole__verified=True) | Q(barricade__verified=True) | Q(waterlogging__verified=True) | Q(roadasset__verified=None))
              
        # if 'from' in data.keys():
            # pass
            # queryset = queryset.filter(RCreated_date__date__range=[datetime.datetime.strptime(data['from'], self.formatter), datetime.datetime.strptime(data['to'],  self.formatter)])
        # points = []
        # potsQs = queryset.filter(pothole__verified=True) 
        # barrQs = queryset.filter(barricade__verified=True)
        # waterQs = queryset.filter(waterlogging__verified=True)
        # assetQs = queryset.exclude(roadasset=None) if 'Roadasset' in apis else queryset.none()
        
        # for q in potsQs:
        #     res = {}
        #     res['lat'] = q.cordinate_X
        #     res['lng'] = q.cordinate_Y
        #     res['pt_show_url'] = 'https://points.novaeavenue.com/point/pothole/1643'
        #     points.append(res)
        # for q in barrQs:
        #     res = {}
        #     res['lat'] = q.cordinate_X
        #     res['lng'] = q.cordinate_Y
        #     res['pt_show_url'] = 'https://points.novaeavenue.com/point/barricade/2872'
        #     points.append(res)
        # for q in waterQs:
        #     res = {}
        #     res['lat'] = q.cordinate_X
        #     res['lng'] = q.cordinate_Y
        #     res['pt_show_url'] = 'https://points.novaeavenue.com/point/waterlogging/3621'
        #     points.append(res)
    
        # for q in assetQs:
        #     oldLat = 0
        #     oldLng = 0
        #     print('Cl ', len(q.roadasset.classes))
            # for qq in q.roadasset.classes:
            #     res = {}
            #     res['pt_show_url'] = 'https://nasenderstorage.blob.core.windows.net/roadasset/' + asset_dict.items[qq] + '.svg'
            #     # if oldLat == 0:
            #     oldLat = q.cordinate_X
            #     oldLng = q.cordinate_Y
            #     res['lat'] = oldLat
            #     res['lng'] = oldLng
            #     # oldLat += 0.001
            #     # oldLng += 0.001
            # res = {
            #     'lat': q.cordinate_X,
            #     'lng': q.cordinate_Y,
            #     'pt_show_url': 'https://points.novaeavenue.com/point/waterlogging/3621'
            #     # 'pt_show_url': 'https://nasenderstorage.blob.core.windows.net/roadasset/' + asset_dict.items[q.roadasset.classes[0]] + '.svg'
            # }
            # points.append(res)
        
        # queryset = queryset.order_by('RCreated_date')
        # outData['points'] = points
        # outData['points'] = queryset.values_list('cordinate_X', 'cordinate_Y', )
        # print('Total ', queryset.count())
                
        return Response(outData)
# API Nearby nearby/<float:longitude>,<float:latitude>/dis/<int:under_distance>
class NearByLocationApiView(LoggingUserMixin, APIView):
    """Send cordinates of all the potholes with respect to their cordinates"""

    def post(self, request, longitude, latitude, under_distance, **kwargs):
        potholes_list = []
        try:
            # import pdb; pdb.set_trace()
            ## for getting user_id
            # token    = request.headers['Authorization'] 
            # middle = user_detail_response(token)
            # logic for nearby
            pnt = GEOSGeometry('POINT({} {})'.format(float(latitude),float(longitude)), srid=4326)
            print("gawd ", pnt)
            queryset =  RecievingPotholeImages.objects.filter(point__distance_lte=(pnt,D(km=under_distance)))
            total_images = queryset.count()
            potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            status_code = status.HTTP_200_OK
            output = {
                'results' : result,
                'total_count' : total_images,
                'status' : status_code,
                # 'user_id' : middle
            }
            return Response(output, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=status.HTTP_400_BAD_REQUEST)


# ---------------------------------------------------------------------------- #

class NearByLocationApiViewPincode(LoggingUserMixin, APIView):
    allowed_pins = ['121004']
    
    def post(self, request, longitude, latitude, **kwargs):
        potholes_list = []
        
        try:
            under_distance = 5
            # import pdb; pdb.set_trace()
            ## for getting user_id
            # token    = request.headers['Authorization'] 
            # middle = user_detail_response(token)
            # logic for nearby
            pnt = GEOSGeometry('POINT({} {})'.format(float(latitude),float(longitude)), srid=4326)
            result =  RecievingPotholeImages.objects.filter(point__distance_lte=(pnt,D(km=under_distance))).filter(postal_code__in=self.allowed_pins).values('name', 'cordinate_X', 'cordinate_Y')
            # total_images = queryset.count()
            # potholes_list = bbox_json_make(queryset)
            # result = BBLocationSerializer(potholes_list, many=True).data
            status_code = status.HTTP_200_OK
            output = {
                'results' : result,
                'status' : status_code,
                # 'user_id' : middle
            }
            return Response(output, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=status.HTTP_400_BAD_REQUEST)
        #

class GetPotholeApiView(LoggingUserMixin, APIView):
    allowed_pins = ['121004']
    
    def post(self, request, name, **kwargs):
        potholes_list = []
        
        try:
            # import pdb; pdb.set_trace()
            ## for getting user_id
            # token    = request.headers['Authorization'] 
            # middle = user_detail_response(token)
            # logic for nearby
            queryset =  RecievingPotholeImages.objects.filter(name=name).filter(postal_code__in=self.allowed_pins)
            potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            
            status_code = status.HTTP_200_OK
            output = {
                'results' : result,
                'status' : status_code,
                # 'user_id' : middle
            }
            return Response(output, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=status.HTTP_400_BAD_REQUEST)

# SECTION COUNTRY
# ---------------------------------------------------------------------------- #
#                                    Country                                   #
# ---------------------------------------------------------------------------- #


# API <float:longitude>,<float:latitude>/', views.recieved_pothole_images_for_country.as_view())
class recieved_pothole_images_for_country(LoggingUserMixin, APIView):
    """Displaying all the pothole images 
    for COUNTRY which are processed as a 
    potholes PRESENT in them"""

    def post(self, request, longitude, latitude,  **kwargs):
        potholes_list = []
        # import pdb; pdb.set_trace()
        try:
            ## for getting user_id
            # token    = request.headers['Authorization']
            # middle = user_detail_response(token)
            ## logic for country
        
            country_name = get_country(longitude, latitude)
            status_code = status.HTTP_200_OK
            name_of_country =country_name
            total_country_images = RecievingPotholeImages.objects.filter(country=name_of_country).count()
            country_images = RecievingPotholeImages.objects.filter(country=name_of_country)
            # import pdb; pdb.set_trace()
            potholes_list = bbox_json_make(country_images)
            results = BBLocationSerializer(potholes_list, many=True).data
            output = {
                'results' : results,
                'total_count' : total_country_images,
                'status' : status_code,
                # 'user_id' : middle
            }
            return Response(output, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=status.HTTP_400_BAD_REQUEST)



# * if asked for State API create it from Country API Directly
# ---------------------------------------------------------------------------- #



# ---------------------------------------------------------------------------- #
#                              UserProfile Images                              #
# ---------------------------------------------------------------------------- #

### INCOMPLETE ANCHOR
# * First From Sender Send each Image with User ID and Company ID
# * Add these two Fields there after which you will be able to filter


class Mapping_photos_select_related_username(APIView):
    """Mapping username image together"""

    def post(self, requests):
        try:
            data = requests.data ## get token for of the user
            get_response = get_token_for_users(token_value)
            clean_response_username = json.loads(get_response.decode("utf-8"))
            name_of_username = clean_response_username
            mapped_images_qs = PotholeUpdationImages.objects.select_related('name').all().filter(is_filled = 'False')
            get_images = mapped_images_qs.filter(name__ROwner__contains=name_of_username)
            
            mapped_images = []
            for image in get_images:
                mapped_images.append({
                    'name'            : image.name,
                    'updated_image'   : image.updated_image,
                    'cordinate_X'     : image.cordinate_X,
                    'cordinate_Y'     : image.cordinate_Y,
                    'road_name'       : image.road_name,
                    'created_date'    : image.created_date,
                    'is_filled'       : image.is_filled,
                    'checked'         : image.checked,
                    'agency'          : image.name.agency_name,
                    'rawImage'        : image.name.rawImage,
                    'maskedImage'     : image.name.maskedImage,
            })

            results = MappingPhotosSelectRelateSerializer(mapped_images, many=True).data
            return Response(results)
        except Exception as e:
            responseData = e
            return Response(responseData, status=status.HTTP_200_OK)

# ---------------------------------------------------------------------------- #

# ---------------------------------------------------------------------------- #
#                            Company Profile Images                            #
# ---------------------------------------------------------------------------- #
# TODO : List all the Images for Company Profiles
# ? Get the User ID of Company and pass the user id of the company
# * pass the UserID and CompanyID on each Image From Sender

# ---------------------------------------------------------------------------- #


# ---------------------------------------------------------------------------- #
#                                  Intenal Api                                 #
# ---------------------------------------------------------------------------- #
# API Reciever Pothole Image

class RecieverPotholeImageInternalAPIView(CreateAPIView):
    """For Recieving Images from sender"""

    queryset = RecievingPotholeImages.objects.all()
    serializer_class = RecievingPotholeImagesSerializer  

# ---------------------------------------------------------------------------- #
