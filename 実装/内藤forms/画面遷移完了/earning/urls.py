"""earning.urls.py

* 売上の画面をルーティングするモジュール

Todo:

    これ見てgitのappsのurls全部変更お願いします　
    *このアプリで使用するhtmlのpathを全て追加
    pathのurlpatternsを矢印の下のもので統一してください!　
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

appname = 'earning'
urlpatterns = [
    path('S11-01/',views.S1101View.as_view(),name = "S11-01"),
    path('S11-02/',views.S1102View.as_view(),name = "S11-02"),
    path('S11-03/',views.S1103View.as_view(),name = "S11-03"),
    path('S11-04/',views.S1104View.as_view(),name = "S11-04"),
]

