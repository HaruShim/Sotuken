from django.urls import path
from . import views

appname = 'store'
urlpatterns = [
    path('S09-01/',views.S0901View.as_view(),name = "S09-01"),
    path('S09-02/',views.S0902View.as_view(),name = "S09-02"),
    path('S09-03/',views.S0903View.as_view(),name = "S09-03"),
    path('S09-04/',views.S0904View.as_view(),name = "S09-04"),
]