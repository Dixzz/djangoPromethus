

# def mapping_json(queryset):
#     mapping_list = []
#     for value in queryset:
#         mapping_list.append({
#         'name'                        :value.name,
#         'number'                      :value.number,
#         'cordinate_X'                 :value.cordinate_X,
#         'cordinate_Y'                 :value.cordinate_Y,
#         'RCreated_date'               :value.created_date,
#         'ROwner'                      :value.ROwner,
#         'agency_name'                 :value.agency_name,
#         'rawImage'                    :value.rawImage,
#         'maskedImage'                 :value.maskedImage,
#         'point'                       :value.point,
#         'premise'                     :value.premise,
#         'park'                        :value.park,
#         'airport'                     :value.airport,
#         'natural_feature'             :value.natural_feature,
#         'postal_code'                 :value.postal_code,
#         'plus_code'                   :value.plus_code,
#         'subpremise'                  :value.subpremise,
#         'neighborhood'                :value.neighborhood,
#         'sublocality_level_1'         :value.sublocality_level_1,
#         'sublocality_level_2'         :value.sublocality_level_2,
#         'sublocality_level_3'         :value.sublocality_level_3,
#         'sublocality_level_4'         :value.sublocality_level_4,
#         'sublocality_level_5'         :value.sublocality_level_5,
#         'locality'                    :value.locality,
#         'colloquial_area'             :value.colloquial_area,
#         'administrative_area_level_1' :value.administrative_area_level_1,
#         'administrative_area_level_2' :value.administrative_area_level_2,
#         'administrative_area_level_3' :value.administrative_area_level_3,
#         'administrative_area_level_4' :value.administrative_area_level_4,
#         'administrative_area_level_5' :value.administrative_area_level_5,
#         'country'                     :value.country,
#         'intersection'                :value.intersection,
#         'route'                       :value.route,
#         'street_address'              :value.street_address,
#         'formatted_address'           :value.formatted_address
#     })
#     return potholes_list



### INCOMPLETE
# class Mapping_photos_select_related_country(APIView):
#     """Mapping country image together"""

#     def post(self, requests):
#         try:
#             data = requests.data
#             name_of_country = data['country_name']
#             mapped_images_qs = PotholeUpdationImages.objects.select_related('name').all().filter(is_filled = 'False')
#             get_images = mapped_images_qs.filter(name__country_name__contains=name_of_country)
            
#             mapped_images = []
#             for image in get_images:
#                 mapped_images.append({
#                     'name'            : image.name,
#                     'updated_image'   : image.updated_image,
#                     'cordinate_X'     : image.cordinate_X,
#                     'cordinate_Y'     : image.cordinate_Y,
#                     'road_name'       : image.road_name,
#                     'created_date'    : image.created_date,
#                     'is_filled'       : image.is_filled,
#                     'checked'         : image.checked,
#                     'agency'          : image.name.agency_name,
#                     'rawImage'        : image.name.rawImage,
#                     'maskedImage'     : image.name.maskedImage,
#             })

#             results = MappingPhotosSelectRelateSerializer(mapped_images, many=True).data
#             return Response(results)
#         except Exception as e:
#             responseData = e
#             return Response(responseData, status=status.HTTP_200_OK)



# class Mapping_photos_select_related_state_updated(APIView):
#     """Mapping state image together [Updated Images]"""

#     def post(self, requests):
#         try:
#             data = requests.data
#             name_of_state = data['state_name']
#             mapped_images_qs = PotholeUpdationImages.objects.select_related('name').all().filter(is_filled = 'False')
#             get_images = mapped_images_qs.filter(name__state_name__contains=name_of_state)
            
#             mapped_images = []
#             for image in get_images:
#                 mapped_images.append({
#                     'name'            : image.name,
#                     'updated_image'   : image.updated_image,
#                     'cordinate_X'     : image.cordinate_X,
#                     'cordinate_Y'     : image.cordinate_Y,
#                     'road_name'       : image.road_name,
#                     'created_date'    : image.created_date,
#                     'is_filled'       : image.is_filled,
#                     'checked'         : image.checked,
#                     'agency'          : image.name.agency_name,
#                     'rawImage'        : image.name.rawImage,
#                     'maskedImage'     : image.name.maskedImage,
#             })

#             results = MappingPhotosSelectRelateSerializer(mapped_images, many=True).data
#             return Response(results)
#         except Exception as e:
#             responseData = e
#             return Response(responseData, status=status.HTTP_200_OK)



# class Mapping_photos_select_related(APIView):
#     """Mapping single image together"""

#     def post(self, requests):
#         try:
#             data = requests.data
#             name_of_image = data['name']
#             mapped_images_qs = PotholeUpdationImages.objects.select_related('name').filter(name = name_of_image).filter(is_filled = 'False')
#             mapped_images = []
#             # breakpoint()
#             for image in mapped_images_qs:
#                 mapped_images.append({
#                     'name'            : image.name,
#                     'updated_image'   : image.updated_image,
#                     'cordinate_X'     : image.cordinate_X,
#                     'cordinate_Y'     : image.cordinate_Y,
#                     'road_name'       : image.road_name,
#                     'created_date'    : image.created_date,
#                     'is_filled'       : image.is_filled,
#                     'checked'         : image.checked,
#                     'agency'          : image.name.agency_name,
#                     'rawImage'        : image.name.rawImage,
#                     'maskedImage'     : image.name.maskedImage,
#             })

#             results = MappingPhotosSelectRelateSerializer(mapped_images, many=True).data
#             return Response(results)
#         except Exception as e:
#             responseData = e
#             return Response(responseData, status=status.HTTP_200_OK)

### func1 for joining all the photos together
#                  return record clicked all the images will be joined
#                   try catch statements

# class Mapping_photos_select_related_all(APIView):
#     """Mapping all images together
    
#     """
#     """
#     Things that need to be fixed
#     map all the images
#     updated image
#     is_filled
#     raw image
#     masked image

#     updated image data along with its own geocoding
#     distance calculation and how its marked check their feets
#     """
#     def post(self, requests):
#         try:
#             mapped_images_qs = PotholeUpdationImages.objects.select_related('name').all().filter(is_filled = 'False')
#             mapped_images = []
#             for image in mapped_images_qs:
#                 mapped_images.append({
#                     # 'name'            : image.name,
#                     # 'updated_image'   : image.updated_image,
#                     # 'cordinate_X'     : image.cordinate_X,
#                     # 'cordinate_Y'     : image.cordinate_Y,
#                     # 'road_name'       : image.road_name,
#                     # 'created_date'    : image.created_date,
#                     # 'is_filled'       : image.is_filled,
#                     'checked'         : image.checked,
#                     # 'agency'          : image.name.agency_name,
#                     # 'rawImage'        : image.name.rawImage,
#                     # 'maskedImage'     : image.name.maskedImage,
#                     'name'                       : cordinate.name,
#                     'area'                       : cordinate.area,
#                     'number'                     : cordinate.number,
#                     'cordinate_X'                : cordinate.cordinate_X,
#                     'cordinate_Y'                : cordinate.cordinate_Y,
#                     'RCreated_date'              : cordinate.RCreated_date,
#                     'ROwner'                     : cordinate.ROwner,
#                     'agency_name'                : cordinate.agency_name,
#                     'rawImage'                   : cordinate.rawImage,
#                     'maskedImage'                : cordinate.maskedImage,
#                     'premise'                    : cordinate.premise,
#                     'park'                       : cordinate.park,
#                     'airport'                    : cordinate.airport,
#                     'natural_feature'            : cordinate.natural_feature,
#                     'postal_code'                : cordinate.postal_code,
#                     'plus_code'                  : cordinate.plus_code,
#                     'subpremise'                 : cordinate.subpremise,
#                     'neighborhood'               : cordinate.neighborhood,
#                     'sublocality_level_1'        : cordinate.sublocality_level_1,
#                     'sublocality_level_2'        : cordinate.sublocality_level_2,
#                     'sublocality_level_3'        : cordinate.sublocality_level_3,
#                     'sublocality_level_4'        : cordinate.sublocality_level_4,
#                     'sublocality_level_5'        : cordinate.sublocality_level_5,
#                     'locality'                   : cordinate.locality,
#                     'colloquial_area'            : cordinate.colloquial_area,
#                     'administrative_area_level_1': cordinate.administrative_area_level_1,
#                     'administrative_area_level_2': cordinate.administrative_area_level_2,
#                     'administrative_area_level_3': cordinate.administrative_area_level_3,
#                     'administrative_area_level_4': cordinate.administrative_area_level_4,
#                     'administrative_area_level_5': cordinate.administrative_area_level_5,
#                     'country'                    : cordinate.country,
#                     'intersection'               : cordinate.intersection,
#                     'route'                      : cordinate.route,
#                     'street_address'             : cordinate.street_address,
#                     'formatted_address'          : cordinate.formatted_address,
#             })

#             results = MappingPhotosSelectRelateSerializer(mapped_images, many=True).data
#             return Response(results)
#         except Exception as e:
#             responseData = e
#             return Response(responseData, status=status.HTTP_200_OK)


################# ################# ################# 


### func9 for joining single photos together
# class MappingSinglePhoto(APIView):
#     """ Mapping Single Image """
#     mapped_images = []
#     def post(self, request):
#         try:
#             data = request.data
#             # import pdb; pdb.set_trace()
#             name_of_image = data['name']
#             mapped_images_qs = PotholeUpdationImages.objects.select_related('name').filter(name = name_of_image).filter(is_filled = 'True')
#             for image in mapped_images_qs:
#                 serializer = RecievingPotholeImagesSerializer(instance = image)
#                 pdb.set_trace()
#                 serializer.data
#             return Response(serializer.data)
#         except Exception as e:
#             print(e)


# class RecievingPotholeImagesAPIView(APIView):
#     """getting all the images from Processed Images and Mapping it"""


#     def post(self, request):
#         try:
#             # import pdb; pdb.set_trace()
#             data = request.data
#             serializer = RecievingPotholeImagesSerializer(data = data)
#             if serializer.is_valid():
#                 data['point'] = Point(x=float(data['cordinate_Y']), y=float(data['cordinate_X']), srid=4326)
#                 # pdb.set_trace()
#                 name_of_object = data['name']
#                 test = ConversionTable(name = name_of_object).save()
#                 serializer.save()
#                 return Response(serializer.data, status=status.HTTP_200_OK)
#             responseData = serializer.errors
#             return Response(responseData, status=status.HTTP_200_OK)
#         except Exception as e:
#             responseData = e
#             return Response(responseData, status=status.HTTP_200_OK)


########## ##### MAP FOR FILLED POTHOLES ##############



### INCOMPLETE
# class Mapping_photos_select_related_country_count_without_filled(APIView):
#     """Counting Potholes Present in each country"""

#     def post(self, requests):
#         try:
#             data = requests.data
#             name_of_country = data['country_name']
#             mapped_images_qs = PotholeUpdationImages.objects.select_related('name').all().filter(is_filled = 'False')
#             get_count_images = mapped_images_qs.filter(name__country_name__contains=name_of_country).count()

#             return Response(get_count_images)
#         except Exception as e:
#             responseData = e
#             return Response(responseData, status=status.HTTP_200_OK)

### INCOMPLETE
# class Mapping_photos_select_related_country_count_with_filled(APIView):
#     """Counting Potholes Filled in each country"""

#     def post(self, requests):
#         try:
#             data = requests.data
#             name_of_country = data['country_name']
#             mapped_images_qs = PotholeUpdationImages.objects.select_related('name').all().filter(is_filled = 'True')
#             get_count_images = mapped_images_qs.filter(name__country_name__contains=name_of_country).count()

#             return Response(get_count_images)
#         except Exception as e:
#             responseData = e
#             return Response(responseData, status=status.HTTP_200_OK)