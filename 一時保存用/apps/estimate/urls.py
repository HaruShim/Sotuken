"""estimate.urls

* 見積の画面をルーティングするモジュール

Todo:

    このアプリで使用するhtmlのpathを全て追加
    pathのurlpatternsを矢印の下のもので統一してください!

"""
from django.urls import path
from . import views

app_name = 'estimate'
urlpatterns = [
    path('S10-01/',views.S1001View.as_view(),name = "S10-01"), #見積
    path('S10-02/',views.S1002View.as_view(),name = "S10-02"), #客用見積
]

