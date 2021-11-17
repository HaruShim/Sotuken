from django.urls import path
from . import views

appname = 'item'
urlpatterns = [
    path('S07-01/',views.S0701View.as_view(),name = "S07-01"),
    path('S07-02/',views.S0702View.as_view(),name = "S07-02"),
    path('S07-03/',views.S0703View.as_view(),name = "S07-03"),
    path('S07-04/',views.S0704View.as_view(),name = "S07-04"),

]