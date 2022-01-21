"""reserver.urls.py

* 取置予約の画面をルーティングするモジュール

Todo:

    これ見てgitのappsのurls全部変更お願いします　
    このアプリで使用するhtmlのpathを全て追加　
    pathのurlpatternsを矢印の下のもので統一してください!　
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

app_name = 'reserve'
urlpatterns = [
    path('S09-01/',views.S0901View.mylist,name = "S09-01"), #取置予約一覧
    path('S09-02/',views.S0902View.as_view(),name = "S09-02"), #取置予約新規登録
    path('S09-03/<int:pk>',views.S0903View.as_view(),name = "S09-03"), #取置予約詳細
    path('S09-04/<int:pk>',views.S0904View.as_view(),name = "S09-04"), #取置予約編集
]