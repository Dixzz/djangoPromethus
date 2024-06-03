from django.shortcuts import render
from reciever import models as RecMod
from rest_framework.response import Response
from rest_framework.views import APIView
from reciever import serializers as RecSer
from rest_framework import status
from update import models, serializers
from reciever.sender_auth import get_user, user_detail_response


# ---------------------------------------------------------------------------- #
#                           Reciever UPDATE Outline                          #
# ---------------------------------------------------------------------------- #
# SUB UPDATE






# ---------------------------------------------------------------------------- #




# SECTION UPDATE
# ---------------------------------------------------------------------------- #
#                                    Update                                    #
# ---------------------------------------------------------------------------- #

### pass the parameter of distance between two potholes
class UpdatePotholeImageAPIView(APIView):
    """Updated Pothole Image with Name"""

    # pdb.set_trace()
    # data = request.data
    # image_name = data['name']
    def get_object(self, image_name):
        try:
            return RecMod.RecievingPotholeImages.objects.filter(name = image_name).get()
        except RecMod.RecievingPotholeImages.DoesNotExist:
            raise status.HTTP_404_NOT_FOUND
    
    def get_object_updated(self, image_name):
        try:
            return RecMod.PotholeUpdationImages.objects.filter(name = image_name).get()
        except RecMod.PotholeUpdationImages.DoesNotExist:
            pass

    def put(self, request, format=None):
        # pdb.set_trace()
        ## for getting user_id
        token    = request.headers['Authorization']
        middle = user_detail_response(token)
        ## Update Logic
        data = request.data
        image_name = data['name']
        get_name_of_image = self.get_object(image_name)
        already_present_image = self.get_object_updated(image_name)
        # REVIEW CHECK here what's happening?        
        if already_present_image:
            serializer = RecSer.UpdationPotholeImageSerializer(already_present_image ,data=data)
            if serializer.is_valid():
                serializer.save()
                status_code = status.HTTP_200_OK
                output = {
                    'status' : status_code,
                    'updated' : serializer.data,
                    'middle' : middle
                }
                return Response(output, status=status.HTTP_200_OK)
        else:
            serializer = RecSer.UpdationPotholeImageSerializer(data=data)
            if serializer.is_valid():
                serializer.save()
                status_code = status.HTTP_200_OK
                output = {
                    'status' : status_code,
                    'updated' : serializer.data,
                    'middle' : middle
                }
                return Response(output, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    # def post(self, request):
    #     data = request.data
    #     print('data of name recived is',data['name'])
    #     image_name = data['name']
    #     cordinate_X = data['cordinate_X']
    #     cordinate_Y = data['cordinate_Y']
    #     # from nose.tools import set_trace; set_trace()
    #     try:
    #         get_name_of_image = RecievingPotholeImages.objects.filter(name = image_name).get()
    #         try:
    #             if get_name_of_image:
    #                 print('name of image ',get_name_of_image)
    #                 serializer = UpdationPotholeImageSerializer(data=data)
    #                 if serializer.is_valid():
    #                     serializer.save()
    #                     return Response(serializer.data, status=status.HTTP_200_OK)
    #                 else:
    #                     responseData = serializer.errors
    #         except Exception as e:
    #             response = e
    #             return Response(responseData, status=HTTP_400_BAD_REQUEST)
    #     except Exception as e:
    #         responseData = e
    #         return Response(responseData, status=HTTP_400_BAD_REQUEST)

class MappingSinglePhoto(APIView):
    """ Mapping Single Image """
    mapped_images = []
    def post(self, request):
        import pdb; pdb.set_trace()
        try:
            data = request.data
            # import pdb; pdb.set_trace()
            name_of_image = data['name']
            image = RecMod.RecievingPotholeImages.objects.filter(name = name_of_image).get()
            serializer = RecSer.UpdatedRecievingPotholeImagesSerializer(instance = image)
            # pdb.set_trace()
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Exception as e:
            print(e)

class MappingAllPhoto(APIView):
    """ Mapping All Images """
    def get(self, request):
        try:
            mapped_images = []
            images = RecMod.PotholeUpdationImages.objects.all()
            # pdb.set_trace()
            for image in images:
                image = RecMod.RecievingPotholeImages.objects.filter(name = image).get()
                serializer = RecSer.UpdatedRecievingPotholeImagesSerializer(instance = image)
                mapped_images.append(serializer.data)
            return Response(mapped_images, status=status.HTTP_200_OK)
        except Exception as e:
            return Response(e, status=status.HTTP_400_BAD_REQUEST)

# ---------------------------------------------------------------------------- #








# SECTION COUNTRY UPDATED
# ---------------------------------------------------------------------------- #
#                              COUNTRY UPDATED                               #
# ---------------------------------------------------------------------------- #


### func4 for Country Api
#                   return images that have potholes in it and if filled is false

class MappingCountry(APIView):
    """ Mapping All Images """
    def post(self, request):
        try:
            data = request.data
            # pdb.set_trace()
            mapped_images = []
            name_of_country = data['country_name']
            images = RecMod.PotholeUpdationImages.objects.filter(country=name_of_country)
            # pdb.set_trace()
            for image in images:
                image = RecMod.RecievingPotholeImages.objects.filter(name = image).get()
                serializer = RecSer.RecievingPotholeImagesSerializer(instance = image)
                mapped_images.append(serializer.data)
            return Response(mapped_images, status=status.HTTP_200_OK)
        except Exception as e:
            return Response(e, status=status.HTTP_400_BAD_REQUEST)



# -------------------------------------- COUNT -------------------------------------- #


### COMPLETE
class MappingCountryFilled(APIView):
    """Counting Potholes Present in each country"""

    def post(self, requests):
        try:
            data = requests.data
            name_of_country = data['country_name']
            filled_potholes = RecMod.PotholeUpdationImages.objects.filter(country=name_of_country).count()
            return Response(filled_potholes, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status.HTTP_400_BAD_REQUEST)

class MappingCountryRemaining(APIView):
    """Counting Potholes Present in each country"""

    def post(self, requests):
        try:
            data = requests.data
            name_of_country = data['country_name']
            present_potholes = RecMod.RecievingPotholeImages.objects.filter(country=name_of_country).count()
            filled_potholes = RecMod.PotholeUpdationImages.objects.filter(country=name_of_country).count()
            remaining_potholes = present_potholes - filled_potholes
            return Response(remaining_potholes, status=status.HTTP_200_OK)
        except Exception as e:
            responseData = e
            return Response(responseData, status.HTTP_400_BAD_REQUEST)

# ------------------------------------------------------------------------------------- #














