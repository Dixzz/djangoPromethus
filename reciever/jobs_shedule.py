#### Daily Jobs ###
# from .views import my_stack
# from .models import *

# recievedImageName = []

# def job_update_cordinates():
#     # len(recievedImageName)
#     for i in len(recievedImageName):
#         print('loop ran from ', i)
#         try:
#             name_of_object = recievedImageName.pop()
#             for l in RecievingPotholeImages.objects.filter(name__contains=name_of_object):
#                 l.point = Point(x=l.cordinate_Y, y=l.cordinate_X, srid=4326)
#                 l.save()
#         except Exception as e:
#             responseData = e
#             print(responseData)

# """
# def ConversionofCordinates():
#     """ from coordinates to PointField """
#     for l in RecievingPotholeImages.objects.all():
#         l.point = Point(x=l.cordinate_Y, y=l.cordinate_X, srid=4326)
#         l.save()
#         print('cordinates saved for', l)
#         print('point is :', l.point)
#         print('cordinate_Y is :', l.cordinate_Y)
#         print('cordinate_X is :', l.cordinate_X)
#     """
#     SRID=4326;POINT (77.2104271 28.6889141)

#     SRID=4326;POINT (77.2420588 28.5953139)

#     Location.objects.all().update(point=Point(x=F('longitude'), y=F('latitude'), srid=4326)

#     RecievingPotholeImages.objects.filter(name__contains=data['name']).update(point=Point(x=float(data['cordinate_Y']), y=float(data['cordinate_X']), srid=4326)

#     """



# my_stack = []
# myStack.append(data['name'])

# myStack
# myStack.pop()
#     l = RecievingPotholeImages.objects.filter(name__contains=data['name']).update(point=Point(x=float(data['cordinate_Y']), y=float(data['cordinate_X']), srid=4326)
#     print('updated value of ')

#     or
#     l = RecievingPotholeImages.objects.filter(name__contains=data['name'])
#     l.point = Point(x=l.cordinate_Y, y=l.cordinate_X, srid=4326)
#     l.save()

# exception IndexError

































