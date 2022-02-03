"""tamesi.urls

* お試しアプリの画面をルーティングするモジュール

Todo:

"""
from django.urls import path
from . import views

app_name = 'tamesi'
urlpatterns = [
    path('',views.TamesiView.as_view(),name = "tamesi"),
    path('2/',views.Tamesi2View.as_view(),name = "tamesi"),
    
]

