from django.urls import path, include

from rest_framework.routers import DefaultRouter
from filled import views


urlpatterns = [
    # path('geocoding/<str:latitude>,<str:longitude>/',views.InternalGeocodingView.as_view()),
]
