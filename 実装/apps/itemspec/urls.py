from django.urls import path
from . import views

appname = 'item'
urlpatterns = [
    path('',views.ItemSpecView.as_view(),name = "master_item_spec"),

]