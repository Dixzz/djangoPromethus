from django.urls import path, include
from .views import *
# from reciever.groups import available_api_group

urlpatterns = [
    path('api/v1/nearby',  NearByLocationApiView.as_view(), kwargs={'group': 'points'}),
    path('api/v1/all',  NearByLocationApiViewAll.as_view(), kwargs={'group': 'points', 'pass': 'yes'}),
    path('api/v1/bbox',  NearByBboxApiView.as_view(), kwargs={'group': 'points'}),
]   