"""benchamas.urls.py

* ベンチマークマスタの画面をルーティングするモジュール

Todo:

    * これ見てgitのappsのurls全部変更お願いします 　
    * このアプリで使用するhtmlのpathを全て追加　〇
    * pathのurlpatternsを矢印の下のもので統一してください!　〇
    * nameはhtml組と要相談

"""
from django.urls import path
from . import views

app_name = 'benchamas'
urlpatterns = [
    path('S05-01/', views.S0501View.as_view(), name="S05-01"),  # list
    path('S05-02/', views.S0502View.as_view(), name="S05-02"),  # 登録
    path('S05-03/<int:pk>', views.S0503View.as_view(), name="S05-03"),  # 更新
    # path('S05-04/<int:pk>', views.S0504View.as_view(), name="S05-04"),  # 削除
    path('S05-05/<int:pk>', views.S0505View.as_view(), name="S05-05"),  # 詳細
]
