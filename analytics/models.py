from django.db import models
from django.utils.translation import gettext as _
import pdb

# ---------------------------------------------------------------------------- #
#                             LISTING ALL THE APIs                             #
# ---------------------------------------------------------------------------- #

class grafana_server_list(models.Model):
    """Server List """
    server_name = models.CharField(_("Name of server where API is present"),
                    max_length=50,
                    null=True,
                    blank=False)

    app_name    = models.CharField(_("Name of App under which API is listed"),
                     max_length=50,
                     null=True,
                     blank=False)

    def __str__(self):
        return str(str(self.server_name) + '-' + str(self.app_name))

    class Meta:
        verbose_name = 'App Index'
        verbose_name_plural = 'App Index'


class grafana_api_list(models.Model):
    """Api List"""

    server_name = models.ForeignKey("grafana_server_list",
                    verbose_name=_("Server_name - App_name"),
                    on_delete=models.CASCADE)

    api_name    = models.CharField(_("Name of Api"),
                     max_length=255,
                     null=True,
                     blank=False,
                     unique=True)

    short_desc  = models.CharField(_("Description of API"),
                     max_length=255,
                     null=True,
                     blank=False)

    path        = models.URLField(_("Link for Django API"), 
                    max_length=255,
                    null=True,
                    blank=False,
                    unique=True)

    def __str__(self):
        return str(self.api_name)

    class Meta:
        verbose_name = 'Api Index'
        verbose_name_plural = 'Api Index'


class enum_mappng(models.Model):
    """ Enum Mapping Table """

    enum                = models.CharField(_("Enum for API"), max_length=4)
    class_full_name     = models.CharField(_("Enter the Class or Reuqest Name"), max_length=255)

    class Meta:
        verbose_name = _("Enum Mapping")
        verbose_name_plural = _("Enum Mappings")

    def __str__(self):
        return str(self.class_full_name)

class grf_mappng(models.Model):
    """ Grafana Mapping Table """
    
    server = models.ForeignKey("grafana_server_list", 
                                verbose_name=_("server_name__app_name"), 
                                on_delete=models.CASCADE)
    enum   = models.ForeignKey("enum_mappng", 
                                verbose_name=_("Class Full Name"), 
                                on_delete=models.CASCADE)
    table_name = models.CharField(_("Db Table Name"), max_length=255, null=True, blank=True)

    class Meta:
        verbose_name = _("Grafana Mapping")
        verbose_name_plural = _("Grafana Mappings")

    def __str__(self):
        return str(self.enum)

# ----------------------------- HELPER FUNCTION ---------------------------------- #


def MapPlotFiller():
    """Fill Table MapPlotHelper
        latitude -90 + 90
        longitude -180 + 180
    """
    count = 0
    for i in range(-90, 90, 1):
        for j in range(-180, 180, 1):
            MapPlotHelper.objects.create(map_longitude=i+0.5,
                                         map_latitude=j+0.5)
            print('Object Created')
            count += 1
            print('count is {}'.format(count))

# --------------------------------------------------------------------------- #

class MapPlotHelper(models.Model):
    """ 
    This Table contains points for plotting of maps on grafana
    """

    map_longitude   = models.FloatField(blank=True, null=True)
    map_latitude    = models.FloatField(blank=True, null=True)

    class Meta:
        ordering = ['map_longitude']


def signal_MapPlotHelper(lat, lon, instance):
    """ """
    # Rounding off
    rounded_lat = round(lat) + 0.5
    rounded_lon = round(lon) + 0.5
    # Optimising Extreme cases
    if rounded_lat > 179.5:
        rounded_lat = 179.5
    if rounded_lon > 89.5:
        rounded_lon = 89.5
    value = MapPlotHelper.objects.filter(
        map_longitude=rounded_lon).filter(map_latitude=rounded_lat).get()
    # check instance and update count
    if instance == 'cntr':
        # print(value.cntr)
        # old = value.cntr
        # old = old + 1
        # MapPlotHelper.objects.filter(map_longitude=rounded_lon).filter(
        #     map_latitude=rounded_lat).update(cntr=old)
        # GrafanaMapPlot.objects.create(plot_cordinate=value, cntr=old)
        GrafanaMapPlot.objects.create(plot_cordinate=value, cntr=1)
    if instance == 'nrby':
        # print(value.nrby)
        # old = value.nrby
        # old = old + 1
        # MapPlotHelper.objects.filter(map_longitude=rounded_lon).filter(
        #     map_latitude=rounded_lat).update(nrby=old)
        # GrafanaMapPlot.objects.create(plot_cordinate=value, nrby=old)
        GrafanaMapPlot.objects.create(plot_cordinate=value, nrby=1)
    if instance == 'dcnt':
        # print(value.dcnt)
        # old = value.dcnt
        # old = old + 1
        # MapPlotHelper.objects.filter(map_longitude=rounded_lon).filter(
        #     map_latitude=rounded_lat).update(dcnt=old)
        # GrafanaMapPlot.objects.create(plot_cordinate=value, dcnt=old)
        GrafanaMapPlot.objects.create(plot_cordinate=value, dcnt=1)
    if instance == 'abox':
        # print(value.abox)
        # old = value.abox
        # old = old + 1
        # MapPlotHelper.objects.filter(map_longitude=rounded_lon).filter(
        #     map_latitude=rounded_lat).update(abox=old)
        # GrafanaMapPlot.objects.create(plot_cordinate=value, abox=old)
        GrafanaMapPlot.objects.create(plot_cordinate=value, abox=1)
    if instance == 'wbox':
        # print(value.wbox)
        # old = value.wbox
        # old = old + 1
        # MapPlotHelper.objects.filter(map_longitude=rounded_lon).filter(
        #     map_latitude=rounded_lat).update(wbox=old)
        # GrafanaMapPlot.objects.create(plot_cordinate=value, wbox=old)
        GrafanaMapPlot.objects.create(plot_cordinate=value, wbox=1)
    if instance == 'gnrl':
        # print(value.gnrl)
        # old = value.gnrl
        # old = old + 1
        # MapPlotHelper.objects.filter(map_longitude=rounded_lon).filter(
        #     map_latitude=rounded_lat).update(gnrl=old)
        # GrafanaMapPlot.objects.create(plot_cordinate=value, gnrl=old)
        GrafanaMapPlot.objects.create(plot_cordinate=value, gnrl=1)
    if instance == 'gnll':
        # print(value.gnll)
        # old = value.gnll
        # old = old + 1
        # MapPlotHelper.objects.filter(map_longitude=rounded_lon).filter(
        #     map_latitude=rounded_lat).update(gnll=old)
        # GrafanaMapPlot.objects.create(plot_cordinate=value, gnll=old)
        GrafanaMapPlot.objects.create(plot_cordinate=value, gnll=1)
    print('reached')


class GrafanaMapPlot(models.Model):
    timestamp       = models.DateTimeField(auto_now_add=True)
    plot_cordinate  = models.ForeignKey("MapPlotHelper", on_delete=models.CASCADE)
    cntr            = models.IntegerField(_("Metric for Country Analytics"),
                              null=True, blank=True, default=0)
    nrby            = models.IntegerField(_("Metric for Nearby Analytics"),
                              null=True, blank=True, default=0)
    dcnt            = models.IntegerField(_("Metric for Distinct Count Analytics"),
                              null=True, blank=True, default=0)
    abox            = models.IntegerField(_("Metric for Android Bounding Box Analytics"),
                              null=True, blank=True, default=0)
    wbox            = models.IntegerField(_("Metric for Web Bounding Box Analytics"),
                              null=True, blank=True, default=0)
    gnrl            = models.IntegerField(_("Metric for Generic Leaflet Analytics"),
                              null=True, blank=True, default=0)
    gnll            = models.IntegerField(_("Metric for Generic Leaflet with Location Analytics"),
                              null=True, blank=True, default=0)
    eabx            = models.IntegerField(_("Metric for Exception of Android Bounding Box Analytics"),
                              null=True, blank=True, default=0)
    ewbx            = models.IntegerField(_("Metric for Exception of Web Bounding Box Analytics"),
                              null=True, blank=True, default=0)
    ecnt            = models.IntegerField(_("Metric for Exception of Country Analytics"),
                              null=True, blank=True, default=0)
    entr            = models.IntegerField(_("Metric for Exception of Near By Location Analytics"),
                              null=True, blank=True, default=0)
    egnl            = models.IntegerField(_("Metric for Exception of Generic Leaflet Analytics"),
                              null=True, blank=True, default=0)
    egll            = models.IntegerField(_("Metric for Exception of Generic LeafLet with Location Analytics"),
                              null=True, blank=True, default=0)
    edct            = models.IntegerField(_("Metric for Exception of Distinct Country Count Analytics"),
                              null=True, blank=True, default=0)


# ---------------------------------------------------------------------------- #
#                                BASE ANALYTICS                                #
# ---------------------------------------------------------------------------- #
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from .signals import object_viewed_signal
from .utils import get_client_ip
import pdb

class BaseAnalytics(models.Model):
    """
    These are the base fields for all the anlytics table for all
    the apps
    """

    ip_address      = models.CharField(max_length=220, blank=True, null=True)
    content_type    = models.ForeignKey(
        "contenttypes.ContentType", on_delete=models.CASCADE, blank=True, null=True)
    timestamp       = models.DateTimeField(auto_now_add=True)
    # status          = models.IntegerField(blank=True, null=True)
    # execution_time  = models.TimeField(verbose_name='Time Taken for each qeury to execute')
    execution_time  = models.FloatField()

# ---------------------------------------------------------------------------- #
#                              RECIEVER ANALYTICS                              #
# ---------------------------------------------------------------------------- #


RECEIVER_REQUEST_TYPE = (
    ('ABOX', 'Android Bounding Box'),
    ('WBOX', 'Web Bounding Box'),
    ('CNTR', 'Country'),
    ('NRBY', 'Near By'),
    ('GNRL', 'Generic Leaflet'),
    ('GNLL', 'Generic Leaflet with Location'),
    ('DCNT', 'Distinct Country Count'),
    ('EABX', 'Exception Android Bounding Box'),
    ('EWBX', 'Exception Web Bounding Box'),
    ('ECNT', 'Exception Country'),
    ('ENTR', 'Exception Near By'),
    ('EGNL', 'Exception Generic Leaflet'),
    ('EGLL', 'Exception Generic Leaflet with Location'),
    ('EDCT', 'Exception Distinct Country Count'),
    ## Add exceptions in all these here
)


class ReceiverAnalytics(BaseAnalytics):
    """reciever analytics"""

    longitude      = models.FloatField(blank=True, null=True)
    latitude       = models.FloatField(blank=True, null=True)
    request_type   = models.CharField(max_length=4, choices = RECEIVER_REQUEST_TYPE)
    metric         = models.IntegerField(_("Metric for Map Analytics"), null=True, blank=True, default=1)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Receiver Analytics'
        verbose_name_plural = 'Receiver Analytics'

# SIGNAL
def receiverAnalyticsSignal(sender, request, request_type, time,
                                longitude, latitude ,*args, **kwargs):
    # pdb.set_trace()
    c_type = ContentType.objects.get_for_model(sender)
    new_call_obj = ReceiverAnalytics.objects.create(
        ip_address     = get_client_ip(request),
        content_type   = c_type,
        request_type   = request_type,
        longitude      = longitude,
        latitude       = latitude,
        execution_time = time,
    )
    print(new_call_obj)

    try:
        # pdb.set_trace()
        signal_MapPlotHelper(lat=float(latitude), lon=float(longitude), instance=request_type.lower())
    except Exception as e:
        print('Signal Map Plot Helper is not Working')


object_viewed_signal.connect(receiverAnalyticsSignal)




# ---------------------------------------------------------------------------- #




# ---------------------------------------------------------------------------- #
#                                 GRAFANA TEST                                 #
# ---------------------------------------------------------------------------- #

# from prometheus_client import Counter

# c = Counter('my_failures', 'Description of counter')
# c.inc()     # Increment by 1
# c.inc(1.6)  # Increment by given value



# ---------------------------------------------------------------------------- #


















