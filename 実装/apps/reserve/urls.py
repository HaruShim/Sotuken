"""reserver.urls.py

* 取置予約の画面をルーティングするモジュール

Todo:

    * これ見てgitのappsのurls全部変更お願いします　〇
    * このアプリで使用するhtmlのpathを全て追加　〇
    * pathのurlpatternsを矢印の下のもので統一してください!　〇
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

appname = 'reserver'
urlpatterns = [
    path('S09-01/',views.S0901View.as_view(),name = "S09-01"),
    path('S09-02/',views.S0902View.as_view(),name = "S09-02"),
    path('S09-03/',views.S0903View.as_view(),name = "S09-03"),
    path('S09-04/',views.S0904View.as_view(),name = "S09-04"),
]