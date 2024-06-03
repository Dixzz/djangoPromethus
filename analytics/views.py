from django.shortcuts import render
from rest_framework import generics
from rest_framework import viewsets
from rest_framework import permissions

from .models import *
from .serializers import *

# class GrafanaMapPlotView(generics.ListAPIView):
#     queryset 