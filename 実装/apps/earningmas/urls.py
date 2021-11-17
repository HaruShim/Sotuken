"""earningmas.urls

* ボトルネックマスタの画面をルーティングするモジュール

Todo:

    * このアプリで使用するhtmlのpathを全て追加
    * pathのurlpatternsを矢印の下のもので統一してください!

"""
from django.urls import path
from . import views

appname = 'earningmas'
urlpatterns = [
    path('S06-01/',views.S0601View.as_view(),name = "S06-01"),
    path('S06-02/',views.S0602View.as_view(),name = "S06-02"),
    path('S06-03/',views.S0603View.as_view(),name = "S06-03"),
    path('S06-04/',views.S0604View.as_view(),name = "S06-04"),
]

