# Generated by Django 2.2 on 2020-10-14 17:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('analytics', '0010_remove_baseanalytics_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='baseanalytics',
            name='execution_time',
            field=models.IntegerField(),
        ),
    ]