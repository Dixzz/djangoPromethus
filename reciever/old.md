# Documentation

## STANDARD METHOD FOR CREATING Api

````python
# ANCHOR Working
# SECTION
# ---------------------------------------------------------------------------- #
#                                   STANDARD                                   #
# ---------------------------------------------------------------------------- #
# TODO
# 
# API Name
# API Name
# 
# 
# CODE # FIXME
# CODE # STUB
# 
# NOTE
# REVIEW
# ---------------------------------------------------------------------------- #
````

### Methods Used

````python
# ANCHOR  Currently Working
# TODO bub
# FIXME
# STUB
# NOTE
# REVIEW
# SECTION
# SUB

# ---------------------------------------------------------------------------- #
#                                 Main Heading                                 #
# ---------------------------------------------------------------------------- #

# ---------------------------------------------------------------------------- #
# Subheaader
````






# Depricated API

### STATE APIs

**Views.py**

````python
# SECTION STATE
# ---------------------------------------------------------------------------- #
#                                     STATE                                    #
# ---------------------------------------------------------------------------- #
# REVIEW  
# From Country we shall take out state rather creating a direct Api
# Keeping it for further Usage

class recieved_pothole_images_for_state(APIView):
    """Displaying all the pothole images 
    for state which are processed as a 
    pothole present in them"""

    def post(self, request):
        potholes_list = []
        try:
            ## for getting user_id
            token    = request.headers['Authorization'] 
            middle = user_detail_response(token)
            ## logic for state
            data = request.data
            name_of_state = data['state_name']
            total_state_images = RecievingPotholeImages.objects.filter(administrative_area_level_1=name_of_state).count()
            print(total_state_images)
            state_images = RecievingPotholeImages.objects.filter(administrative_area_level_1=name_of_state)
            potholes_list = bbox_json_make(state_images)
            results = SerpyBBLocationSerializer(potholes_list, many=True).data
            status_code = status.HTTP_200_OK
            output = {
                'results' : results,
                'total_count' : total_state_images,
                'status' : status_code,
                'user_id' : middle
            }
            return Response(output, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=status.HTTP_400_BAD_REQUEST)


# updated filled
### func3 for state API
#                   return images that have potholes in it and if filled is false
#                   try catch statements

### COMPLETED
class MappingState(APIView):
    """ Mapping All Images """
    def post(self, request):
        try:
            data = request.data
            # pdb.set_trace()
            mapped_images = []
            name_of_state = data['state_name']
            images = PotholeUpdationImages.objects.filter(administrative_area_level_1=name_of_state)
            # pdb.set_trace()
            for image in images:
                image = RecievingPotholeImages.objects.filter(name = image).get()
                serializer = RecievingPotholeImagesSerializer(instance = image)
                mapped_images.append(serializer.data)
            return Response(mapped_images, status=status.HTTP_200_OK)
        except Exception as e:
            return Response(e, status=status.HTTP_400_BAD_REQUEST)

### INCOMPLETE
class Mapping_photos_select_related_state_count_without_filled(APIView):
    """Counting Potholes Present in each state"""

    def post(self, requests):
        try:
            data = requests.data
            name_of_state = data['state_name']
            mapped_images_qs = PotholeUpdationImages.objects.select_related('name').all().filter(is_filled = 'False')
            get_count_images = mapped_images_qs.filter(name__state_name__contains=name_of_state).count()

            return Response(get_count_images)
        except Exception as e:
            responseData = e
            return Response(responseData, status=status.HTTP_200_OK)

### INCOMPLETE
class Mapping_photos_select_related_state_count_with_filled(APIView):
    """Counting Potholes Present in each state"""

    def post(self, requests):
        try:
            data = requests.data
            name_of_state = data['state_name']
            mapped_images_qs = PotholeUpdationImages.objects.select_related('name').all().filter(is_filled = 'True')
            get_count_images = mapped_images_qs.filter(name__state_name__contains=name_of_state).count()

            return Response(get_count_images)
        except Exception as e:
            responseData = e
            return Response(responseData, status=status.HTTP_200_OK)


# ---------------------------------------------------------------------------- #
````

**urls.py**

````python
    ## STATE
    marked without filled
    path('state/', views.recieved_pothole_images_for_state.as_view()),
    path('MState/', views.MappingState.as_view()),
````


## Extra APIs

_views.py_

````python

"""Documentation
https://docs.djangoproject.com/en/3.0/ref/contrib/gis/geoquerysets/#std:fieldlookup-distance_lt
"""

class Poly_bbcontains(APIView):
    def post(self, requests):
        pdb.set_trace()
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__bbcontains=geom)
                total_images = RecievingPotholeImages.objects.filter(point__bbcontains=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_bboverlaps(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__bboverlaps=geom)
                total_images = RecievingPotholeImages.objects.filter(point__bboverlaps=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)
"""

"""
class Poly_contained(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__contained=geom)
                total_images = RecievingPotholeImages.objects.filter(point__contained=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_contains(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__contains=geom)
                total_images = RecievingPotholeImages.objects.filter(point__contains=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_contains_properly(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__contains_properly=geom)
                total_images = RecievingPotholeImages.objects.filter(point__contains_properly=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_covers(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__covers=geom)
                total_images = RecievingPotholeImages.objects.filter(point__covers=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_crosses(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__crosses=geom)
                total_images = RecievingPotholeImages.objects.filter(point__crosses=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_disjoit(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__disjoint=geom)
                total_images = RecievingPotholeImages.objects.filter(point__disjoint=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_equals(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__equals=geom)
                total_images = RecievingPotholeImages.objects.filter(point__equals=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_exact(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point=geom)
                total_images = RecievingPotholeImages.objects.filter(point=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_intersects(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__intersects=geom)
                total_images = RecievingPotholeImages.objects.filter(point__intersects=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_isvalid(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__isvalid=geom)
                total_images = RecievingPotholeImages.objects.filter(point__isvalid=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_overlaps(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__Overlaps=geom)
                total_images = RecievingPotholeImages.objects.filter(point__Overlaps=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)
    
class Poly_touches(APIView):
    def post(self, requests):
        potholes_list = []
        pdb.set_trace()
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__touches=geom)
                total_images = RecievingPotholeImages.objects.filter(point__touches=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_within(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            pdb.set_trace()
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__within=geom)
                total_images = RecievingPotholeImages.objects.filter(point__within=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_left(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__left=geom)
                total_images = RecievingPotholeImages.objects.filter(point__left=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_right(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__right=geom)
                total_images = RecievingPotholeImages.objects.filter(point__right=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_overlaps_left(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__overlaps_left=geom)
                total_images = RecievingPotholeImages.objects.filter(point__overlaps_left=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_overlaps_right(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__overlaps_right=geom)
                total_images = RecievingPotholeImages.objects.filter(point__overlaps_right=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_overlaps_above(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__overlaps_above=geom)
                total_images = RecievingPotholeImages.objects.filter(point__overlaps_above=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_overlaps_below(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__overlaps_below=geom)
                total_images = RecievingPotholeImages.objects.filter(point__overlaps_below=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_strickly_above(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__strictly_above=geom)
                total_images = RecievingPotholeImages.objects.filter(point__strictly_above=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

class Poly_strickly_below(APIView):
    def post(self, requests):
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__strictly_below=geom)
                total_images = RecievingPotholeImages.objects.filter(point__strictly_below=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = BBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)

````

_urls.py_

````python
path('bbcontains/', views.Poly_bbcontains.as_view()),
path('bboverlaps/', views.Poly_bboverlaps.as_view()),
path('contained/', views.Poly_contained.as_view()),
path('contains/', views.Poly_contains.as_view()),
path('contains_properly/', views.Poly_contains_properly.as_view()),
path('covers/', views.Poly_covers.as_view()),
path('crosses/', views.Poly_crosses.as_view()),
path('disjoit/', views.Poly_disjoit.as_view()),
path('equals/', views.Poly_equals.as_view()),
path('exact/', views.Poly_exact.as_view()),
path('intersects/', views.Poly_intersects.as_view()),
path('isvalid/', views.Poly_isvalid.as_view()),
path('overlaps/', views.Poly_overlaps.as_view()),
path('touches/', views.Poly_touches.as_view()),
path('within/', views.Poly_within.as_view()),
path('left/', views.Poly_left.as_view()),
path('right/', views.Poly_right.as_view()),
path('overlaps_left/', views.Poly_overlaps_left.as_view()),
path('overlaps_right/', views.Poly_overlaps_right.as_view()),
path('overlaps_above/', views.Poly_overlaps_above.as_view()),
path('overlaps_below/', views.Poly_overlaps_below.as_view()),
path('strickly_above/', views.Poly_strickly_above.as_view()),
path('strickly_below/', views.Poly_strickly_below.as_view()),

````


### BOUNDING BOX (Serpy)

_views.py_

````python

#NOTE DEPRICATED
class serpyPolygon_cordinates(APIView):
    """return bounding box for only textual data
    with respect to lat long
    """

    def post(self, requests):
        # pdb.set_trace()
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            # import pdb; pdb.set_trace()
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__coveredby=geom)
                total_images = RecievingPotholeImages.objects.filter(point__coveredby=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = SerpyBBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=status.HTTP_400_BAD_REQUEST)

#NOTE DEPRICATED
class serpyDetailPolygon_cordinates(APIView):
    """DETAIL serpy api for recieving data with image"""

    def post(self, requests):
        # pdb.set_trace()
        potholes_list = []
        try:
            data = requests.data ## get token for of the user
            # import pdb; pdb.set_trace()
            serializers = BoundingBoxImageSerializer(data = data)
            if serializers.is_valid():
                bbox = (data['sw_longitude'], data['sw_latitude'], data['ne_longitude'], data['ne_latitude'])
                geom = Polygon.from_bbox(bbox)
                prep_poly = geom.prepared
                queryset = RecievingPotholeImages.objects.filter(point__coveredby=geom)
                total_images = RecievingPotholeImages.objects.filter(point__coveredby=geom).count()
                print(total_images)
                potholes_list = bbox_json_make(queryset)
            result = SerpyDetailBBLocationSerializer(potholes_list, many=True).data
            return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=HTTP_400_BAD_REQUEST)
````


### LOCATION AND NEARBY SERPY

````python

# NOTE DEPRICATED
class LocationsofAllPotholesAndroidPostApiView(APIView):
    """ Send cordinates of all the potholes in Android """

    def post(self, request):
        import pdb; pdb.set_trace()
        ## for getting user_id
        token    = request.headers['Authorization'] 
        middle = user_detail_response(token)
        ## logic for nearby locations
        near_by_potholes_list = []
        data = request.data
        serializers = NearBylocationSerializer(data = data)
        if serializers.is_valid():
            user_location = Point(x=float(data['cordinate_Y']), y=float(data['cordinate_X']), srid=4326)
            # query = RecievingPotholeImages.objects.annotate(distance=Distance('point', user_location)).order_by('distance')[0:200]
            # query = RecievingPotholeImages.objects.all()[:10]
            total_count = RecievingPotholeImages.objects.all().count()
            print(total_count)
            query = RecievingPotholeImages.objects.all()
            status_code = status.HTTP_200_OK
            for cordinate in query:
                #### distance calculations
                oldPoint = Point(x=cordinate.cordinate_Y,y=cordinate.cordinate_X,srid=4326)
                distance = user_location.distance(oldPoint)
                # import pdb;pdb.set_trace()
                distance_in_km = distance * 100
                near_by_potholes_list.append({
                    'distance'                   : distance_in_km,
                    'name'                       : cordinate.name,
                    'area'                       : cordinate.area,
                    'number'                     : cordinate.number,
                    'cordinate_X'                : cordinate.cordinate_X,
                    'cordinate_Y'                : cordinate.cordinate_Y,
                    'RCreated_date'              : cordinate.RCreated_date,
                    'ROwner'                     : cordinate.ROwner,
                    'agency_name'                : cordinate.agency_name,
                    'rawImage'                   : cordinate.rawImage,
                    'maskedImage'                : cordinate.maskedImage,
                    'premise'                    : cordinate.premise,
                    'park'                       : cordinate.park,
                    'airport'                    : cordinate.airport,
                    'natural_feature'            : cordinate.natural_feature,
                    'postal_code'                : cordinate.postal_code,
                    'plus_code'                  : cordinate.plus_code,
                    'subpremise'                 : cordinate.subpremise,
                    'neighborhood'               : cordinate.neighborhood,
                    'sublocality_level_1'        : cordinate.sublocality_level_1,
                    'sublocality_level_2'        : cordinate.sublocality_level_2,
                    'sublocality_level_3'        : cordinate.sublocality_level_3,
                    'sublocality_level_4'        : cordinate.sublocality_level_4,
                    'sublocality_level_5'        : cordinate.sublocality_level_5,
                    'locality'                   : cordinate.locality,
                    'colloquial_area'            : cordinate.colloquial_area,
                    'administrative_area_level_1': cordinate.administrative_area_level_1,
                    'administrative_area_level_2': cordinate.administrative_area_level_2,
                    'administrative_area_level_3': cordinate.administrative_area_level_3,
                    'administrative_area_level_4': cordinate.administrative_area_level_4,
                    'administrative_area_level_5': cordinate.administrative_area_level_5,
                    'country'                    : cordinate.country,
                    'intersection'               : cordinate.intersection,
                    'route'                      : cordinate.route,
                    'street_address'             : cordinate.street_address,
                    'formatted_address'          : cordinate.formatted_address,
            })
                oldPoint = Point(x = 0.0,y = 0.0)
                distance = 0
                distance_in_km = 0
            
            results = SendNearByLocationSerializer(near_by_potholes_list, many=True).data
            output = {
                'results' : results,
                'total_count' : total_count,
                'status' : status_code,
                'user_id' : middle,
            }
            return Response(output, status=status.HTTP_200_OK)



# NOTE DEPRICATED
class SerpyNearByLocationApiView(APIView):
    """ Send cordinates of nearby location 
    potholes with respect to their distance"""

    def post(self, request):
        pdb.set_trace()
        potholes_list = []
        data = request.data
        serializers = NearBylocationSerializer(data = data)
        try:
            if serializers.is_valid():
                longitude = data['cordinate_Y'] 
                latitude = data['cordinate_X']
                under_distance = int(data['under_distance'])
                user_location = Point(x=float(data['cordinate_Y']), y=float(data['cordinate_X']), srid=4326)
                pnt = GEOSGeometry('POINT({} {})'.format(longitude,latitude), srid=4326)
                queryset = RecievingPotholeImages.objects.filter(point__distance_lte=(pnt,D(km=under_distance)))[0:500]
                potholes_list = bbox_json_make(queryset)
                result = SerpyBBLocationSerializer(potholes_list, many=True).data
                return Response(result, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status=status.HTTP_400_BAD_REQUEST)


````

### OLD LeafLet Config

````python

 ############################## Leaflet ##################################

LEAFLET_CONFIG = {
    'DEFAULT_CENTER' : (-0.23, 36.87),
    'DEFAULT_ZOOM' : 5,
    'MAX_ZOOM' : 20,
    'MIN_ZOOM' : 3,
    'SCALE' : 'both',
    'ATTRIBUTION_PREFIX' : 'QuaMaps | Papli Labs',

}

````

### CELERY CONFIG

````python

 ############################## Celery RabbitMQ ##################################

## High Cpu Usage Doc:
# https://medium.com/@alaminopu.me/solving-rabbitmq-high-cpu-memory-usages-problem-with-celery-d4172ba1c6b3



# celery -A consumer worker -l ERROR --autoscale=50,5 --without-heartbeat --without-gossip --without-mingle


BROKER_HOST = '35.224.151.188'
BROKER_PORT = 5672
BROKER_USER = "testUser"
BROKER_PASSWORD = "harebol@123"
BROKER_VHOST = "Vhost"

CELERY_BROKER_URL = 'pyamqp://papli:harebol@123@35.224.151.188:5672'

CELERY_ACCEPT_CONTENT = ['json']
CELERY_TASK_SERIALIZER = 'json'
CELERYBEAT_SCHEDULER = 'djcelery.schedulers.DatabaseScheduler'
# CELERY_IGNORE_RESULT = True

 ############################## Celery Reddis ##################################


Why to use CELERYBEAT_SCHEDULE
https://stackoverflow.com/a/19679588/7999665

Reference Link Used
https://stackoverflow.com/a/20119905/7999665

Rather than running differently
   $ celery -A reciever beat

Use
    CELERYBEAT_SCHEDULE = {
    # crontab(hour=0, minute=0, day_of_week='saturday')
    'schedule-name': {  # example: 'file-backup' 
        'task': 'some_django_app.tasks....',  # example: 'files.tasks.cleanup' 
        'schedule': crontab(...)
    },
}

Then Run command

    $ sudo service redis-server restart

    $ celery -A proj worker -B -l info

https://stackoverflow.com/a/37851090/7999665


Periodic Task Schedules
---------------------------
http://docs.celeryproject.org/en/v2.3.3/userguide/periodic-tasks.html#id4

CELERYBEAT_SCHEDULE = {
    # Executes every Monday morning at 7:30 A.M
    "every-monday-morning": {
        "task": "tasks.add",
        "schedule": crontab(hour=7, minute=30, day_of_week=1),
        "args": (16, 16),
    },
}

CELERY_BEAT_SCHEDULE = {
    'add': {
       'task': 'proj.taskfilename.taskname',
       'schedule': crontab(minute=0, hour='*'),
       'args': (5,5)
    }
}


reciever.tasks.job_update_cordinates


Reference Link : https://youtu.be/JzTdURgzOpw
Note:
In case of periodic task we wont write inside CELERYBEAT_SCHEDULE
rather write with @periodic_task decorator



Important Reference Link to be considered
https://www.linode.com/docs/development/python/task-queue-celery-rabbitmq/
https://simpleisbetterthancomplex.com/tutorial/2017/08/20/how-to-use-celery-with-django.html
https://realpython.com/asynchronous-tasks-with-django-and-celery/ [Imp]

Installation Procedure to be followed
$ sudo apt-get update
$ sudo apt-get install redis-server

Problems need to be fixed
---------------------------
1. Code running on distributed servers are not working

Configure it to work simuntanously with 2 servers


# from celery.schedules import crontab

# BROKER_URL = 'redis://127.0.0.1:6379'
# CELERY_RESULT_BACKEND = 'redis://127.0.0.1:6379'
# CELERY_ACCEPT_CONTENT = ['application/json']
# CELERY_TASK_SERIALIZER = 'json'
# CELERY_RESULT_SERIALIZER = 'json'
# CELERY_TIMEZONE = 'Asia/Kolkata'
# CELERY_ENABLE_UTC = False
# CELERYBEAT_SCHEDULER = 'djcelery.schedulers.DatabaseScheduler'

# CELERYBEAT_SCHEDULE = {
    # 'update_cordinates_for_point_field': {
    #     'task': 'reciever.tasks.job_update_cordinates',
    #     # 'schedule': crontab(minute=0, hour=6, day_of_month='*'),
    #     'schedule': crontab(minute='*'),
    #     "args": (16, 16)
    # },
    # 'testing': {
    #     'task': 'reciever.tasks.test_celery_beat',
    #     # 'schedule': crontab(minute=0, hour=6, day_of_month='*'),
    #     'schedule': crontab(minute='*'),
    #     "args": (16, 16)
    # },
# }


````





