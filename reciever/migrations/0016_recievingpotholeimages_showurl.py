# Generated by Django 2.2.24 on 2022-11-01 14:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('reciever', '0015_auto_20221028_2141'),
    ]

    operations = [
        migrations.AddField(
            model_name='recievingpotholeimages',
            name='showUrl',
            field=models.URLField(blank=True, default=None, max_length=255, null=True),
        ),
    ]