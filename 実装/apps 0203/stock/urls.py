"""stock.urls.py

* 在庫の画面をルーティングするモジュール

Todo:

    これ見てgitのappsのurls全部変更お願いします　
    このアプリで使用するhtmlのpathを全て追加　
    pathのurlpatternsを矢印の下のもので統一してください!　
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

app_name = 'stock'
urlpatterns = [ 
    path('S07-01/',views.S0701View.as_view(),name = "S07-01"), #セット商品一覧
    path('S07-02/',views.S0702View.mylist,name = "S07-02"), #セット商品一覧
    # path('S07-02/',views.S0702View.as_view(),name = "S07-02"), #セット商品新規登録
    # path('S07-02_2/',views.S0702_2View.as_view(),name = "S07-02_2"), 
    path('S07-03/<int:pk>',views.S0703View.as_view(),name = "S07-03"), #セット商品詳細
    path('S07-04/<int:pk>',views.S0704View.as_view(),name = "S07-04"), #セット商品編集
    # path('test/',views.S0702View.sample_form,name = "S07-02test"), #セット商品編集
    # path('regi/',views.make_test_formset,name = "TwoFom"), #セット商品編集
]