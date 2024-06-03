"""GisServer URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
# from django.conf import settings
from django.contrib import admin
from django.urls import path, include
from reciever import views
# from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('receiver/', include('reciever.urls')),
    path('filled/', include('filled.urls')),
    path('update/', include('update.urls')),
    path('user/', include('user.urls')),
    path('points/', include('points.urls')),
    path('analytics/', include('analytics.urls')),
]

# ---------------------------------------------------------------------------- #
#SILK

urlpatterns += [path('silk/', include('silk.urls', namespace='silk'))]

# ---------------------------------------------------------------------------- #
# DEBUG TOOLBAR

import debug_toolbar
from django.conf import settings
urlpatterns += [path('__debug__/', include(debug_toolbar.urls))]