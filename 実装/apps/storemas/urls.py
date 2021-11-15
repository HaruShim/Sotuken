from django.urls import path
from . import views

appname = 'store'
urlpatterns = [
    path('',views.StoreView.as_view(),name = "master_store"),
]