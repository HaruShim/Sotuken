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

appname = 'bottleneckmas'
urlpatterns = [
    path('',views.BottleneckView.as_view(),name = "master_bottleneck"),
    # ↓
    path('S06-01/',views.BottleneckView.as_view(),name = "mas_bottleneck_list"),
    path('S06-02/',views.BottleneckView.as_view(),name = "S06-01"),
]

