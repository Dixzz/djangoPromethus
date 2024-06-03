# import requests
from django.conf import settings
import pprint
import json

from django.http import HttpResponse
# from django.http import HttpRequest
# from rest_framework.response import Response
from django.http import JsonResponse
from rest_framework import status
from django.utils import timezone
# from rest_framework.response import Response

from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response

from reciever.models import STAT_TYPE



import requests
from reciever.models import AvailableApi, ProvidedApis, Ab

url = "https://sender.paplilabs.com/login_api/ManualToken/"

def get_user(token_info, url):
    """Get User"""
    payload = {}
    headers = {
    'Authorization' : token_info
    }
    response = requests.request("POST", url, headers=headers, data = payload)
    return response

def user_detail_response(token):
        # token_info    = request.headers['Authorization']
        token_info    = token 
        result        = get_user(token_info, url)
        status_code   = status.HTTP_200_OK
        json_response = result.json()
        email         = json_response['email']
        user_id       = json_response['user_id']
        user_type     = json_response['user_profile'][0]['user_type']
        middle = {
            'email'         : email,
            'user_id'       : user_id,
            'user_type'     : user_type,
            'status_code'   : status_code,
        }
        return middle

from user.models import User
from reciever.views import (
polygon_cordinates,
InitialApiView,
InitialApiViewBbox,
ReturnFileCsvToClientSenderImages,
ImageMetaApiView,
 GenerateTokenForApiView,
 UserAvailableApisApiView,
 ReceivingPointsAdminApiView,
 AvailableApisApiView,
 ReceivingPointsAdminApiViewSingle,
 recieved_pothole_images_for_country,
 ProcessSenderImages,
 GeneratePlanForApiView,
 GenerateTokenSingleApiView
)
from points.views import NearByLocationApiViewAll

from django.urls import resolve
import re, datetime

class CheckUserMiddleware:
    """Check User logged-in"""

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        """code to be execute everytime view is called"""

        response = self.process_request(request)
        if response is None:
            # If process_request returned None, we must call the next middleware or
            # the view. Note that here, we are sure that self.get_response is not
            # None because this method is executed only in new-style middlewares.
            response = self.get_response(request)

        response = self.process_response(request, response)
        return response

    def process_response(self, request, response):
        """Let's handle old-style response processing here, as usual."""
        # Do something with response, possibly using request.
        # print("process_response ", datetime.datetime.now(), request.client_user)
        
        return response

    def process_request(self, request):
        # print("process_request", datetime.datetime.now())
        pass

    def process_view(self, request, view_func, view_args, view_kwargs):
        """ checks weather user is valid or not """
        # print("process_view", datetime.datetime.now())
        # import pdb; pdb.set_trace()r
        
        print("middleware type args %s, view_func.__name__ %s" % (view_kwargs, view_func.__name__))
        print("headers %s" % request.headers)
        
        # Force APIView to work incase no `key` provided use Auth token and fetch `key`
        force_allowed_views = [
            GenerateTokenForApiView,
            UserAvailableApisApiView,
            AvailableApisApiView,
            ReceivingPointsAdminApiView,
            ReceivingPointsAdminApiViewSingle,
            recieved_pothole_images_for_country,
            ProcessSenderImages,
            polygon_cordinates,
            InitialApiView,
            ImageMetaApiView,
            InitialApiViewBbox,
            ReturnFileCsvToClientSenderImages,
            GenerateTokenSingleApiView
        ]
        
        host = None
        og = None
        try:
            if 'Origin' in request.headers.keys():
                host = request.headers['Origin']
                
            if 'Host' in request.headers.keys() :
                og   = request.headers['Host']
            else:
                og   = request.headers['Referer']
        except:
            pass
        
        print("Wew host ", host, og)
        
        if 'nocheck' in view_kwargs and 'type' in request.headers.keys() and view_func.__name__ == ProcessSenderImages.__name__:
            return None
        elif 'pass' in view_kwargs and  view_func.__name__ == NearByLocationApiViewAll.__name__ and (host == 'https://map.novaeavenue.com' or host == 'http://map.novaeavenue.com') and og == 'receiver.paplilabs.com':
            return None
        
        norms_name = map(lambda e: e.__name__, force_allowed_views)
        
        try:
            '''and view_func.__name__ != ReceivingPointsAdminApiView.__name__'''
            if view_func.__name__ in norms_name:
            # if view_func in force_allowed_views:
                
                if 'Authorization' not in request.headers.keys():
                    res = {}
                    res['error'] = 'No Authorization header provided'
                
                    return JsonResponse(data=res)
                token_info  = request.headers['Authorization']
                result      = user_detail_response(token_info)
                if result['status_code'] == 200:
                    u =  User.objects.using('users').get(email=result['email'])
                    request.client_user = u
                    request.client_user_email = u.email
                    return None
                else:
                    status_code = status.HTTP_401_UNAUTHORIZED
                    message = "Token is invalid or expired"
                    auth_type = "access"
                    detail = "Given token not valid for any token type"
                    result = {
                        'message'   : message,
                        'auth_type': auth_type,
                        'detail'    : detail,
                        'status'    : status_code,
                    }
                    result = json.dumps(result)
                    return HttpResponse(content=result, content_type='application/json', status=status.HTTP_401_UNAUTHORIZED)
                
            if request.GET.get('key') == None: 
                message = "invalid or expired"
                auth_type = "API KEY"
                detail = "No API KEY found"
                result = {
                    'message'   : message,
                    'auth_type' : auth_type,
                    'detail'    : detail,
                }
                return JsonResponse(data=result,  status=status.HTTP_401_UNAUTHORIZED)

            if request.GET.get('key') != None:
                providedApiToken = request.GET.get('key')
                pi = ProvidedApis.objects.filter(token=providedApiToken)
                
                if pi.count() > 0:
                    piObj = pi.first()
                    
                    if piObj.api.count() <= 0 and view_func.__name__ != GeneratePlanForApiView.__name__:
                        message = "invalid or expired"
                        auth_type = "API KEY"
                        detail = "Given '%s' API KEY not valid" % providedApiToken
                        result = {
                            'message'   : message,
                            'auth_type' : auth_type,
                            'detail'    : detail,
                            'status'    : status.HTTP_401_UNAUTHORIZED,
                        }
                        result = json.dumps(result)
                        return HttpResponse(content=result, content_type='application/json', status=status.HTTP_401_UNAUTHORIZED)
                    else:
                        if piObj.api_stat.stat == 'RUN':
                            abQs = Ab.objects.filter(token=piObj.token)
                            if piObj.totalRequests >= piObj.plan.maxQuota:
                                status_code = status.HTTP_403_FORBIDDEN
                                message = "KEY usage is exhausted"
                                auth_type = "API KEY"
                                detail = "Given API KEY not valid for any token type"
                                result = {
                                    'message'   : message,
                                    'auth_type' : auth_type,
                                    'detail'    : detail,
                                    'status'    : status_code,
                                }
                                result = json.dumps(result)
                                return HttpResponse(content=result, content_type='application/json', status=status.HTTP_401_UNAUTHORIZED)
                            else:
                                if piObj.plan.expiryDate != None and timezone.now() >= piObj.plan.expiryDate:
                                    status_code = status.HTTP_403_FORBIDDEN
                                    message = "KEY usage is expired"
                                    auth_type = "API KEY"
                                    detail = "Given API KEY not valid for any token type"
                                    result = {
                                        'message'   : message,
                                        'auth_type' : auth_type,
                                        'detail'    : detail,
                                        'status'    : status_code,
                                    }
                                    result = json.dumps(result)
                                    return HttpResponse(content=result, content_type='application/json', status=status_code)
                                elif abQs.filter(requested_at__gte=timezone.now() - timezone.timedelta(minutes=1)).count() >= piObj.plan.maxQuotaPerMinute:
                                    status_code = status.HTTP_403_FORBIDDEN
                                    message = "KEY usage is exhausted, current max per minute quota %s" % piObj.maxQuotaPerMinute
                                    auth_type = "API KEY"
                                    detail = "Given API KEY not valid for any token type"
                                    result = {
                                        'message'   : message,
                                        'auth_type' : auth_type,
                                        'detail'    : detail,
                                        'status'    : status_code,
                                    }
                                    result = json.dumps(result)
                                    return HttpResponse(content=result, content_type='application/json', status=status_code)
                                else:
                                    u =  User.objects.using('users').get(id=piObj.user_id)
                                    request.client_user = u
                                    request.client_user_email = u.email
                                    request.client_token = providedApiToken
                                    return None
                        else:
                            status_code = status.HTTP_403_FORBIDDEN
                            message = "KEY usage is %s" % piObj.api_stat.stat
                            auth_type = "API KEY"
                            detail = "Given API KEY not valid for any token type"
                            result = {
                                'message'   : message,
                                'auth_type' : auth_type,
                                'detail'    : detail,
                                'status'    : status_code,
                            }
                            result = json.dumps(result)
                            return HttpResponse(content=result, content_type='application/json', status=status.HTTP_401_UNAUTHORIZED)
                else:
                    status_code = status.HTTP_401_UNAUTHORIZED
                    message = "KEY is invalid or expired"
                    auth_type = "API KEY"
                    detail = "Given API KEY not valid for any token type"
                    result = {
                        'message'   : message,
                        'auth_type' : auth_type,
                        'detail'    : detail,
                        'status'    : status_code,
                    }
                    result = json.dumps(result)
                    return HttpResponse(content=result, content_type='application/json', status=status.HTTP_401_UNAUTHORIZED)
            else:   
                request.headers['Authorization']
                token_info  = request.headers['Authorization']
                # print("Oye")
                result      = user_detail_response(token_info)
                # request._result = result
                # print("res", result)
                if result['status_code'] == 200:
                    u =  User.objects.using('users').get(email=result['email'])
                    request.client_user = u
                    request.client_user_email = u.email
                else:
                    status_code = status.HTTP_401_UNAUTHORIZED
                    message = "Token is invalid or expired"
                    auth_type = "access"
                    detail = "Given token not valid for any token type"
                    result = {
                        'message'   : message,
                        'auth_type': auth_type,
                        'detail'    : detail,
                        'status'    : status_code,
                    }
                    result = json.dumps(result)
                    return HttpResponse(content=result, content_type='application/json', status=status.HTTP_401_UNAUTHORIZED)
        except KeyError as e:
            message = "Access Forbidden"
            status_code = status.HTTP_403_FORBIDDEN
            result = {
                'message'     : message,
                'status_code' : status_code
            }
            result = json.dumps(result)
            return HttpResponse(content=result, content_type='application/json', status=status_code)


    # def process_template_response(self, request, response):
    #     """return template response"""
    #     token    = request.headers['Authorization']
    #     middle = user_detail_response(token)
    #     import pdb;pdb.set_trace()
    #     response = Response(
    #         data={}, status=status.HTTP_200_OK
    #     )

    #     response.accepted_renderer = JSONRenderer()
    #     response.accepted_media_type = "application/json"
    #     response.renderer_context = {}
    #     return response


    # #     # print(request._result)
    #     # import pdb; pdb.set_trace()
    #     token_info    = request.headers['Authorization']
    #     result        = get_user(token_info, url)
    #     status_code   = status.HTTP_200_OK
    #     json_response = result.json()
    #     email         = json_response['email']
    #     user_id       = json_response['user_id']
    #     user_type     = json_response['user_profile'][0]['user_type']
    #     middle = {
    #         'eamil'         : email,
    #         'user_id'       : user_id,
    #         'user_type'     : user_type,
    #     }
    #     # middle = json.dumps(middle)
    #     return JsonResponse(middle)
        # return HttpResponse(content=middle, content_type='application/json')

    #     # print(email)
    #     # print(response['responseData'])
    #     response['email'] = email
    #     response['user_id'] = user_id
    #     # response.context_data['email'] = email
    #     # response.context_data['user_id'] = user_id
    #     # response.context_data['user_type'] = user_type

    #     return response
        # pass
        # user_value = result
        # response.
        # token_info  = request.headers['Authorization']
        # result      = get_user(token_info, url)
        # status_code = status.HTTP_200_OK
        # print(result.status_code)
        # if result.status_code == 200:
        #     json_response = result.json()
        #     email       = json_response['email']
        #     user_id     = json_response['user_id']
        #     user_type   = json_response['user_profile'][0]['user_type']
        #     # import pdb; pdb.set_trace()
        #     print(email)
        #     print(user_id)
        #     print(user_type)
            # middle = {
            #     'eamil'         : email,
            #     'user_id'       : user_id,
            #     'user_type'     : user_type,
            #     'status_code'   : status_code
            # }
        #     middle = json.dumps(middle)
        #     return HttpResponse(content=middle, content_type='application/json')
        #     return Response(content=middle, content_type='application/json')













#     def process_exception(request, exception):
#         pass



# class CheckUserMiddleware:
#     """Check User logged-in"""

#     def __init__(self, get_response):
#         self.get_response = get_response

#     def __call__(self, request):
#         """code to be execute everytime view is called"""

#         response = self.get_response(request)
#         return response
    
#     def process_view(self, request, view_func, view_args, view_kwargs):
#         """ checks weather user is valid or not """
#         token_info  = request.headers['Authorization']
#         request._result = get_user(token_info, url)
#         result      = get_user(token_info, url)
#         if result.status_code == 200:
#             return None
#         else:
#             status_code = status.HTTP_401_UNAUTHORIZED
#             message = "Token is invalid or expired"
#             token_type = "access"
#             detail = "Given token not valid for any token type"
#             result = {
#                 'message'   : message,
#                 'token_type': token_type,
#                 'detail'    : detail,
#                 'status'    : status_code,
#             }
#             result = json.dumps(result)
#             return HttpResponse(content=result, content_type='application/json')

#     def process_template_response(self, request, response):
#         """return template response"""
#         # print(request._result)
#         # import pdb; pdb.set_trace()
#         token_info    = request.headers['Authorization']
#         result        = get_user(token_info, url)
#         status_code   = status.HTTP_200_OK
#         json_response = result.json()
#         email         = json_response['email']
#         user_id       = json_response['user_id']
#         user_type     = json_response['user_profile'][0]['user_type']
#         # print(email)
#         # print(response['responseData'])
#         response['email'] = email
#         response['user_id'] = user_id
#         # response.context_data['email'] = email
#         # response.context_data['user_id'] = user_id
#         # response.context_data['user_type'] = user_type
#         return response