# Generated by Django 2.2.24 on 2023-06-07 13:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('reciever', '0027_auto_20230510_0956'),
    ]

    operations = [
        migrations.CreateModel(
            name='ChildHeaderSender',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image_url', models.TextField(blank=True, null=True, verbose_name='Bucket Image Link')),
                ('name', models.CharField(max_length=50, unique=True)),
            ],
            options={
                'db_table': 'images_childheadersender',
                'managed': False,
            },
        ),
    ]