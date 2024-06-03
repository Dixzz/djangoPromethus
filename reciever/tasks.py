# Create your tasks here
from __future__ import absolute_import, unicode_literals

from celery import shared_task
# from demoapp.models import Widget

### details
from celery.task import periodic_task
from celery.schedules import crontab
from celery.decorators import task

### logging
from celery.utils.log import get_task_logger

logger = get_task_logger(__name__)


# @periodic_task(run_every=(crontab(minute = '*')), name = 'my_first_task')
# def my_first_task():
#     with open("test.txt", "a") as myfile:
#         myfile.write("appended text")
#     print('hello World')


@task(name="sum_two_numbers")
def add(x, y):
    logger.info('values added')
    return x + y

"""
Documentation Used: https://medium.com/the-andela-way/crontabs-in-celery-d779a8eb4cf
                    https://pinoylearnpython.com/django-celery-with-real-time-monitoring-tasks-using-flower/

Important Doc : https://realpython.com/asynchronous-tasks-with-django-and-celery/
"""

from .models import *
import schedule
import time

@periodic_task(
    run_every=(crontab(minute=0, hour=6, day_of_month='*')),
    name = 'point conversion task',
    # run_every=(crontab(minute='*')),
    ignore_result=True,
)
def job_update_cordinates():
    for name in ConversionTable.objects.all():
        try:
            Recieved_object = RecievingPotholeImages.objects.filter(name__contains=name)[0]
            print(Recieved_object)
            Recieved_object.point = Point(x=Recieved_object.cordinate_Y, y=Recieved_object.cordinate_X, srid=4326)
            Recieved_object.save()
            print(Recieved_object, 'this object is saved')
            ConversionTable.objects.filter(name__contains=name)[0].delete()
            print(name, 'from ConversionTable object is deleted')
            logger.info("converted")
        except Exception as e:
            responseData = e
            print(responseData)

# @task(name='test_celery_beat')
# def test_celery_beat():
#     print('test celery beat')



# @shared_task
# def mul(x, y):
#     return x * y


# @shared_task
# def xsum(numbers):
#     return sum(numbers)