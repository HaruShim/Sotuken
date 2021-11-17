"""home.urls.py

* ホームの画面をルーティングするモジュール

Todo:

    * これ見てgitのappsのurls全部変更お願いします　〇
    * このアプリで使用するhtmlのpathを全て追加　〇
    * pathのurlpatternsを矢印の下のもので統一してください!　〇
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

appname = 'home'
urlpatterns = [
    path('',views.HomeView.as_view(),name="home"),
    path('trial_table/',views.TrialtableView.as_view(),name="trial_table"),
]