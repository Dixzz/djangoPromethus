# Generated by Django 2.2.24 on 2023-04-19 20:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('reciever', '0024_vehicles_xyzd'),
    ]

    operations = [
        migrations.AddField(
            model_name='providedapiplan',
            name='expiryDate',
            field=models.DateTimeField(default=None, null=True),
        ),
    ]
