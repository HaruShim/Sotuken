from django.urls import path
from . import views

appname = 'aaaaa'
urlpatterns = [
    path('',views.AaaaaView.as_view(),name = "aaaaa"),
]

