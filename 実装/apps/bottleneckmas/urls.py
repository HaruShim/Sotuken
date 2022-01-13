"""bottleneckmas.urls

* ボトルネックマスタの画面をルーティングするモジュール

Todo:

    これ見てgitのappsのurls全部変更お願いします
    このアプリで使用するhtmlのpathを全て追加
    pathのurlpatternsを矢印の下のもので統一してください!
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

app_name = 'bottleneckmas'
urlpatterns = [
    path('S06-01/',views.S0601View.mylist,name = "S06-01"), #ボトルネック一覧
    path('S06-02/',views.S0602View.as_view(),name = "S06-02"), #ボトルネック新規登録
    path('S06-03/<int:pk>',views.S0603View.as_view(),name = "S06-03"), #ボトルネック編集
]

