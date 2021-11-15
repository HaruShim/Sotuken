from django.urls import path
from . import views

appname = 'bottleneck'
urlpatterns = [
    path('',views.CpuBottleneckView.as_view(),name = "master_cpu_bottleneck"),
]