"""tamesi.urls

* お試しアプリの画面をルーティングするモジュール

Todo:

"""
from django.urls import path
from . import views

appname = 'tamesi'
urlpatterns = [
    path('',views.TamesiView.as_view(),name = "tamesi"),
]

