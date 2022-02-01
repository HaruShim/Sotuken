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
    # path('',views.ItemsJsonView.as_view(), name='ItemsJson'),
    path('S10-01/',views.S1001View.as_view(),name = "S10-01"), #見積
    path('S10-02/',views.S1002View.as_view(),name = "S10-02"), #客用見積
    path('ajax/',views.ajax_post_add,name="ajax_post_add"),
    path('ajax2/',views.ajax_post_search,name="ajax_post_search"),
]

