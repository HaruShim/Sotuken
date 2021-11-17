from django.urls import path
from . import views

appname = 'employee'
urlpatterns = [
    path('S01-01/',views.S0101View.as_view(),name = "S01-01"),
    path('S01-02/',views.S0102View.as_view(),name = "S01-02"),
    path('S01-03/',views.S0103View.as_view(),name = "S01-03"),
    path('S01-04/',views.S0104View.as_view(),name = "S01-04"),
    path('S01-05/',views.S0105View.as_view(),name = "S01-05"),

]