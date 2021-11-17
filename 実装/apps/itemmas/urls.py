from django.urls import path
from . import views

appname = 'item'
urlpatterns = [
    path('S03-01/',views.S0301View.as_view(),name = "S03-01"),
    path('S03-02/',views.S0302View.as_view(),name = "S03-02"),
    path('S03-03/',views.S0303View.as_view(),name = "S03-03"),
    path('S03-04/',views.S0304View.as_view(),name = "S03-04"),
]