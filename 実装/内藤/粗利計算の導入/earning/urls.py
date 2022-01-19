"""earning.urls.py

* 売上の画面をルーティングするモジュール

Todo:

    これ見てgitのappsのurls全部変更お願いします　
    このアプリで使用するhtmlのpathを全て追加
    pathのurlpatternsを矢印の下のもので統一してください!　
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

app_name = 'earning'
urlpatterns = [
    path('S11-01/',views.S1101View.mylist,name = "S11-01"), #売上情報一覧
    path('S11-02/',views.S1102View.as_view(),name = "S11-02"), #売上情報新規登録
    path('S11-03/<int:pk>',views.S1103View.as_view(),name = "S11-03"), #売上情報詳細
    path('S11-04/<int:pk>',views.S1104View.as_view(),name = "S11-04"), #売上情報編集（返品・返金）
]

