from rest_framework import serializers
from .models import *
import pdb

class ProvidedApiSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProvidedApis
        fields = '__all__'

class AvailableApiSerializer(serializers.ModelSerializer):
    class Meta:
        model = AvailableApi
        fields = '__all__'
        
class RecievingPotholeImagesSerializer(serializers.ModelSerializer):
    """Original and Masked Pothole Images"""

    class Meta:
        model = RecievingPotholeImages
        fields = '__all__'

class RecievingPotholeImagesShortSerializer(serializers.ModelSerializer):
    """Original and Masked Pothole Images"""

    class Meta:
        model = RecievingPotholeImages
        fields = ('name','cordinate_X', 'cordinate_Y')

class ProvidedApiMetricsSerilizer(serializers.Serializer):

    class Meta:
        model = Ab
        fields = '__all__'
        
class UpdationPotholeImageSerializer(serializers.ModelSerializer):
    """Update pothole Image wrt name """

    class Meta:
        model = PotholeUpdationImages
        fields = '__all__'
        # depth = 1
#         # fields = ('name','updated_image','cordinate_X',
#         # 			'cordinate_Y','road_name',
#         # 			'is_filled','checked')

class MappingPhotosSelectRelateSerializer(serializers.Serializer):
    """Mapping Serializers, combining two tables together"""
    
    # name            = serializers.CharField(max_length = 100)
    updated_image   = serializers.ImageField()
    # cordinate_X     = serializers.DecimalField(max_digits=22, decimal_places=16)
    # cordinate_Y     = serializers.DecimalField(max_digits=22, decimal_places=16)
    # road_name       = serializers.CharField(max_length = 100)
    # created_date    = serializers.DateTimeField()
    is_filled       = serializers.BooleanField()
    checked         = serializers.BooleanField()
    # agency          = serializers.CharField(max_length=100)
    # rawImage        = serializers.ImageField()
    # maskedImage     = serializers.ImageField()
    name                        = serializers.CharField(max_length = 100)
    area                        = serializers.IntegerField()
    number                      = serializers.IntegerField()
    cordinate_X                 = serializers.FloatField()
    cordinate_Y                 = serializers.FloatField()
    RCreated_date               = serializers.DateTimeField()
    ROwner                      = serializers.CharField(max_length = 100)
    agency_name                 = serializers.CharField(max_length = 100)
    rawImage                    = serializers.ImageField()
    maskedImage                 = serializers.ImageField()
    premise                     = serializers.CharField(max_length = 100)
    park                        = serializers.CharField(max_length = 100)
    airport                     = serializers.CharField(max_length = 100)
    natural_feature             = serializers.CharField(max_length = 100)
    postal_code                 = serializers.CharField(max_length = 100)
    plus_code                   = serializers.CharField(max_length = 100)
    subpremise                  = serializers.CharField(max_length = 100)
    neighborhood                = serializers.CharField(max_length = 100)
    sublocality_level_1         = serializers.CharField(max_length = 100)
    sublocality_level_2         = serializers.CharField(max_length = 100)
    sublocality_level_3         = serializers.CharField(max_length = 100)
    sublocality_level_4         = serializers.CharField(max_length = 100)
    sublocality_level_5         = serializers.CharField(max_length = 100)
    locality                    = serializers.CharField(max_length = 100)
    colloquial_area             = serializers.CharField(max_length = 100)
    administrative_area_level_1 = serializers.CharField(max_length = 100)
    administrative_area_level_2 = serializers.CharField(max_length = 100)
    administrative_area_level_3 = serializers.CharField(max_length = 100)
    administrative_area_level_4 = serializers.CharField(max_length = 100)
    administrative_area_level_5 = serializers.CharField(max_length = 100)
    country                     = serializers.CharField(max_length = 100)
    intersection                = serializers.CharField(max_length = 100)
    route                       = serializers.CharField(max_length = 100)
    street_address              = serializers.CharField(max_length = 100)
    formatted_address           = serializers.CharField(max_length = 100)


class GISDisplayPhotosSelectRelateSerializer(serializers.Serializer):
    """Mapping Serializers, combining two tables together"""
    
    name            = serializers.CharField(max_length = 100)
    rawImage        = serializers.ImageField()
    maskedImage     = serializers.ImageField()


class NearBylocationSerializer(serializers.Serializer):
    """ Get Longitude and Latitude cordinates of nearest potholes """

    cordinate_X = serializers.FloatField()
    cordinate_Y = serializers.FloatField()
    under_distance = serializers.IntegerField()

# from drf_extra_fields.geo_fields import PointField

class BoundingBoxImageSerializer(serializers.Serializer):
    """return cordinates lying under bounding box"""

    ne_latitude = serializers.FloatField()
    ne_longitude = serializers.FloatField()
    sw_latitude = serializers.FloatField()
    sw_longitude = serializers.FloatField()


class SendNearByLocationSerializer(serializers.Serializer):
    """ Send Distance along with other parameters of nearest potholes"""
    
    distance                    = serializers.IntegerField()
    name                        = serializers.CharField(max_length = 100)
    area                        = serializers.IntegerField()
    number                      = serializers.IntegerField()
    cordinate_X                 = serializers.FloatField()
    cordinate_Y                 = serializers.FloatField()
    RCreated_date               = serializers.DateTimeField()
    ROwner                      = serializers.CharField(max_length = 100)
    agency_name                 = serializers.CharField(max_length = 100)
    rawImage                    = serializers.ImageField()
    maskedImage                 = serializers.ImageField()
    premise                     = serializers.CharField(max_length = 100)
    park                        = serializers.CharField(max_length = 100)
    airport                     = serializers.CharField(max_length = 100)
    natural_feature             = serializers.CharField(max_length = 100)
    postal_code                 = serializers.CharField(max_length = 100)
    plus_code                   = serializers.CharField(max_length = 100)
    subpremise                  = serializers.CharField(max_length = 100)
    neighborhood                = serializers.CharField(max_length = 100)
    sublocality_level_1         = serializers.CharField(max_length = 100)
    sublocality_level_2         = serializers.CharField(max_length = 100)
    sublocality_level_3         = serializers.CharField(max_length = 100)
    sublocality_level_4         = serializers.CharField(max_length = 100)
    sublocality_level_5         = serializers.CharField(max_length = 100)
    locality                    = serializers.CharField(max_length = 100)
    colloquial_area             = serializers.CharField(max_length = 100)
    administrative_area_level_1 = serializers.CharField(max_length = 100)
    administrative_area_level_2 = serializers.CharField(max_length = 100)
    administrative_area_level_3 = serializers.CharField(max_length = 100)
    administrative_area_level_4 = serializers.CharField(max_length = 100)
    administrative_area_level_5 = serializers.CharField(max_length = 100)
    country                     = serializers.CharField(max_length = 100)
    intersection                = serializers.CharField(max_length = 100)
    route                       = serializers.CharField(max_length = 100)
    street_address              = serializers.CharField(max_length = 100)
    formatted_address           = serializers.CharField(max_length = 100)


class BBLocationSerializer(serializers.Serializer):
    """ Send Distance along with other parameters of nearest potholes"""
    
    name                        = serializers.CharField(max_length = 100)
    area                        = serializers.IntegerField()
    number                      = serializers.IntegerField()
    cordinate_X                 = serializers.FloatField()
    cordinate_Y                 = serializers.FloatField()
    RCreated_date               = serializers.DateTimeField()
    user_id                      = serializers.CharField(max_length = 100)
    company_id                 = serializers.CharField(max_length = 100)
    rawImage                    = serializers.CharField(max_length = 1500)
    # rawImage                    = serializers.ImageField()
    # maskedImage                 = serializers.ImageField()
    maskedImage                 = serializers.CharField(max_length = 1500)
    premise                     = serializers.CharField(max_length = 100)
    park                        = serializers.CharField(max_length = 100)
    airport                     = serializers.CharField(max_length = 100)
    natural_feature             = serializers.CharField(max_length = 100)
    postal_code                 = serializers.CharField(max_length = 100)
    plus_code                   = serializers.CharField(max_length = 100)
    subpremise                  = serializers.CharField(max_length = 100)
    neighborhood                = serializers.CharField(max_length = 100)
    sublocality_level_1         = serializers.CharField(max_length = 100)
    sublocality_level_2         = serializers.CharField(max_length = 100)
    sublocality_level_3         = serializers.CharField(max_length = 100)
    sublocality_level_4         = serializers.CharField(max_length = 100)
    sublocality_level_5         = serializers.CharField(max_length = 100)
    locality                    = serializers.CharField(max_length = 100)
    colloquial_area             = serializers.CharField(max_length = 100)
    administrative_area_level_1 = serializers.CharField(max_length = 100)
    administrative_area_level_2 = serializers.CharField(max_length = 100)
    administrative_area_level_3 = serializers.CharField(max_length = 100)
    administrative_area_level_4 = serializers.CharField(max_length = 100)
    administrative_area_level_5 = serializers.CharField(max_length = 100)
    country                     = serializers.CharField(max_length = 100)
    intersection                = serializers.CharField(max_length = 100)
    route                       = serializers.CharField(max_length = 100)
    street_address              = serializers.CharField(max_length = 100)
    formatted_address           = serializers.CharField(max_length = 100)


########################## GET LINKS of Images from Google cloud ########



####################### ####################### #######################

############################ USING SERPY #######################

import serpy
import pdb

def image_pro_name_formating(filename):
    lastElement = filename.split('/')[-1]
    print(lastElement)
    Extenstion = lastElement.split('.')[-1]
    print(Extenstion)
    # filename = '{}.{}'.format('pro_test', Extenstion)
    return lastElement


class DateField(serpy.Field):
    def to_value(self, value):
        # pdb.set_trace()
        x = value.date()
        return x.strftime("%D")
        # return value

class ImageField(serpy.Field):
    def to_value(self, value):
        # pdb.set_trace()
        return value.url

class SerpyBBLocationSerializer(serpy.DictSerializer):
    """ Send Distance along with other parameters of nearest potholes """
    name                        = serpy.Field()
    area                        = serpy.IntField()
    number                      = serpy.IntField()
    cordinate_X                 = serpy.FloatField()
    cordinate_Y                 = serpy.FloatField()
    RCreated_date               = DateField()
    ROwner                      = serpy.Field()
    agency_name                 = serpy.Field()
    # rawImage                    = ImageField()
    # maskedImage                 = ImageField()
    premise                     = serpy.Field()
    park                        = serpy.Field()
    airport                     = serpy.Field()
    natural_feature             = serpy.Field()
    postal_code                 = serpy.Field()
    plus_code                   = serpy.Field()
    subpremise                  = serpy.Field()
    neighborhood                = serpy.Field()
    sublocality_level_1         = serpy.Field()
    sublocality_level_2         = serpy.Field()
    sublocality_level_3         = serpy.Field()
    sublocality_level_4         = serpy.Field()
    sublocality_level_5         = serpy.Field()
    locality                    = serpy.Field()
    colloquial_area             = serpy.Field()
    administrative_area_level_1 = serpy.Field()
    administrative_area_level_2 = serpy.Field()
    administrative_area_level_3 = serpy.Field()
    administrative_area_level_4 = serpy.Field()
    administrative_area_level_5 = serpy.Field()
    country                     = serpy.Field()
    intersection                = serpy.Field()
    route                       = serpy.Field()
    street_address              = serpy.Field()
    formatted_address           = serpy.Field()

# class SerpyDetailBBLocationSerializer(SerpyBBLocationSerializer):
#     """This cointains Images URLs along with normal data"""
#     rawImage                    = ImageField()
#     maskedImage                 = ImageField()

class SerpyDetailBBLocationSerializer(SerpyBBLocationSerializer):
    """This cointains Images URLs along with normal data"""
    rawImage                    = serpy.Field()
    maskedImage                 = serpy.Field()

# class SerpyCountBBLocationSerilai
"""
From Here mapping means all the images
updated, Raw, Processed image together
"""
# 
# class SerpyMappingNormal(serpy.DictSerializer):
    # """Mapping all image together"""
    # 
    # name                        : serpy.Field()
    # updated_image_url           : serpy.Field()
    # cordinate_X                 : serpy.IntField()
    # cordinate_Y                 : serpy.IntField()
    # created_date                : DateField()
    # is_filled                   : serpy.BoolField()
    # checked                     : serpy.BoolField()
    # distance                    : serpy.IntField()
    # premise                     : serpy.Field()
    # park                        : serpy.Field()
    # airport                     : serpy.Field()
    # natural_feature             : serpy.Field()
    # postal_code                 : serpy.Field()
    # plus_code                   : serpy.Field()
    # subpremise                  : serpy.Field()
    # neighborhood                : serpy.Field()
    # sublocality_level_1         : serpy.Field()
    # sublocality_level_2         : serpy.Field()
    # sublocality_level_3         : serpy.Field()
    # sublocality_level_4         : serpy.Field()
    # sublocality_level_5         : serpy.Field()
    # locality                    : serpy.Field()
    # colloquial_area             : serpy.Field()
    # administrative_area_level_1 : serpy.Field()
    # administrative_area_level_2 : serpy.Field()
    # administrative_area_level_3 : serpy.Field()
    # administrative_area_level_4 : serpy.Field()
    # administrative_area_level_5 : serpy.Field()
    # country                     : serpy.Field()
    # intersection                : serpy.Field()
    # route                       : serpy.Field()
    # street_address              : serpy.Field()
    # formatted_address           : serpy.Field()
# 
# 
# class SerpyMappingDetail(SerpyMappingNormal):
    # """This cointains Images URLs along with normal data"""
    # rawImageUrl                    = serpy.Field()
    # maskedImageUrl                 = serpy.Field()
    # updated_image_url              = serpy.Field()
# 


# class UpdatedImageData
#     nested name raw and masked image data

class UpdatedPotholeImageSerializer(serializers.ModelSerializer):
    """get data for the updated Image """
    # pdb.set_trace()
    # updated = RecievingPotholeImagesSerializer(many= True, read_only=True, source='current_RecievingImages')
    # updated = serializers.SerializerMethodField()
    # original_images = RecievingPotholeImagesSerializer(many=True)
    # original = RecievingPotholeImagesSerializer(many = True, read_only = True, source='RecievingPotholeImages_set')
    # original = RecievingPotholeImagesSerializer(many = True, read_only = True,)

    class Meta:
        model = PotholeUpdationImages
        fields = (
            # 'original',
            # 'original_images',
            # 'updated',
            'name',
            'updated_image_url',
            'cordinate_X',
            'cordinate_Y',
            'created_date',
            'is_filled',
            'checked',
            'distance',
            # 'point',
            'premise',
            'park',
            'airport',
            'natural_feature',
            'postal_code',
            'plus_code',
            'subpremise',
            'neighborhood',
            'sublocality_level_1',
            'sublocality_level_2',
            'sublocality_level_3',
            'sublocality_level_4',
            'sublocality_level_5',
            'locality',
            'colloquial_area',
            'administrative_area_level_1',
            'administrative_area_level_2',
            'administrative_area_level_3',
            'administrative_area_level_4',
            'administrative_area_level_5', 
            'country',
            'intersection',
            'route',
            'street_address',
            'formatted_address',
        )
        # depth = 1

        # def get_updated(self, instance):
        #     updated_instances = 

class PotholeImageSerializer(serializers.ModelSerializer):

    class Meta:
        model = RecievingPotholeImages
        fields = (
                'name',
                'area',
                'number',
                'cordinate_X',
                'cordinate_Y',
                'RCreated_date',
                'ROwner',
                'rawImageUrl',
                'maskedImageUrl', 
                'agency_name',
                'premise',
                'park',
                'airport',
                'natural_feature',
                'postal_code',
                'plus_code',
                'subpremise',
                'neighborhood',
                'sublocality_level_1',
                'sublocality_level_2',
                'sublocality_level_3',
                'sublocality_level_4',
                'sublocality_level_5',
                'locality',
                'colloquial_area',
                'administrative_area_level_1',
                'administrative_area_level_2',
                'administrative_area_level_3',
                'administrative_area_level_4',
                'administrative_area_level_5',
                'country',
                'intersection',
                'route',
                'street_address',
                'formatted_address',
        )



class UpdatedRecievingPotholeImagesSerializer(serializers.ModelSerializer):
    updated = UpdatedPotholeImageSerializer(many= True, read_only=True)

    """Recieved Pothole Images"""
    class Meta:
        model = RecievingPotholeImages
        fields = (
                'updated',
                'name',
                'rawImageUrl',
                'maskedImageUrl',
                # 'area',
                # 'number',
                'cordinate_X',
                'cordinate_Y',
                'RCreated_date',
                # 'ROwner',
                'agency_name',
                'premise',
                'park',
                'airport',
                'natural_feature',
                'postal_code',
                'plus_code',
                'subpremise',
                'neighborhood',
                'sublocality_level_1',
                'sublocality_level_2',
                'sublocality_level_3',
                'sublocality_level_4',
                'sublocality_level_5',
                'locality',
                'colloquial_area',
                'administrative_area_level_1',
                'administrative_area_level_2',
                'administrative_area_level_3',
                'administrative_area_level_4',
                'administrative_area_level_5',
                'country',
                'intersection',
                'route',
                'street_address',
                'formatted_address',
            )


























































































































































































