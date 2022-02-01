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

app_name = 'employeeref'
urlpatterns = [
    path('S12-01/',views.S1201View.as_view(),name = "S12-01"), #従業員情報一覧
    path('S12-02/<int:pk>',views.S1202View.as_view(),name = "S12-02"), #従業員情報詳細
]