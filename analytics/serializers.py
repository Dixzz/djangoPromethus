from rest_framework import serializers
from .models import *

class GrafanaMapPlotSerializer(serializers.ModelSerializer):
    class Meta:
        model = GrafanaMapPlot
        fields = '__all__'


class MapPlotHelperSerializer(serializers.ModelSerializer):
    class Meta:
        model = MapPlotHelper
        fields = '__all__'