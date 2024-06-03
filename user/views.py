from django.shortcuts import render
from rest_framework import permissions
from user import models,serializers
from rest_framework import generics
from rest_framework.response import Response
from rest_framework import status
import pdb

class SuperUserView(generics.ListCreateAPIView):
    """Create SuperUser Profile"""

    queryset = models.User.objects.all()
    serializer_class = serializers.UserSerializer
    permission_classes = (permissions.AllowAny,)

    def post(self, request, *args, **kwargs):
        data = request.data
        _mutable = data._mutable ## make the list mutable
        data._mutable = True
        data['is_superuser'] = True
        data['is_active'] = True
        data._mutable = _mutable
        return super().post(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        queryset = models.User.objects.filter(is_superuser = True)
        result = serializers.UserSerializer(queryset, many=True).data
        response = {
            'result' : result,
            'status' : status.HTTP_200_OK
        }
        return Response(response)

class StaffUserView(generics.ListCreateAPIView):
    """Create Staff User Profile"""
    
    queryset = models.User.objects.all()
    serializer_class = serializers.UserSerializer
    permission_classes = (permissions.AllowAny,)

    def post(self, request, *args, **kwargs):
        data = request.data
        _mutable = data._mutable ## make the list mutable
        data._mutable = True
        data['is_staff'] = True
        data['is_active'] = True
        data._mutable = _mutable
        return super().post(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        queryset = models.User.objects.filter(is_staff = True)
        result = serializers.UserSerializer(queryset, many=True).data
        response = {
            'result' : result,
            'status' : status.HTTP_200_OK
        }
        return Response(response)
