"""home.urls.py

* ホームの画面をルーティングするモジュール

Todo:

    これ見てgitのappsのurls全部変更お願いします　
    このアプリで使用するhtmlのpathを全て追加　
    pathのurlpatternsを矢印の下のもので統一してください!　
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

app_name = 'home'
urlpatterns = [
    path('',views.home_page,name="home"),
    path('trial_table/',views.TrialtableView.as_view(),name="trial_table"),
]