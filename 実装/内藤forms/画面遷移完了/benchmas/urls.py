"""benchamas.urls.py

* ベンチマークマスタの画面をルーティングするモジュール

Todo:

    これ見てgitのappsのurls全部変更お願いします 　
    * このアプリで使用するhtmlのpathを全て追加
    pathのurlpatternsを矢印の下のもので統一してください
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

appname = 'benchamas'

urlpatterns = [
    path('S05-01/',views.S0501View.as_view(),name = "S05-01"),
    path('S05-02/cpu/',views.S0502CpuView.as_view(),name = "S05-02_cpu"),
    path('S05-02/gpu/',views.S0502GpuView.as_view(),name = "S05-02_gpu"),
    path('S05-03/cpu/',views.S0503CpuView.as_view(),name = "S05-03_cpu"),
    path('S05-03/gpu/',views.S0503GpuView.as_view(),name = "S05-03_gpu"),

]

