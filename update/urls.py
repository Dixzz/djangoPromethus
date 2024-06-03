from django.urls import path, include

from rest_framework.routers import DefaultRouter
from .models import *
from . import views


urlpatterns = [
    path('', views.UpdatePotholeImageAPIView.as_view()),   #API Update Image
    path('MSingle/', views.MappingSinglePhoto.as_view()),
]
