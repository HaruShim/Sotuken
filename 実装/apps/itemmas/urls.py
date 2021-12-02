"""itemmas.urls.py

* 商品マスタの画面をルーティングするモジュール

Todo:

    これ見てgitのappsのurls全部変更お願いします　
    このアプリで使用するhtmlのpathを全て追加　
    pathのurlpatternsを矢印の下のもので統一してください!　
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

app_name = 'itemmas'
urlpatterns = [
    path('S03-01/',views.S0301View.as_view(),name = "S03-01"),
    path('S03-02/',views.S0302View.as_view(),name = "S03-02"),
    path('S03-03/',views.S0303View.as_view(),name = "S03-03"),
    path('S03-04/',views.S0304View.as_view(),name = "S03-04"),
]