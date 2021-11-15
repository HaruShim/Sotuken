from django.urls import path
from . import views

appname = 'gpu_bottleneck'
urlpatterns = [
    path('',views.GpuBottleneckView.as_view(),name = "master_gpu_bottleneck"),
]