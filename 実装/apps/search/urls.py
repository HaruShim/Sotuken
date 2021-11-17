from django.urls import path
from . import views

appname = 'store'
urlpatterns = [
    path('S08-01/',views.S0801View.as_view(),name = "S08-01"),
    path('S08-02/',views.S0802View.as_view(),name = "S08-02"),
    path('S08-03/',views.S0803View.as_view(),name = "S08-03"),
]