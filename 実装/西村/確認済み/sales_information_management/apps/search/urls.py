"""search.urls.py

* 検索の画面をルーティングするモジュール

Todo:

    これ見てgitのappsのurls全部変更お願いします　
    このアプリで使用するhtmlのpathを全て追加　
    pathのurlpatternsを矢印の下のもので統一してください!　
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

app_name = 'search'
urlpatterns = [
    path('S08-01/',views.S0801View.as_view(),name = "S08-01"), #商品情報検索
    path('S08-02/',views.S0802View.as_view(),name = "S08-02"), #ボトルネック検索
    path('S08-03/',views.S0803View.as_view(),name = "S08-03"), #ベンチマーク検索
]