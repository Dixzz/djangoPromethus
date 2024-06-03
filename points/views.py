import imp
from reciever.logger import LoggingUserMixin
from rest_framework.views import APIView
from django.contrib.gis.geos import GEOSGeometry
from django.contrib.gis.measure import D 
from reciever.models import ProvidedApis, RecievingPotholeImages
from rest_framework import status
from rest_framework.response import Response
from django.contrib.gis.geos import Polygon, GeometryCollection


# Create your views here.
class NearByBboxApiView(LoggingUserMixin, APIView):
    # sw_longitude
    
    def post(self, request, **kwargs):
        groupToCheckKey = kwargs['group']
        
        token = request.GET.get('key')
        pQs = ProvidedApis.objects.get(token=token)
        apiQs = pQs.api.filter(group=groupToCheckKey)
        
        if apiQs.count() < 1:
            return Response({}, status=status.HTTP_200_OK)
        
        sw_long =  request.GET.get('sw_long', 0.0)
        sw_lat =  request.GET.get('sw_lat', 0.0)
        ne_long =  request.GET.get('ne_long', 0.0)
        ne_lat =  request.GET.get('ne_lat', 0.0)
        
        potholes_list = []
        try:
            bbox = (sw_long, sw_lat, ne_long, ne_lat)
            geom = Polygon.from_bbox(bbox)
            prep_poly = geom.prepared
            # queryset = RecievingPotholeImages.objects.filter(poly__contained=geom)
            # queryset = RecievingPotholeImages.objects.filter(point__contained=geom)
            queryset = RecievingPotholeImages.objects.filter(point__coveredby=geom)
            total_images = RecievingPotholeImages.objects.filter(point__coveredby=geom).count()
            print(total_images)
            status_code = status.HTTP_200_OK
            # queryset = RecievingPotholeImages.objects.filter(point__within=geom)
            # potholes_list = bbox_json_make(queryset)
            results = []
            output = {
                'results' : results,
                'total_count' : total_images,
                'status' : status_code,
            }
            return Response(output, status=status.HTTP_200_OK)
        except Exception as e:
            result = {
                'message': 'Non zero lat lng needed',
                'status': 'BAD REQUEST'
            }
            return Response(result, status=status.HTTP_400_BAD_REQUEST)

from django.db.models import Q
class NearByLocationApiView(LoggingUserMixin, APIView):
    allowed_pins = ['121004', '121005', '122102', '122103', '110085']
    allowed_area = ['Gurgaon', 'Faridabad', 'West', 'Rohini', 'Delhi Cantonment', 'Gopalpur Village', 'Chandni Chowk', 'Mukherjee Nagar', 'Naraina', 'Mansarover Garden']
    
    
    def get(self, request, **kwargs):
        max_distance = 10
        
        distance = int(request.GET.get('distance', 5))
        
        if distance <= max_distance and distance >=0:
            max_distance = distance
            
        resultsRoot = {}
        result = {}
        tot_types = []
        # pts = []
        area = []
        pin_codes=[]
        pts_address = []
        
        groupToCheckKey = kwargs['group']
        
        try:
            token = request.GET.get('key')
            pQs = ProvidedApis.objects.get(token=token)
            apiQs = pQs.api.filter(group=groupToCheckKey)
            if apiQs.count() < 1:
                return Response(resultsRoot, status=status.HTTP_200_OK)
            
            latLngStr = str(request.GET.get('latLng', '0.0,0.0')).split(',')
            lat = latLngStr[1] 
            lng = latLngStr[0]
            pnt = GEOSGeometry('POINT({} {})'.format(float(lat),float(lng)), srid=4326)
            qs = RecievingPotholeImages.objects.filter(point__distance_lte=(pnt,D(km=max_distance)))
            # if self.request is "locus@novaeavenue.com":
            #     pass
            # else:
            qs = qs.filter(administrative_area_level_2__in=self.allowed_area)
            qs = qs.filter(Q(pothole__verified=True) | Q(barricade__verified=True) | Q(waterlogging__verified=True))
            # qs = RecievingPotholeImages.objects.filter(point__distance_lte=(pnt,D(km=distance))).filter(postal_code__in=self.allowed_pins)
            
            result['pts_tot'] = qs.count()
            result['latLng'] = (lng,lat)
            result['distance'] = str(max_distance) + 'km'
            result['api_type'] = 'HTTP'
            result['api_output_type'] = 'API'
            
            for q in qs.distinct('administrative_area_level_2').exclude(administrative_area_level_2='None'):
                area.append(q.administrative_area_level_2)
            
            for q in qs.distinct('postal_code').exclude(postal_code='None'):
                pin_codes.append(q.postal_code)
                
            # for q in qs:
            #     res = {}
            #     res['pt_id'] = q.name
            #     res['lat'] = q.cordinate_X
            #     res['lng'] = q.cordinate_Y
            #     res['pt_type'] = 'pothole'
            #     # res['pt_img'] = q.rawImageUrl
            #     # res['pt_show_url'] = q.showUrl
            #     res['pt_show_url'] = 'https://points.novaeavenue.com/point/pothole/1643'
                
            #     pts_address.append(res)
                
            potsQs = qs.exclude(pothole=None).filter(pothole__verified=True)
            barrQs = qs.exclude(barricade=None).filter(barricade__verified=True)
            waterQs = qs.exclude(waterlogging=None).filter(waterlogging__verified=True)
            for q in potsQs:
                res = {}
                # res['pt_id'] = q.name
                res['lat'] = q.cordinate_X
                res['lng'] = q.cordinate_Y
                res['pt_type'] = 'pothole'
                # res['pt_img'] = q.rawImageUrl
                # res['pt_show_url'] = q.showUrl
                res['pt_show_url'] = 'https://points.novaeavenue.com/point/pothole/1643'
                pts_address.append(res)
            for q in barrQs:
                res = {}
                # res['pt_id'] = q.name
                res['lat'] = q.cordinate_X
                res['lng'] = q.cordinate_Y
                res['pt_type'] = 'barricade'
                res['pt_show_url'] = 'https://points.novaeavenue.com/point/barricade/2872'
                pts_address.append(res)

            for q in waterQs:
                res = {}
                # res['pt_id'] = q.name
                res['lat'] = q.cordinate_X
                res['lng'] = q.cordinate_Y
                res['pt_type'] = 'waterlogging'
                res['pt_show_url'] = 'https://points.novaeavenue.com/point/waterlogging/3621'
                pts_address.append(res)
            
            # Todo remove
            # for q in apiQs:
            #     tot_types.append(q.name)
            
            tot_types.append('pothole')
            tot_types.append('barricade')
            tot_types.append('waterlogging')
            result['tot_types'] = tot_types
            
                
            result['pts_address'] = pts_address
            result['pin_code'] = pin_codes
            result['area'] = area
            
            resultsRoot['results'] = result
            resultsRoot['status'] = 'OK'
            
            return Response(resultsRoot, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=status.HTTP_400_BAD_REQUEST)
        
class NearByLocationApiViewAll(APIView):
    # allowed_pins = ['121004', '121005', '122102', '122103']
    # allowed_area = ['Gurgaon', 'Faridabad', 'West']
    
    
    def get(self, request, **kwargs):
        # max_distance = 10
        
        # distance = int(request.GET.get('distance', 5))
        
        # if distance <= max_distance:
        #     max_distance = distance
            
        resultsRoot = {}
        result = {}
        tot_types = []
        # pts = []
        area = []
        pin_codes=[]
        pts_address = []
        
        # groupToCheckKey = kwargs['group']
        passKwarg = kwargs['pass']
        
        print("gawd")
        if passKwarg != 'yes':
            return Response('Error', status=status.HTTP_400_BAD_REQUEST)
        
        print("Headers", request.headers)
        try:
            # token = request.GET.get('key')
            # print("gawd", token)
            # pQs = ProvidedApis.objects.get(token=token)
            # apiQs = pQs.api.filter(group=groupToCheckKey)
            # if apiQs.count() < 1:
            #     return Response(resultsRoot, status=status.HTTP_200_OK)
            qsTotal = RecievingPotholeImages.objects.count()
            qs = RecievingPotholeImages.objects.filter(Q(pothole__verified=True) | Q(barricade__verified=True) | Q(waterlogging__verified=True))
            result['pts_tot'] = qsTotal
            result['pts_tot_verified'] = qs.count()
            result['distance'] = '-1 km'
            result['api_type'] = 'HTTP'
            result['api_output_type'] = 'API'
            
            for q in qs.distinct('administrative_area_level_2').exclude(administrative_area_level_2='None'):
                area.append(q.administrative_area_level_2)
            
            for q in qs.distinct('postal_code').exclude(postal_code='None'):
                pin_codes.append(q.postal_code)
            
            potsQs = qs.exclude(pothole=None).filter(pothole__verified=True)
            barrQs = qs.exclude(barricade=None).filter(barricade__verified=True)
            waterQs = qs.exclude(waterlogging=None).filter(waterlogging__verified=True)
            for q in potsQs:
                res = {}
                res['pt_id'] = q.name
                res['lat'] = q.cordinate_X
                res['lng'] = q.cordinate_Y
                res['pt_type'] = 'pothole'
                # res['pt_img'] = q.rawImageUrl
                # res['pt_show_url'] = q.showUrl
                res['pt_show_url'] = 'https://points.novaeavenue.com/point/pothole/1643'
                pts_address.append(res)
            for q in barrQs:
                res = {}
                res['pt_id'] = q.name
                res['lat'] = q.cordinate_X
                res['lng'] = q.cordinate_Y
                res['pt_type'] = 'barricade'
                # res['pt_img'] = q.rawImageUrl
                # res['pt_show_url'] = q.showUrl
                res['pt_show_url'] = 'https://points.novaeavenue.com/point/barricade/2872'
                pts_address.append(res)

            for q in waterQs:
                res = {}
                res['pt_id'] = q.name
                res['lat'] = q.cordinate_X
                res['lng'] = q.cordinate_Y
                res['pt_type'] = 'waterlogging'
                res['pt_show_url'] = 'https://points.novaeavenue.com/point/waterlogging/3621'
                pts_address.append(res)
            # for q in qs:
                 
            # total_images = queryset.count()
            # potholes_list = bbox_json_make(queryset)
            # result = BBLocationSerializer(potholes_list, many=True).data
            
            # for q in apiQs:
            #     tot_types.append(q.name)
            result['tot_types'] = tot_types
            
                
            result['pts_address'] = pts_address
            result['pin_code'] = pin_codes
            result['area'] = area
            
            resultsRoot['results'] = result
            resultsRoot['status'] = 'OK'
            
            return Response(resultsRoot, status=status.HTTP_200_OK)
        except Exception as e:
            import traceback
            print(traceback.format_exc())
            return Response('Error', status=status.HTTP_400_BAD_REQUEST)