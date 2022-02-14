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
    path('loginview/',views.LoginView.as_view(),name="loginview"),
]