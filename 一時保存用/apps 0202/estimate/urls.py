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
    path('S10-01/',views.S1001View.mylist,name = "S10-01"), #見積
    # path('S10-01/ajax/',views.S1001View.Ajax_list,name = "S10-01_ajax"),
    path('sampleajacx/',views.SampleListAjax,name = "sample-ajax"),
    path('ajax_ch_servings/', views.Ajax_ch_servings, name='ajax_ch_servings'),
    # path('ajax_input_search/', views.Ajax_input_search, name='ajax_input_search'),
    path('S10-02/',views.S1002View.as_view(),name = "S10-02"), #客用見積
    path('ajax/',views.ajax_post_add,name="ajax_post_add"),
    path('ajax2/',views.ajax_post_search,name="ajax_post_search"),
]

