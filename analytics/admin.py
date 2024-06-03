from django.contrib import admin
from .models import *

admin.site.site_header = "Receiver Server"
admin.site.site_title = "Receiver Server"
admin.site.index_title = "Receiver Server"


@admin.register(grafana_server_list)
class GrafanaServerListAdmin(admin.ModelAdmin):
    list_display = ['server_name',
                    'app_name']

    list_editable = ['app_name']
    
    search_fields = ['server_name','app_name',]
    save_as = True


@admin.register(grafana_api_list)
class GrafanaAPIListAdmin(admin.ModelAdmin):
    list_display = [
        'server_name',
        'api_name',
        'short_desc',
        'path'
    ]

    list_editable = ['api_name']
    search_fields = ['api_name','short_desc']
    save_as = True

@admin.register(ReceiverAnalytics)
class ReceiverAnalyticsAdmin(admin.ModelAdmin):
    list_display = [
        'ip_address',
        'content_type',
        'timestamp',
        # 'status',
        'execution_time',
        'longitude',
        'latitude',
        'request_type'
    ]

    save_as = True

@admin.register(enum_mappng)
class EnumMappingAdmin(admin.ModelAdmin):
    list_display = [
        'enum',
        'class_full_name',
    ]

    search_fields = ['enum','class_full_name']
    save_as = True


class GrafanaMappingAdmin(admin.ModelAdmin):
     list_display = [
        'server',
        'enum',
        'table_name'
    ]


admin.site.register(grf_mappng, GrafanaMappingAdmin)

admin.site.register(MapPlotHelper)
admin.site.register(GrafanaMapPlot)