
from django.contrib import admin
from django.urls import path,include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',include('home.urls')),
    # 従業員マスタ
    path('F01/',include('employeemas.urls')),
    # 店舗マスタ
    path('F02/',include('storemas.urls')),
    # 商品マスタ
    path('F03/',include('itemmas.urls')),
    # 売上マスタ
    path('F04/',include('earningmas.urls')),
    # ベンチマークマスタ
    path('F05/',include('benchmas.urls')),
    # ボトルネックマスタ
    path('F06/',include('bottleneckmas.urls')),
    # 在庫
    path('F07/',include('stock.urls')),
    # 検索
    path('F08/',include('search.urls')),
    # 取置予約
    path('F09/',include('reserve.urls')),
    # 見積
    path('F10/',include('estimate.urls')),
    # 売上
    path('F11/',include('earning.urls')),
    # 従業員参照
    path('F12/',include('employeeref.urls')),
    # 店舗参照
    path('F13/',include('storeref.urls')),
    # 勤務状況編集
    path('F14/',include('workstatus.urls')),

]
