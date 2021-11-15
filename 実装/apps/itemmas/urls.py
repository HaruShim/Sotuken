from django.urls import path
from . import views

appname = 'item'
urlpatterns = [
    path('',views.ItemView.as_view(),name = "master_item"),

]