import folium
import os
# from django.conf import settings
from GisServer import settings
# import settings

m = folium.Map(location=[42.3601, -71.0589], zoom_start=12)
print(settings.BASE_DIR)

# path = os.path.join(settings.BASE_DIR/templates, 'map.html')
# print(path)
# m.save(path)