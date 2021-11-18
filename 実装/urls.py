"""sales_information_management.urls

* システムとアプリをルーティングするモジュール

Todo:

    ※追加(各自で試すアプリ)はそれぞれで追加してください
    ※各自で追加したものはローカルでのみ使用

"""

from django.contrib import admin
from django.urls import path,include

urlpatterns = [
    path('admin/', admin.site.urls),# 管理者サイト

    path('',include('home.urls')),#ホーム画面
    
    path('F01/',include('employeemas.urls')),# 従業員マスタ
    path('F02/',include('storemas.urls')),# 店舗マスタ
    path('F03/',include('itemmas.urls')),# 商品マスタ
    path('F04/',include('earningmas.urls')),# 売上マスタ
    path('F05/',include('benchmas.urls')),# ベンチマークマスタ
    path('F06/',include('bottleneckmas.urls')),# ボトルネックマスタ
    path('F07/',include('stock.urls')),# 在庫
    path('F08/',include('search.urls')),# 検索
    path('F09/',include('reserve.urls')),# 取置予約
    path('F10/',include('estimate.urls')),# 見積
    path('F11/',include('earning.urls')),# 売上
    path('F12/',include('employeeref.urls')),# 従業員参照
    path('F13/',include('storeref.urls')),# 店舗参照
    path('F14/',include('workstatus.urls')),# 勤務状況編集

]
