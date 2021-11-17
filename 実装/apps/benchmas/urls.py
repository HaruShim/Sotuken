"""benchamas.urls

* ベンチマークマスタの画面をルーティングするモジュール

Todo:

    * これ見てgitのappsのurls全部変更お願いします
    * このアプリで使用するhtmlのpathを全て追加
    * pathのurlpatternsを矢印の下のもので統一してください!
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

appname = 'benchamas'
urlpatterns = [
    path('S05-01/',views.S0501View.as_view(),name = "S05-01"),
    path('S05-02/',views.S0502View.as_view(),name = "S05-02"),
    path('S05-03/',views.S0503View.as_view(),name = "S05-03"),
]

