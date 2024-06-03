import os
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'GisServer.settings')

import django
django.setup()

import random
from reciever import *
from faker import Faker
from django.utils import timezone
import uuid
from django.core.files.uploadedfile import SimpleUploadedFile
from django.conf import settings
from django.contrib.gis.geos import Point
from reciever.models import RecievingPotholeImages
from django.db.models.signals import post_save, pre_save
from django.contrib.gis.geos import Point
from django.db.models import Manager as GeoManager


fakegen = Faker()

def create_PotholeImages(N):
    fake = Faker()
    for _ in range(N):
        name = uuid.uuid4()
        area = random.randint(1, 1000)
        number = random.randint(1, 10)
        country_name = random.choice(['India',])
        cordinate_X, cordinate_Y, road_name, state_name, timezone = fake.local_latlng(country_code='IN',coords_only=False) 
        ROwner = fake.name()
        agency_name = random.choice(['NDMC', 'DDA', 'PWD', 'SDMC'])
        # import pdb;pdb.set_trace()
        base_path = os.path.join(settings.BASE_DIR, 'png_images/')
        image_path = os.path.join(base_path, 'sepia.jpeg')
        rawImage = SimpleUploadedFile(name='sepia.jpeg', content=open(image_path, 'rb').read(), content_type='image/jpeg')
        image_path = os.path.join(base_path, 'sepia_1.jpeg')
        maskedImage = SimpleUploadedFile(name='sepia_1.jpeg', content=open(image_path, 'rb').read(), content_type='image/jpeg')
        RecievingPotholeImages.objects.create(
            name            = name,
            area            = area,
            number          = number,
            country_name    = country_name,
            cordinate_X     = cordinate_X,
            cordinate_Y     = cordinate_Y,
            road_name       = road_name,
            state_name      = state_name,
            agency_name     = agency_name,
            rawImage        = rawImage,
            maskedImage     = maskedImage,
            ROwner          = ROwner,
        )
        print(
                name,
                area,
                number,
                country_name,
                cordinate_X,
                cordinate_Y,
                road_name,
                state_name,
                agency_name,
                rawImage,
                maskedImage,
                ROwner,
    )

create_PotholeImages(N = 5)
print('Data is populated sucessfully')








