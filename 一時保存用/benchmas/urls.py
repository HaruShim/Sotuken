from django.urls import path
from . import views

appname = 'bench'
urlpatterns = [
    path('',views.BenchView.as_view(),name = "master_bench"),
]