from django.urls import path
from . import views

appname = 'gpu_bottleneck'
urlpatterns = [
    path('S01-01/',views.S0101View.as_view(),name = "S01-01"),
]