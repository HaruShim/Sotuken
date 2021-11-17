"""employeeref.urls

* 従業員情報の画面をルーティングするモジュール

Todo:

    これ見てgitのappsのurls全部変更お願いします
    このアプリで使用するhtmlのpathを全て追加
    pathのurlpatternsを矢印の下のもので統一してください!
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

appname = 'employeeref'
urlpatterns = [
    path('S12-01/',views.S1201View.as_view(),name = "S12-01"),
    path('S12-02/',views.S1202View.as_view(),name = "S12-02"),
]