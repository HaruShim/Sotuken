"""storemas.urls.py

* 店舗マスタの画面をルーティングするモジュール

Todo:

    * これ見てgitのappsのurls全部変更お願いします　〇
    * このアプリで使用するhtmlのpathを全て追加　〇
    * pathのurlpatternsを矢印の下のもので統一してください!　〇
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

appname = 'storemas'
urlpatterns = [
    path('S02-01/',views.S0201View.as_view(),name = "S02-01"),
    path('S02-02/',views.S0202View.as_view(),name = "S02-02"),
    path('S02-03/',views.S0203View.as_view(),name = "S02-03"),
    path('S02-04/',views.S0204View.as_view(),name = "S02-04"),
]