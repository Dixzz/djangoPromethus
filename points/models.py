from django.db import models

# Create your models here.

class PostalCodeModel(models.Model):
    code = models.PositiveIntegerField(primary_key=True)
    
    
class AreaModel(models.Model):
    name = models.TextField(verbose_name='Area Covering Name')
    area_pin = models.ForeignKey(PostalCodeModel, on_delete=models.CASCADE)
    enabled = models.BooleanField()