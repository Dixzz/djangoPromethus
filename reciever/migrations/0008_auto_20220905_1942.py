# Generated by Django 2.2.24 on 2022-09-05 14:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('reciever', '0007_remove_providedapis_totalrequestpermin'),
    ]

    operations = [
        migrations.AlterField(
            model_name='providedapis',
            name='enabled',
            field=models.BooleanField(default=True),
        ),
    ]
