# Generated by Django 2.2.24 on 2022-12-04 20:29

from django.db import migrations, models
import reciever.models


class Migration(migrations.Migration):

    dependencies = [
        ('reciever', '0019_auto_20221116_0042'),
    ]

    operations = [
        migrations.CreateModel(
            name='ProcessedImagesRoadAsset',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image_url', models.TextField(blank=True, verbose_name='Bucket Image Link')),
                ('image', models.ImageField(blank=True, default=None, null=True, upload_to=reciever.models.UpdatedImageofPotholeImages)),
                ('verified', models.BooleanField(blank=True, default=None, null=True)),
            ],
        ),
    ]
