# Generated by Django 2.2.24 on 2022-09-04 19:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('reciever', '0005_providedapis_maxquota'),
    ]

    operations = [
        migrations.AddField(
            model_name='providedapis',
            name='maxQuotaPerMinute',
            field=models.PositiveIntegerField(default=10),
        ),
        migrations.AddField(
            model_name='providedapis',
            name='totalRequestPerMin',
            field=models.PositiveIntegerField(default=0),
        ),
    ]