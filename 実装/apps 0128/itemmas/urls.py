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
    path('S03-01/',views.S0301View.mylist,name = "S03-01"), #商品情報一覧
    path('S03-02/',views.S0302View.as_view(),name = "S03-02"), #商品情報新規登録
    path('S03-03/<pk>/',views.S0303View.itemdetail,name = "S03-03"), #商品情報詳細
    path('invalid/<pk>',views.S0303View.invalid,name = "invalid"), # 削除変更処理
    path('del_record/<pk>',views.S0303View.del_record,name = "del_record"), # 削除変更処理
    path('S03-04/<pk>/',views.S0304View.as_view(),name = "S03-04"), #商品情報編集
    path('S03-05/',views.S0305View.as_view(),name = "S03-05"), #商品情報新規登録
]