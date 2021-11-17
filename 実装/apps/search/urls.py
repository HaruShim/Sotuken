"""search.urls.py

* 検索の画面をルーティングするモジュール

Todo:

    * これ見てgitのappsのurls全部変更お願いします　〇
    * このアプリで使用するhtmlのpathを全て追加　〇
    * pathのurlpatternsを矢印の下のもので統一してください!　〇
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

appname = 'search'
urlpatterns = [
    path('S08-01/',views.S0801View.as_view(),name = "S08-01"),
    path('S08-02/',views.S0802View.as_view(),name = "S08-02"),
    path('S08-03/',views.S0803View.as_view(),name = "S08-03"),
]