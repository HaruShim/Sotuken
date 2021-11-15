from django.urls import path
from . import views

appname = 'bottleneck'
urlpatterns = [
    path('',views.BottleneckView.as_view(),name = "master_bottleneck"),
]