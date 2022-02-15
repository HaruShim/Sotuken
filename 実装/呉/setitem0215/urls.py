"""setitem.urls.py

* 在庫の画面をルーティングするモジュール

Todo:

    これ見てgitのappsのurls全部変更お願いします
    このアプリで使用するhtmlのpathを全て追加
    pathのurlpatternsを矢印の下のもので統一してください!
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

app_name = 'setitem'
urlpatterns = [ 
    path('S08-01/',views.S0801View.mylist,name = "S08-01"), #セット商品一覧
    path('setregiedi/',views.S0801View.setregiedi,name = "setregiedi"), #セット商品登録
    path('S08-02/<int:pk>',views.S0802View.as_view(),name = "S08-02"), #セット商品詳細・編集
    path('del_record/<pk>',views.S0802View.del_record,name = "del_record"), # 削除
]