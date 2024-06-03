import folium
import os
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'GisServer.settings')
import django
django.setup()

from GisServer import settings
from reciever.models import *
from folium.plugins import MarkerCluster
from folium.plugins import FastMarkerCluster


## template joining
template_path = os.path.join(settings.BASE_DIR, 'templates')


"""Center for cordinate
Get Center of cordinate from open street maps nominatim
"""
### Create maps
m = folium.Map(location=[28.6517178, 77.2219388], zoom_start=1)

tooltip = 'Click for more info'

qs = RecievingPotholeImages.objects.all()

marker_cluster = MarkerCluster().add_to(m)
# marker_cluster = FastMarkerCluster().add_to(m)

for q in qs:
    folium.Marker([q.cordinate_X, q.cordinate_Y],
                    popup=q.rawImage,
                    tooltip=tooltip,
                    icon=folium.Icon(color='blue', icon='road')).add_to(marker_cluster)

### Create marker
folium.Marker([28.6217178, 77.2819388],
                popup='<strong>Location one</strong>',
                tooltip=tooltip).add_to(m)


## Save map
map_path = os.path.join(template_path, 'map.html')
m.save(map_path)
print(map_path)




"""
    folium.CircleMarker([q.cordinate_X, q.cordinate_Y],
                    popup=q.name,
                    tooltip=tooltip,
                    icon=folium.Icon(icon='cloud')).add_to(m)

    folium.Marker([q.cordinate_X, q.cordinate_Y],
                    popup=q.name,
                    tooltip=tooltip,
                    icon=folium.Icon(color='blue', icon='road')).add_to(m)

folium.Marker([q.cordinate_X, q.cordinate_Y],
                    popup=q.name,
                    tooltip=tooltip,
                    icon=folium.Icon(color='blue', icon='road')).add_to(marker_cluster)


"""

































