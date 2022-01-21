"""earningmas.urls

* 売上マスタの画面をルーティングするモジュール

Todo:

    このアプリで使用するhtmlのpathを全て追加
    pathのurlpatternsを矢印の下のもので統一してください!

"""
from django.urls import path
from . import views

app_name = 'earningmas'
urlpatterns = [
    path('S04-01/',views.S0401View.mylist,name = "S04-01"),
    path('S04-02/',views.S0402View.as_view(),name = "S04-02"),
    path('S04-03/',views.S0403View.as_view(),name = "S04-03"),
]

