from django.urls import path, include

from rest_framework.routers import DefaultRouter
from .models import *
from user import views

urlpatterns = [
    path('super/', views.SuperUserView.as_view()),
    path('staff/', views.StaffUserView.as_view()),
]
