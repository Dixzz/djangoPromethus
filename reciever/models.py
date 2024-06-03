from email.policy import default
import uuid
from django.contrib.gis.db import models
import os
import datetime
from django.db.models.signals import post_save, pre_save
import pdb


IMAGE_PROCESS_MODE = (
    ('READY', 'READY FOR PROCESS'), # FRESH IMAGES
    ('DL_S','DOWNLOADING IN ML SERVER'),
    ('IN_P', 'IN PROCESS'),
    ('PROC', 'PROCESSED'),
    ('FAIL', 'FAILED')
)

IMAGE_RECEIVED_TYPE = (
    ('0', 'IN CABIN'),
    ('1','BLACK'),
    ('2', 'OK')
)
IMAGE_PROCESS_TYPE = (
    ('0', 'POTHOLE'),
    ('1', 'BARRICADE'),
    ('2', 'WATERLOGGING'),
    ('3', 'ROAD ASSET'),
)

def get_date():
    now = datetime.datetime.now()
    # now = datetime.now()
    year = '{:02d}'.format(now.year)
    month = '{:02d}'.format(now.month)
    day = '{:02d}'.format(now.day)
    day_month_year = '{}-{}-{}'.format(year, month, day)
    return day_month_year

def imageNameForRawImage(instance, filename):
    """before processing file naming convention"""
    ext = filename.split('.')[-1]
    filename = "%s.%s" % (uuid.uuid4(), ext)
    # pdb.set_trace()
    return os.path.join('GIS/Raw/{}'.format(get_date()), filename)

def imageNameForPotholeImage(instance, filename):
    """before processing file naming convention"""
    ext = filename.split('.')[-1]
    filename = "%s.%s" % (uuid.uuid4(), ext)
    return os.path.join('GIS/Processed/{}'.format(get_date()), filename)

############################### RecievingPotholeImages ######################################

from django.contrib.gis.geos import Point
from django.db.models import Manager as GeoManager

def ConversionofCordinatesSingle(sender, instance, **kwargs):
    """ Signal for conversion of each cordinate """
    instance.point = Point(x=instance.cordinate_Y, y=instance.cordinate_X, srid=4326)
    print('cordinates saved for', instance.point)


def ConversionofCordinatesAll():
    """Convert all the cordinates present in database into PointField """
    for l in RecievingPotholeImages.objects.all():
        # import pdb;pdb.set_trace()
        l.point = Point(x=l.cordinate_Y, y=l.cordinate_X, srid=4326)
        l.save()
        print('cordinates saved for', l)

"""Reference link
>>> RecievingPotholeImages.objects.all()
<QuerySet [<RecievingPotholeImages: adf616b5-1f8f-49b2-b338-040d32ad2676>, 
<RecievingPotholeImages: 9f7cd457-ac2c-4c94-be5e-77a88e9b8e4b>]>
>>> for l in RecievingPotholeImages.objects.all():
...     l.point = Point(x=l.cordinate_Y, y=l.cordinate_X, srid=4326)
...     l.save()
"""
from django.contrib.postgres.fields import ArrayField


def UpdatedImageofPotholeImages(instance, filename):
    """before processing file naming convention"""
    ext = filename.split('.')[-1]
    filename = "%s.%s" % (uuid.uuid4(), ext)
    return os.path.join('GIS/Updated/{}'.format(get_date()), filename)

# class GoogleGeocodingData(models.Model):
class ProcessedImagesPothole(models.Model):
    image                       = models.ImageField(upload_to=UpdatedImageofPotholeImages,)
    image_url                   = models.TextField(verbose_name="Bucket Image Link", blank=True, null=True)
    area                        = models.FloatField(default=None, null=True)
    number                      = models.IntegerField(default=None, null=True)
    verified                    = models.BooleanField(default=None, null=True, blank=True)
    points = ArrayField(
        ArrayField(
            models.FloatField(blank=True)
        ), default=list
    )
    
class ProcessedImagesBarricade(models.Model):
    image_url                   = models.TextField(verbose_name="Bucket Image Link", blank=True)
    image                       = models.ImageField(upload_to=UpdatedImageofPotholeImages,)
    number                      = models.IntegerField(default=None, null=True)
    points = ArrayField(
        ArrayField(
            models.FloatField(blank=True)
        ), default=list
    )
    verified                    = models.BooleanField(default=None, null=True, blank=True)
    
class ProcessedImagesWaterLogging(models.Model):
    image_url                   = models.TextField(verbose_name="Bucket Image Link", blank=True)
    image                       = models.ImageField(upload_to=UpdatedImageofPotholeImages,default=None, null=True, blank=True)
    waterlogging                = models.BooleanField(default=None, null=True, blank=True)
    verified                    = models.BooleanField(default=None, null=True, blank=True)
    
class ProcessedImagesRoadAsset(models.Model):
    image_url                   = models.TextField(verbose_name="Bucket Image Link", blank=True)
    # image                       = models.ImageField(upload_to=processed_roadasset,default=None, null=True, blank=True)
    verified                    = models.BooleanField(default=None, null=True, blank=True)
    classes                     = ArrayField(models.PositiveIntegerField(), default=list)

class ChildHeaderSender(models.Model):
    image_url                   = models.TextField(verbose_name="Bucket Image Link", blank=True, null=True)
    name                        = models.CharField(max_length = 50, unique=True,  blank=False, null=False)
    
    class Meta:
        managed = False
        db_table = 'images_childheadersender'


class RecievingPotholeImages(models.Model):
    """Original and Masked Pothole Images"""
    name                        = models.CharField(max_length = 100, unique = True, primary_key=True)
    showUrl                     = models.URLField(max_length=255, null=True, blank=True, default=None)
    pothole                     = models.ForeignKey(ProcessedImagesPothole, default=None,null=True, blank=True,on_delete=models.SET_NULL,)
    barricade                   = models.ForeignKey(ProcessedImagesBarricade, default=None,null=True, blank=True,on_delete=models.SET_NULL,)
    waterlogging                = models.ForeignKey(ProcessedImagesWaterLogging, default=None,null=True, blank=True,on_delete=models.SET_NULL,)
    roadasset                   = models.ForeignKey(ProcessedImagesRoadAsset, default=None,null=True, blank=True,on_delete=models.SET_NULL,)

    # area                        = models.IntegerField()
    # number                      = models.IntegerField()
    cordinate_X                 = models.FloatField()
    cordinate_Y                 = models.FloatField()
    RCreated_date               = models.DateTimeField(auto_now_add=True)
    user_id                     = models.TextField(null=True, blank=True)
    company_id                  = models.TextField(null=True, blank=True)
    # rawImage                    = models.ImageField(upload_to=imageNameForRawImage,)
    rawImageUrl                 = models.TextField(default='None')
    # maskedImage                 = models.ImageField(upload_to=imageNameForPotholeImage,)
    maskedImageUrl              = models.TextField(default='None')
    point                       = models.PointField(srid=4326, geography=True, default='POINT(0.0 0.0)')
    premise                     = models.CharField(max_length=100, null=True, blank=True, default='None')
    park                        = models.CharField(max_length=100, null=True, blank=True, default='None')
    airport                     = models.CharField(max_length=100, null=True, blank=True, default='None')
    natural_feature             = models.CharField(max_length=100, null=True, blank=True, default='None')
    postal_code                 = models.CharField(max_length=100, null=True, blank=True, default='None')
    plus_code                   = models.CharField(max_length=100, null=True, blank=True, default='None')
    subpremise                  = models.CharField(max_length=100, null=True, blank=True, default='None')
    neighborhood                = models.CharField(max_length=100, null=True, blank=True, default='None')
    sublocality_level_1         = models.CharField(max_length=100, null=True, blank=True, default='None')
    sublocality_level_2         = models.CharField(max_length=100, null=True, blank=True, default='None')
    sublocality_level_3         = models.CharField(max_length=100, null=True, blank=True, default='None')
    sublocality_level_4         = models.CharField(max_length=100, null=True, blank=True, default='None')
    sublocality_level_5         = models.CharField(max_length=100, null=True, blank=True, default='None')
    locality                    = models.CharField(max_length=100, null=True, blank=True, default='None')
    colloquial_area             = models.CharField(max_length=100, null=True, blank=True, default='None')
    administrative_area_level_1 = models.CharField(max_length=100, null=True, blank=True, default='None')
    administrative_area_level_2 = models.CharField(max_length=100, null=True, blank=True, default='None')
    administrative_area_level_3 = models.CharField(max_length=100, null=True, blank=True, default='None')
    administrative_area_level_4 = models.CharField(max_length=100, null=True, blank=True, default='None')
    administrative_area_level_5 = models.CharField(max_length=100, null=True, blank=True, default='None')
    country                     = models.CharField(max_length=100, null=True, blank=True, default='None')
    intersection                = models.CharField(max_length=100, null=True, blank=True, default='None')
    route                       = models.CharField(max_length=100, null=True, blank=True, default='None')
    street_address              = models.CharField(max_length=100, null=True, blank=True, default='None')
    formatted_address           = models.TextField(max_length=1000, null=True, blank=True, default='None')

    # point         = models.PointField(srid=4326, geography=True)

    objects = GeoManager()

    def __str__(self):
        return self.name

    def current_RecievingImages(self):
        pdb.set_trace()
        return RecievingPotholeImages.objects.filter(name=self)

    class Meta:
        verbose_name_plural = 'Pothole Mapping'

    @property
    def raw_picture_content(self, obj):
        breakpoint()
        if obj.rawImage:
            return mark_safe('<img src="{url}" width="100" height=100 />'.format(url = obj.rawImage.url,))
            print(obj.rawImage.url)
        else:
            return '(Image not found)'

pre_save.connect(ConversionofCordinatesSingle, sender=RecievingPotholeImages)

class PotholeImages(models.Model):
    image_type = models.CharField(default=None,null=True, blank=False, choices=IMAGE_RECEIVED_TYPE, max_length=10)
    formatted_address = models.TextField(max_length=1000, null=True, blank=True, default='None')
    status_process = models.CharField(
        max_length=5, 
        choices=IMAGE_PROCESS_MODE, 
        default=None, 
        null=True, 
        blank=False
    ) 
    
    deviceImei = models.CharField(
        max_length=50, 
        default=None, 
        null=True, 
        blank=False
    )
    
    ignition = models.CharField(
        max_length=10, 
        default=None, 
        null=True, 
        blank=False
    )
    # batch_id = models.ForeignKey(
    #     PotholeBatch,
    #     default=None,
    #     null=True,
    #     blank=False,
    #     on_delete=models.SET_NULL,
    # )

    # image    = models.ImageField(
    #     upload_to=image_file_name_before, 
    #     blank=False
    # )
    
    # cropped    = models.ImageField(
    #     upload_to=image_file_name_before, 
    #     blank=False,
    #     default=None,
    #     null=True
    # )

    image_id = models.CharField(
        max_length=300, 
        null=True, 
        blank=True, 
        default=uuid.uuid4, 
        editable=False,
        unique=True,
    )

    images_url = models.TextField(
        verbose_name="Bucket Image Link",
        blank=True
    )

    # user_id   = models.ForeignKey(
    #     'login.UserProfile',
    #     on_delete=models.CASCADE,
    #     blank=False
    # )

    # pothole_found   = models.BooleanField(_("Pothole"), default=None, null=True)
    # water_found     = models.BooleanField(_("Waterlogging"), default=None, null=True)
    # barri_found     = models.BooleanField(_("Barricade"), default=None, null=True)
    # company_id   = models.ForeignKey(
    #     'company.CompanyProfile',
    #     on_delete=models.SET_NULL,
    #     blank=True,
    #     null=True
    # )

    #* trip_id is kept blank & null=True to avoid conficts
    # trip_id = models.ForeignKey(
    #     Trips,
    #     on_delete = models.SET_NULL,
    #     blank=True,
    #     null=True
    # )


    short_country_code = models.CharField(
        max_length=20,
        default = 'IND'
    )

    country = models.CharField(
        max_length=255,
        default = 'None',
    )

    state = models.CharField(
        max_length=255,
        default = 'NA',
    )

    district = models.CharField(
        max_length=255,
        default = 'NA',
    )

    type_1 = models.CharField(
        max_length=255,
        default = 'NA',
    )

    type_2 = models.CharField(
        max_length=255,
        default = 'NA',
    )

    type_3 = models.CharField(
        max_length=255,
        default = 'NA',
    )

    cordinate_X  = models.FloatField(blank=False)
    cordinate_Y  = models.FloatField(blank=False)
    created_date = models.DateTimeField(auto_now_add=True)
    device_created_date = models.DateTimeField(auto_now_add=False, default=None,null=True, blank=True,)
    point        = models.PointField(
        srid=4326, 
        geography=True, 
        default='POINT(0.0 0.0)'
    )
    postal_code  = models.CharField(max_length=100, null=True, blank=True, default=None)
    # image_mode = models.CharField(max_length=2, 
    #                                 choices=IMAGE_MODE, 
    #                                 default='NA',
    #                                 blank=False)

    car_speed = models.IntegerField(blank=False, default=0)

    # novae_base  = models.BooleanField(_("Sent to Novae Base"), default=False)

    # device_details = models.CharField(max_length=255, 
    #                                 blank=False, 
    #                                 default=False)

    objects = GeoManager()

    # def __str__(self):
    #     # import pdb;pdb.set_trace()
    #     stringImageName = str(self.image)
    #     stringImageName = get_name(stringImageName)
    #     # self.name = stringImageName
    #     return stringImageName

    class Meta:
        managed = False
        db_table = 'images_potholeimages'
        verbose_name_plural = "Processed Road Images"
        ordering = ('created_date',)
        
################################## Maintainence Tables #####################################

class ConversionTable(models.Model):
    """maintainece of conversion of cordinates in table"""
    name = models.CharField(max_length = 100, unique = True, primary_key=True)

    def __str__(self):
        return self.name

################################## Jobs Tables #####################################

# def save_image_name(sender, instance, **kwargs):
#     instance.rawImageUrl    = instance.rawImage.url
#     instance.maskedImageUrl = instance.maskedImage.url
#     # pdb.set_trace()
#     post_save.disconnect(save_image_name, sender=RecievingPotholeImages)
#     instance.save()
#     post_save.connect(save_image_name, sender=RecievingPotholeImages)

# post_save.connect(save_image_name, sender=RecievingPotholeImages)


############################### Updated Pothole Images #####################################
from django.contrib.gis.geos import GEOSGeometry

class PotholeUpdationImages(models.Model):
    """ Update pothole Image wrt name"""
    name                        = models.ForeignKey(RecievingPotholeImages, on_delete=models.PROTECT, related_name='updated')
    updated_image               = models.ImageField(upload_to=UpdatedImageofPotholeImages,)
    # updated_image_url           = models.TextField(default='None')
    cordinate_X                 = models.FloatField()
    cordinate_Y                 = models.FloatField()
    created_date                = models.DateTimeField(auto_now_add=True)
    is_filled                   = models.BooleanField(default=True)
    checked                     = models.BooleanField(default=False)
    distance                    = models.IntegerField()
    point                       = models.PointField(srid=4326, geography=True, default='POINT(0.0 0.0)')
    premise                     = models.CharField(max_length=100, null=True, blank=True, default='None')
    park                        = models.CharField(max_length=100, null=True, blank=True, default='None')
    airport                     = models.CharField(max_length=100, null=True, blank=True, default='None')
    natural_feature             = models.CharField(max_length=100, null=True, blank=True, default='None')
    postal_code                 = models.CharField(max_length=100, null=True, blank=True, default='None')
    plus_code                   = models.CharField(max_length=100, null=True, blank=True, default='None')
    subpremise                  = models.CharField(max_length=100, null=True, blank=True, default='None')
    neighborhood                = models.CharField(max_length=100, null=True, blank=True, default='None')
    sublocality_level_1         = models.CharField(max_length=100, null=True, blank=True, default='None')
    sublocality_level_2         = models.CharField(max_length=100, null=True, blank=True, default='None')
    sublocality_level_3         = models.CharField(max_length=100, null=True, blank=True, default='None')
    sublocality_level_4         = models.CharField(max_length=100, null=True, blank=True, default='None')
    sublocality_level_5         = models.CharField(max_length=100, null=True, blank=True, default='None')
    locality                    = models.CharField(max_length=100, null=True, blank=True, default='None')
    colloquial_area             = models.CharField(max_length=100, null=True, blank=True, default='None')
    administrative_area_level_1 = models.CharField(max_length=100, null=True, blank=True, default='None')
    administrative_area_level_2 = models.CharField(max_length=100, null=True, blank=True, default='None')
    administrative_area_level_3 = models.CharField(max_length=100, null=True, blank=True, default='None')
    administrative_area_level_4 = models.CharField(max_length=100, null=True, blank=True, default='None')
    administrative_area_level_5 = models.CharField(max_length=100, null=True, blank=True, default='None')
    country                     = models.CharField(max_length=100, null=True, blank=True, default='None')
    intersection                = models.CharField(max_length=100, null=True, blank=True, default='None')
    route                       = models.CharField(max_length=100, null=True, blank=True, default='None')
    street_address              = models.CharField(max_length=100, null=True, blank=True, default='None')
    formatted_address           = models.TextField(max_length=1000, null=True, blank=True, default='None')


    def __str__(self):
        return str(self.name)
    
    @property
    def original_images(self):
        return self.RecievingPotholeImages_set.all()

"""_set is for reverese relationship
https://docs.djangoproject.com/en/1.10/topics/db/queries/#following-relationships-backward
"""

    # @property
    # def raw_image_url(self):
    #     """return raw Image Url"""
    #     return '{}'.format(self.name.rawImageUrl)

def save_updated_image_url(sender, instance, **kwargs):
    """save updated image url"""
    # pdb.set_trace()
    instance.updated_image_url = instance.updated_image.url
    post_save.disconnect(save_updated_image_url, sender=PotholeUpdationImages)
    instance.save()
    post_save.connect(save_updated_image_url, sender=PotholeUpdationImages)

post_save.connect(save_updated_image_url, sender=PotholeUpdationImages)

#### Calculate the disatance between two cordinates ####
def calculate_distance_bw_two_points(sender, instance, **kwargs):
    """Calculate the disatance between two cordinates"""
    # pdb.set_trace()
    updated_object = instance.name
    original_object = RecievingPotholeImages.objects.filter(name = updated_object).get()
    ULongitude = instance.cordinate_X
    ULatitude = instance.cordinate_Y
    OLongitude = original_object.cordinate_Y
    OLatitude = original_object.cordinate_X
    pnt = GEOSGeometry('SRID=4326;POINT({} {})'.format(ULongitude, ULatitude))
    pnt2 = GEOSGeometry('SRID=4326;POINT( {} {} )'.format(OLongitude, OLatitude))
    distance = pnt.distance(pnt2)
    distance_in_km = distance * 100
    if distance_in_km:
        instance.distance = distance_in_km
    return distance_in_km

pre_save.connect(calculate_distance_bw_two_points, sender=PotholeUpdationImages)

####################### SIGNAL FOR GEOCODING #########################
import requests
geocoding_API_KEY = 'AIzaSyA4K3m1WMS6lomQhQV30wt7eDw8i7krC7c'

## Single address Geocoding
def save_road_image(sender, instance, **kwargs):
    # import pdb; pdb.set_trace()
    latitude = instance.cordinate_Y
    longitude = instance.cordinate_X
    API_KEY = geocoding_API_KEY

    geocode_url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng={lat},{long}&key={API_KEY}'.format(lat = latitude,
                                                                                                              long = longitude,
                                                                                                                API_KEY = API_KEY)
    ## ping google for results
    results = requests.post(geocode_url)
    ## results will be in json format convert to dict using requests functionality
    results = results.json()

    if len(results['results']) == 0:
        output = {
            "formatted_address" : None,
            "latitude" : None,
            "premise" : None,
        }
    else:
        answer = results['results'][0]
        # pprint.pprint(answer)
        instance.formatted_address = answer['formatted_address']
        for address_component_type in answer['address_components']:
            l1 = address_component_type['types']
            l2 = ['premise','locality','park','airport','natural_feature','postal_code','plus_code',
                    'subpremise','neighborhood','sublocality_level_1','sublocality_level_2','sublocality_level_3',
                    'sublocality_level_4','sublocality_level_5','locality','colloquial_area','administrative_area_level_1',
                    'administrative_area_level_2','administrative_area_level_3','administrative_area_level_4',
                    'administrative_area_level_5','country','intersection','route','street_address']
            check =  any(item in l1 for item in l2)
            if check:
                print(l1)

                if any(item in l1 for item in ['premise']):
                    instance.premise = address_component_type['long_name']
                
                if any(item in l1 for item in ['park']):
                    instance.park = address_component_type['long_name']
                
                if any(item in l1 for item in ['airport']):
                    instance.airport = address_component_type['long_name']
                
                if any(item in l1 for item in ['natural_feature']):
                    instance.natural_feature = address_component_type['long_name']
                
                if any(item in l1 for item in ['postal_code']):
                    instance.postal_code = address_component_type['long_name']
                
                if any(item in l1 for item in ['plus_code']):
                    instance.plus_code = address_component_type['long_name']
                
                if any(item in l1 for item in ['subpremise']):
                    instance.subpremise = address_component_type['long_name']
                
                if any(item in l1 for item in ['neighborhood']):
                    instance.neighborhood = address_component_type['long_name']
                
                if any(item in l1 for item in ['sublocality_level_1']):
                    instance.sublocality_level_1 = address_component_type['long_name']
                
                if any(item in l1 for item in ['sublocality_level_2']):
                    instance.sublocality_level_2 = address_component_type['long_name']
                
                if any(item in l1 for item in ['sublocality_level_3']):
                    instance.sublocality_level_3 = address_component_type['long_name']
                
                if any(item in l1 for item in ['sublocality_level_4']):
                    instance.sublocality_level_4 = address_component_type['long_name']
                
                if any(item in l1 for item in ['sublocality_level_5']):
                    instance.sublocality_level_5 = address_component_type['long_name']
                
                if any(item in l1 for item in ['locality']):
                    instance.locality = address_component_type['long_name']
                
                if any(item in l1 for item in ['colloquial_area']):
                    instance.colloquial_area = address_component_type['long_name']
                
                if any(item in l1 for item in ['administrative_area_level_1']):
                    instance.administrative_area_level_1 = address_component_type['long_name']
                
                if any(item in l1 for item in ['administrative_area_level_2']):
                    instance.administrative_area_level_2 = address_component_type['long_name']
                
                if any(item in l1 for item in ['administrative_area_level_3']):
                    instance.administrative_area_level_3 = address_component_type['long_name']
                
                if any(item in l1 for item in ['administrative_area_level_4']):
                    instance.administrative_area_level_4 = address_component_type['long_name']
                
                if any(item in l1 for item in ['administrative_area_level_5']):
                    instance.administrative_area_level_5 = address_component_type['long_name']
                
                if any(item in l1 for item in ['country']):
                    instance.country = address_component_type['long_name']
                
                if any(item in l1 for item in ['intersection']):
                    instance.intersection = address_component_type['long_name']
                
                if any(item in l1 for item in ['route']):
                    instance.route = address_component_type['long_name']
                
                if any(item in l1 for item in ['street_address']):
                    instance.street_address = address_component_type['long_name']

pre_save.connect(save_road_image, sender=PotholeUpdationImages)


################################ ################################ #########################

# from django.contrib.postgres.fields import ArrayField
from . base_models import BaseAPIRequestLog

STAT_TYPE = (
    ('DEL', 'Deleted'),
    ('RUN', 'Running'),
    ('STOP', 'Stopped')
)
class ProvidedApisStatus(models.Model):
    stat                    = models.CharField(max_length=4, choices = STAT_TYPE, blank=False, null=False, default='DEL')
    
class ProvidedApiPlan(models.Model):
    name                    = models.CharField(max_length=100)
    maxQuota                = models.PositiveIntegerField(default=50)
    maxQuotaPerMinute       = models.PositiveIntegerField(default=10)
    expiryDate              = models.DateTimeField(auto_now_add=False, null=True, default=None, )

    def __str__(self):
        return self.name
    
class AvailableApi(models.Model):
    name            = models.CharField(max_length=100)
    iconImage       = models.URLField(max_length=255, null=False, blank=False)
    iconHex         = models.CharField(max_length=50, null=False, blank=False)
    group           = models.CharField(max_length=50,null=False, blank=False)

    def __str__(self):
        return self.name
    
class Ab(BaseAPIRequestLog):
    token           = models.CharField(null=True, max_length=100, default=None)

class ProvidedApis(models.Model):
    token = models.CharField(max_length=100, blank=False, unique=True, null=False)
    api = models.ManyToManyField(AvailableApi, unique=False)
    locality = ArrayField(models.CharField(max_length=50), default=list)
    plan = models.ForeignKey(ProvidedApiPlan, on_delete=models.SET_NULL, null=True, unique=False,)
    api_stat  = models.ForeignKey(ProvidedApisStatus, on_delete=models.SET_NULL, null=True, unique=False,)
    user_id = models.UUIDField(editable=False)
    created_date = models.DateTimeField(auto_now_add=True)
    totalRequests = models.PositiveIntegerField(default=0)
    failedRequestsCount = models.PositiveIntegerField(default=0)
    avgResponseMs = models.PositiveIntegerField(default=0)

class Vehicles(models.Model):
    id   = models.CharField(max_length=10, primary_key=True)
    
class Xyzd(models.Model):
    veh = models.ForeignKey(Vehicles, on_delete=models.SET_NULL, null=True, unique=False,)
    plan = models.ForeignKey(ProvidedApis, on_delete=models.CASCADE)
    
    class Meta:
        verbose_name = 'Multi Token'