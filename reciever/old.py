
# ---------------------------------------------------------------------------- #
#                                     Extra                                    #
# ---------------------------------------------------------------------------- #


#################### FROM SENDER AUTHENTICATION #######################

# url = "http://34.87.133.221/login_api/ManualToken/"

# def get_user(token_info, url):
#     """Get User"""
#     payload = {}
#     headers = {
#     'Authorization' : token_info
#     }
#     response = requests.request("POST", url, headers=headers, data = payload)
#     return response

# def user_detail_response(token):
#         # token_info    = request.headers['Authorization']
#         token_info    = token 
#         result        = get_user(token_info, url)
#         status_code   = status.HTTP_200_OK
#         json_response = result.json()
#         email         = json_response['email']
#         user_id       = json_response['user_id']
#         user_type     = json_response['user_profile'][0]['user_type']
#         middle = {
#             'eamil'         : email,
#             'user_id'       : user_id,
#             'user_type'     : user_type,
#         }
#         return middle


# class nearByLocation(generic.ListView):
#     """ near by potholes distances 'Location' based on the basis of cordinates """
#     model = PotholeUpdationImages
#     context_object_name = 'shops'
#     queryset = PotholeUpdationImages.objects.annotate(distance=Distance('location',
#     user_location)
#     ).order_by('distance')[0:10]
#     return Response(responseData, status=status.HTTP_200_OK)
"""
Returning Data for nearby location can be done by two ways
1. GeoJSON Serializer

By using https://docs.djangoproject.com/en/3.0/ref/contrib/gis/serializers/

## Example Notation ##
serialize('geojson', City.objects.all(),
          geometry_field='point',
          fields=('name',))

### for our data
            responseData = serialize('geojson', query,
                                        geometry_field='point',
                                        fields=('name','area','number','country_name'))

## By using serializers ##

"get value from object distance django" Google search

Take out near by distance with respect to near by km
https://stackoverflow.com/a/43935359/7999665

https://gis.stackexchange.com/a/224530/157732
"""

# ######################### LOGGING ####################

# def get_client_ip(request):
#     x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
#     if x_forwarded_for:
#         ip = x_forwarded_for.get_client_ipsplit(',')[0]
#     else:
#         ip = request.META.get('REMOTE_ADDR')
#     return ip


# class get_user_location(APIView):
#     """Get the user location from requests called """

#     def get(self, request):
#         get_client_ip(request)




# ---------------------------------------------------------------------------- #







# ############################### Folium ##################################

# def folium_map(request):
#     return render(request, 'map.html')

# ############################### FrontEnd ##################################




############################### Backend ##################################

### func6 for 'getting tokens for agencies and user'

# def get_token_for_users(token_value):
#     """get token for each users """
#     SenderUrl = "http://34.93.157.123:8000/login_api/checkToken/"

#     headers = {
#       'Authorization': 'token {}'.format(token_value),
#     }

#     response = requests.request("GET", SenderUrl, headers = headers)
#     return response.text.encode('utf8')