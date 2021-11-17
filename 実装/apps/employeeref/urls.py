"""bottleneckmas.urls

* ボトルネックマスタの画面をルーティングするモジュール

Todo:

    * これ見てgitのappsのurls全部変更お願いします
    * このアプリで使用するhtmlのpathを全て追加
    * pathのurlpatternsを矢印の下のもので統一してください!
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

appname = ''
urlpatterns = [
    path('S012-01/',views.S01201View.as_view(),name = "S012-01"),
    path('S012-02/',views.S01202View.as_view(),name = "S012-02"),
]