# Generated by Django 2.2 on 2020-10-14 12:43

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('analytics', '0009_auto_20201014_1757'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='baseanalytics',
            name='status',
        ),
    ]
