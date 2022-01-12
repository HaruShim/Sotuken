"""itemmas.urls.py

* 商品マスタの画面をルーティングするモジュール

Todo:

"""
from django.urls import path
from . import views

app_name = 'print'
urlpatterns = [
    path('', views.top_page, name='top_page'), 
    path('abc/', views.abc_page, name='abc_page'),
]