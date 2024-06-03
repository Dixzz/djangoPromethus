from django.contrib import admin
from .models import *
from django.utils.safestring import mark_safe
from leaflet.admin import LeafletGeoAdmin
from django.db.models import Count
from django.db.models.functions import TruncDay
from django.urls import path
from django.http import JsonResponse

@admin.register(Ab)
class APIRequestLogAdmin(admin.ModelAdmin):
    date_hierarchy = "requested_at"
    list_display = (
        "id",
        "requested_at",
        "response_ms",
        "status_code",
        "user",
        "view_method",
        "path",
        "remote_addr",
        "host",
        "query_params",
    )
    ordering = ("-requested_at",)
    list_filter = ("view_method", "status_code", "requested_at")
    search_fields = (
        "path",
        "user__email",
    )
    raw_id_fields = ("user",)

    if True:
        readonly_fields = (
            "user",
            "username_persistent",
            "requested_at",
            "response_ms",
            "path",
            "view",
            "view_method",
            "remote_addr",
            "host",
            "method",
            "query_params",
            "data",
            "response",
            "errors",
            "status_code",
        )

    def changelist_view(self, request, extra_context=None):
        # Aggregate api logs per day
        chart_data = (
            Ab.objects.annotate(date=TruncDay("requested_at"))
            .values("date")
            .annotate(y=Count("id"))
            .order_by("-date")
        )

        extra_context = extra_context or {"chart_data": list(chart_data)}

        # Call the superclass changelist_view to render the page
        return super().changelist_view(request, extra_context=extra_context)

    def get_urls(self):
        urls = super().get_urls()
        extra_urls = [
            path("chart_data/", self.admin_site.admin_view(self.chart_data_endpoint))
        ]
        return extra_urls + urls

    # JSON endpoint for generating chart data that is used for dynamic loading
    # via JS.
    def chart_data_endpoint(self, request):
        start_date = request.GET.get("start_date")
        end_date = request.GET.get("end_date")

        # convert start_date and end_date to datetime objects
        start_date = datetime.datetime.strptime(start_date, "%Y-%m-%d").date()
        end_date = datetime.datetime.strptime(end_date, "%Y-%m-%d").date()

        chart_data = self.chart_data(start_date, end_date)
        return JsonResponse(list(chart_data), safe=False)

    def chart_data(self, start_date, end_date):
        return (
            Ab.objects.filter(
                requested_at__date__gte=start_date, requested_at__date__lte=end_date
            )
            .annotate(date=TruncDay("requested_at"))
            .values("date")
            .annotate(y=Count("id"))
            .order_by("-date")
        )

@admin.register(RecievingPotholeImages)
class MappingPotholeImagesAdmin(LeafletGeoAdmin):
    list_display = ['name','RCreated_date','user_id','raw_picture','processed_picture','company_id','rawImageUrl','maskedImageUrl']
    # list_filter = ['country_name','state_name','RCreated_date','company_id']
    list_filter = ['RCreated_date','company_id']
    search_fields = ['name',]
    save_as = True
    readonly_fields = ['RCreated_date','display_raw_picture','display_processed_picture']

    fieldsets = (
        ('Basic Details', {
            'fields': ('name', 'area', 'number')
        }),
        # ('Location', {
        #     'fields': ('road_name',('country_name', 'state_name',),('cordinate_X', 'cordinate_Y'))
        # }),
        ('Location', {
            'fields': ('cordinate_X', 'cordinate_Y')
        }),
        ('Coordinates', {
            'fields': ('point',)
        }),
        ('Image', {
            'fields': ('rawImage', 'maskedImage',('display_raw_picture','display_processed_picture'))
        }),
        ('Company', {
            'fields': ('RCreated_date', 'user_id','company_id')
        }),
    )

    def raw_picture(self, obj):
        if obj.rawImage:
            return mark_safe('<img src="{url}" width="100" height=100 />'.format(url = obj.rawImage.url,))
        else:
            return '(Image not found)'
    raw_picture.short_description = 'Raw Image'

    def processed_picture(self, obj):
        if obj.maskedImage:
            return mark_safe('<img src="{url}" width="100" height=100 />'.format(url = obj.maskedImage.url,))
        else:
            return '(Image not found)'
    processed_picture.short_description = 'Processed Image'

    def display_raw_picture(self, obj):
        if obj.rawImage:
            return mark_safe('<img src="{url}" width="400" height=400 />'.format(url = obj.rawImage.url,))
        else:
            return '(Image not found)'
    display_raw_picture.short_description = 'Raw Image'

    def display_processed_picture(self, obj):
        if obj.maskedImage:
            return mark_safe('<img src="{url}" width="400" height=400 />'.format(url = obj.maskedImage.url,))
        else:
            return '(Image not found)'
    display_processed_picture.short_description = 'Processed Image'


@admin.register(PotholeUpdationImages)
class UpdatingPotholeImagesAdmin(admin.ModelAdmin):
    """ Admin Panel for Updated Image """
    
    list_display = ['name','created_date','is_filled','checked','updated_picture']
    list_filter = ['created_date',]
    search_fields = ['name',]
    save_as = True
    readonly_fields = ['created_date','display_updated_picture','updated_picture']

    fieldsets = (
        ('Basic Details', {
            'fields': ('name',)
        }),
        ('Location', {
            'fields': ('cordinate_X', 'cordinate_Y',)
        }),
        ('Image', {
            'fields': ('updated_image',('display_updated_picture',))
        }),
        ('Company', {
            'fields': ('created_date', 'is_filled','checked')
        }),
    )

    def display_updated_picture(self, obj):
        if obj.updated_image:
            return mark_safe('<img src="{url}" width="100" height=100 />'.format(url = obj.updated_image.url,))
        else:
            return '(Image not found)'
    display_updated_picture.short_description = 'Updated Image'

    def updated_picture(self, obj):
        if obj.updated_image:
            return mark_safe('<img src="{url}" width="100" height=100 />'.format(url = obj.updated_image.url,))
        else:
            return '(Image not found)'
    updated_picture.short_description = 'Updated Image'


@admin.register(ConversionTable)
class ConversionObjectsAdminTable(admin.ModelAdmin):
    """Admin Table for conversion Objects """
    fieldsets = (
        ('Details', {
            'fields': ('name',)
        }),
    )


































































##
