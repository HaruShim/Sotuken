"""estimate.urls

* 見積の画面をルーティングするモジュール

Todo:

    このアプリで使用するhtmlのpathを全て追加
    pathのurlpatternsを矢印の下のもので統一してください!

"""
from django.urls import path
from . import views

appname = 'estimate'
urlpatterns = [
    path('S10-01/',views.S1001View.as_view(),name = "S10-01"),
    path('S10-02/',views.S1002View.as_view(),name = "S10-02"),
]

