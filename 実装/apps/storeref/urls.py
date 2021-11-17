"""storeref.urls.py

* 店舗情報の画面をルーティングするモジュール

Todo:

    * これ見てgitのappsのurls全部変更お願いします　〇
    * このアプリで使用するhtmlのpathを全て追加　〇
    * pathのurlpatternsを矢印の下のもので統一してください!　〇
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

appname = 'storeref'
urlpatterns = [
    path('S13-01/',views.S1301View.as_view(),name = "S13-01"),
    path('S13-02/',views.S1302View.as_view(),name = "S13-02"),
]