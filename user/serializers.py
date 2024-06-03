from rest_framework import serializers
from user import models

class UserSerializer(serializers.ModelSerializer):  
    """User Serailiaizer"""

    class Meta:
        model = models.User
        fields = '__all__'


