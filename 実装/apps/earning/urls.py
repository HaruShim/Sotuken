"""earning.urls.py

* 売上の画面をルーティングするモジュール

Todo:

    * これ見てgitのappsのurls全部変更お願いします　〇
    * このアプリで使用するhtmlのpathを全て追加　〇
    * pathのurlpatternsを矢印の下のもので統一してください!　〇
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

appname = 'earning'
urlpatterns = [
    path('S011-01/',views.S01101View.as_view(),name = "S011-01"),
    path('S011-02/',views.S01102View.as_view(),name = "S011-02"),
    path('S011-03/',views.S01103View.as_view(),name = "S011-03"),
    path('S011-04/',views.S01104View.as_view(),name = "S011-04"),
]

