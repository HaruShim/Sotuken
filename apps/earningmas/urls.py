from django.urls import path
from . import views

appname = 'earning'
urlpatterns = [
    path('',views.EarningView.as_view(),name = "master_earning"),
]