"""storemas.urls.py

* 店舗マスタの画面をルーティングするモジュール

Todo:

    これ見てgitのappsのurls全部変更お願いします
    このアプリで使用するhtmlのpathを全て追加
    pathのurlpatternsを矢印の下のもので統一してください!
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

app_name = 'storemas'
urlpatterns = [
    path('S02-01/',views.S0201View.mylist,name = "S02-01"), #店舗情報一覧
    path('S02-02/',views.S0202View.as_view(),name = "S02-02"), #店舗情報新規登録
    path('S02-03/<int:pk>',views.S0203View.as_view(),name = "S02-03"), #店舗情報詳細
    path('S02-04/<int:pk>',views.S0204View.as_view(),name = "S02-04"), #編集
]