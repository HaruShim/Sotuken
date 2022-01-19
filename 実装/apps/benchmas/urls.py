"""benchamas.urls.py

* ベンチマークマスタの画面をルーティングするモジュール

Todo:

    * これ見てgitのappsのurls全部変更お願いします
    * このアプリで使用するhtmlのpathを全て追加〇
    * pathのurlpatternsを矢印の下のもので統一してください!〇
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

app_name = 'benchmas'
urlpatterns = [
    path('S05-01CPU/',views.S0501CPUView.as_view(),name = "S05-01CPU"),
    path('S05-01GPU/',views.S0501GPUView.as_view(),name = "S05-01GPU"),
    path('S05-02CPU/',views.S0502CPUView.as_view(),name = "S05-02CPU"),
    path('S05-02GPU/',views.S0502GPUView.as_view(),name = "S05-02GPU"),
    path('S05-03CPU/<int:pk>',views.S0503CPUView.as_view(),name = "S05-03CPU"),
    path('S05-03GPU/<int:pk>',views.S0503GPUView.as_view(),name = "S05-03GPU"),
]

