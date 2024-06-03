from django.urls import path, include, register_converter, re_path
from rest_framework.routers import DefaultRouter

from . import views, converters

router = DefaultRouter()


register_converter(converters.FloatUrlParameterConverter, 'float')

## receiving images from sender
# router.register('images', views.RecievingPotholeImagesViewSets)

urlpatterns = [
    ############################### Backend ##################################
    path('router/', include(router.urls)),
    path('generateToken/',  views.GenerateTokenForApiView.as_view()), # Generate token inputs Bearer token and API name
    path('generateSingleToken/',  views.GenerateTokenSingleApiView.as_view()), # Generate token inputs Bearer token and API name
    path('availableApis/',  views.AvailableApisApiView.as_view()), # Displays current supported APIS
    path('userAvailableApis/',  views.UserAvailableApisApiView.as_view()),
    re_path('hello/?(?P<token>\w+|)/$',  views.HelloView.as_view()),
    path('processSenderImages',  views.ProcessSenderImages.as_view(), kwargs={'nocheck': True}),
    # path('updPImg/', views.UpdatePotholeImageAPIView.as_view()), # updated image
    # path('mapAll/',views.MappingAllPhotosTogetherAPIView.as_view()), ## mapped images
    # path('mapS/',views.Mapping_photos_select_related.as_view()), ## mapping image single
    # path('mapAll/',views.Mapping_photos_select_related_all.as_view()), ## mapping image all

    path('images/', views.RecievingPotholeImagesView.as_view()), ## recieving images

    # path('nearbyallPotholes/', views.LocationsofAllPotholesApiView.as_view()), #NOTE DEPRICATED
    path('nearby/<float:longitude>,<float:latitude>/dis/<int:under_distance>/', views.NearByLocationApiView.as_view()),
    path('nearby/points/', views.ReceivingPointsAdminApiView.as_view()),
    path('nearby/points/<str:id>/', views.ReceivingPointsAdminApiViewSingle.as_view()),
    path('potholes/<float:longitude>,<float:latitude>/', views.NearByLocationApiViewPincode.as_view()),
    # path('potholes/<float:longitude>,<float:latitude>/', views.NearByLocationApiViewPincode.as_view(), kwargs=available_api_group['group_potholes']),
    path('potholes/<str:name>/', views.GetPotholeApiView.as_view()),
    # path('Serpynearby/', views.SerpyNearByLocationApiView.as_view()), #NOTE DEPRicATED

    ### STATE
    # marked without filled
    # path('state/', views.recieved_pothole_images_for_state.as_view()),

    # updated filled
    # path('stateUpd/', views.Mapping_photos_select_related_state_updated.as_view()),
    # path('stateCWF/', views.Mapping_photos_select_related_state_count_without_filled.as_view()),
    # path('stateCF/', views.Mapping_photos_select_related_state_count_with_filled.as_view()),

    ### COUNTRY
    # marked without filled
    # Permanently lock use for now, add 'kwargs=available_api_group["group_potholes"]' to enable
    path('<float:longitude>,<float:latitude>/', views.recieved_pothole_images_for_country.as_view()),

    # updated filled
    # path('countryUpd/', views.Mapping_photos_select_related_country.as_view()),
    # path('countryCWF/', views.MappingCountryFilled.as_view()),
    # path('countryRem/', views.MappingCountryRemaining.as_view()),

    path('username/', views.Mapping_photos_select_related_username.as_view()),

    # SECTION BBOX Polygon GEOMETRY̱
    path('bbox/', views.polygon_cordinates.as_view()),
    path('bbox_test/', views.polygon_cordinates.as_view()),
    path('servicedAreas/', views.InitialApiView.as_view()),
    path('servicedAreasBbox/', views.InitialApiViewBbox.as_view()),
    path('csvProvider/', views.ReturnFileCsvToClientSenderImages.as_view()),
    path('imageMeta/', views.ImageMetaApiView.as_view()),
    path('planGenerate/', views.GeneratePlanForApiView.as_view()),
    # path('SbboxPoly/', views.serpyPolygon_cordinates.as_view()),
    # path('SbboxDetail/', views.serpyDetailPolygon_cordinates.as_view()),
    
    ## MappingSingleImage
    # path('MSingle/', views.MappingSinglePhoto.as_view()),
    # path('MAll/', views.MappingAllPhoto.as_view()),

    # path('MCountry/', views.MappingCountry.as_view()),




    ############################### FrontEnd ##################################
    # path('', views.HomePageView.as_view(), name = 'home'),
    # path('pothole_data/', views.pothole_marked_datasets, name = 'pothole' ),
    # path('map/', views.folium_map),

]

"""
'ne_latitude': 28.568250476730853, 'sw_latitude': 28.540581851810035, 'sw_longitude': 77.23396919667721, 'ne_longitude': 77.2648685798049}
"""