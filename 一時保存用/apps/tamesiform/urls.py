"""tamesi.urls

* お試しアプリの画面をルーティングするモジュール

Todo:

"""
from django.urls import path
from . import views

app_name = 'tamesi'
urlpatterns = [
    path('',views.HogeCreateView,name = "tamesi"),
    path('2/',views.add_post,name = "tamesi"),
    
]

