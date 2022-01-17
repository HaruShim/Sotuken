"""storeref.urls.py

* 店舗情報の画面をルーティングするモジュール

Todo:

    これ見てgitのappsのurls全部変更お願いします　
    このアプリで使用するhtmlのpathを全て追加　
    pathのurlpatternsを矢印の下のもので統一してください!　
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

app_name = 'storeref'
urlpatterns = [
    path('S13-01/',views.S1301View.mylist,name = "S13-01"), #店舗情報一覧
    path('S13-02/<int:pk>',views.S1302View.as_view(),name = "S13-02"), #店舗情報詳細
]