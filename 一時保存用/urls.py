"""小林君用のdisplay.urls

* htmlの画面を一つのアプリでルーティングするモジュール

Todo:

    * displayアプリのtenplatesにhtmlをコピーしたら下のコメントアウト外してね!

"""

from django.urls import path,include
from django.views.generic import TemplateView 


from . import views

appname = 'display'
urlpatterns = [
    path('',TemplateView.as_view(template_name = 'base.html'), name='base'),
    # path('S00-01/',TemplateView.as_view(template_name = 'home.html'), name='S00-01'),
    # path('S00-02/',TemplateView.as_view(template_name = 'loghome.html'), name='S00-02'),
    # path('S00-03/',TemplateView.as_view(template_name = 'ysuu.html'), name='S00-03'),
    # path('S01-01/',TemplateView.as_view(template_name = 'mas_employee_list.html'), name='S01-01'),
    # path('S01-02/',TemplateView.as_view(template_name = 'mas_employee_register.html'), name='S01-02'),
    # path('S01-03/',TemplateView.as_view(template_name = 'mas_employee_detail.html'), name='S01-03'),
    # path('S01-04/',TemplateView.as_view(template_name = 'mas_employee_edit.html'), name='S01-04'),
    # path('S01-05/',TemplateView.as_view(template_name = 'mas_employee_completion.html'), name='S01-05'),
    # path('S02-01/',TemplateView.as_view(template_name = 'mas_store_list.html'), name='S02-01'),
    # path('S02-02/',TemplateView.as_view(template_name = 'mas_store_register.html'), name='S02-02'),
    # path('S02-03/',TemplateView.as_view(template_name = 'mas_store_detail.html'), name='S02-03'),
    # path('S02-04/',TemplateView.as_view(template_name = 'mas_store_edit.html'), name='S02-04'),
    # path('S03-01/',TemplateView.as_view(template_name = 'mas_goods_list.html'), name='S03-01'),
    # path('S03-02/',TemplateView.as_view(template_name = 'mas_goods_register.html'), name='S03-02'),
    # path('S03-03/',TemplateView.as_view(template_name = 'mas_goods_detail.html'), name='S03-03'),
    # path('S03-04/',TemplateView.as_view(template_name = 'mas_goods_edit.html'), name='S03-04'),
    # path('S04-01/',TemplateView.as_view(template_name = 'mas_profit_list.html'), name='S04-01'),
    # path('S04-02/',TemplateView.as_view(template_name = 'mas_profit_detail.html'), name='S04-02'),
    # path('S04-03/',TemplateView.as_view(template_name = 'mas_profit_edit.html'), name='S04-03'),
    # path('S05-01/',TemplateView.as_view(template_name = 'mas_benchmark_list.html'), name='S05-01'),
    # path('S05-02/',TemplateView.as_view(template_name = 'mas_benchmark_register.html'), name='S05-02'),
    # path('S05-03/',TemplateView.as_view(template_name = 'mas_benchmark_edit.html'), name='S05-03'),
    # path('S06-01/',TemplateView.as_view(template_name = 'mas_bottleneck_list.html'), name='S06-01'),
    # path('S06-02/',TemplateView.as_view(template_name = 'mas_bottleneck_register.html'), name='S06-02'),
    # path('S06-03/',TemplateView.as_view(template_name = 'mas_bottleneck_edit.html'), name='S06-03'),
    path('S07-01/',TemplateView.as_view(template_name = 'set_item_list.html'), name='S07-01'),
    path('S07-02/',TemplateView.as_view(template_name = 'set_item_register.html'), name='S07-02'),
    path('S07-03/',TemplateView.as_view(template_name = 'set_item_detail.html'), name='S07-03'),
    path('S07-04/',TemplateView.as_view(template_name = 'set_item_edit.html'), name='S07-04'),
    path('S08-01/',TemplateView.as_view(template_name = 'item_search.html'), name='S08-01'),
    path('S08-02/',TemplateView.as_view(template_name = 'bottleneck_search.html'), name='S08-02'),
    path('S08-03/',TemplateView.as_view(template_name = 'benchmark_search.html'), name='S08-03'),
    path('S09-01/',TemplateView.as_view(template_name = 'reserve_list.html'), name='S09-01'),
    path('S09-02/',TemplateView.as_view(template_name = 'reserve_redister.html'), name='S09-02'),
    path('S09-03/',TemplateView.as_view(template_name = 'reserve_detail.html'), name='S09-03'),
    path('S09-04/',TemplateView.as_view(template_name = 'reserve_edit.html'), name='S09-04'),
    path('S10-01/',TemplateView.as_view(template_name = 'estimate.html'), name='S10-01'),
    path('S10-02/',TemplateView.as_view(template_name = 'customer_estimate.html'), name='S10-02'),
    path('S11-01/',TemplateView.as_view(template_name = 'profit_list.html'), name='S11-01'),
    path('S11-02/',TemplateView.as_view(template_name = 'profit_register.html'), name='S11-02'),
    path('S11-03/',TemplateView.as_view(template_name = 'profit_detail.html'), name='S11-03'),
    path('S11-04/',TemplateView.as_view(template_name = 'profit_edit.html'), name='S11-04'),
    path('S12-01/',TemplateView.as_view(template_name = 'employee_list.html'), name='S12-01'),
    path('S12-02/',TemplateView.as_view(template_name = 'employee_detail.html'), name='S12-02'),
    path('S13-01/',TemplateView.as_view(template_name = 'store_list.html'), name='S13-01'),
    path('S13-02/',TemplateView.as_view(template_name = 'store_detail.html'), name='S13-02'),
    path('S14-01/',TemplateView.as_view(template_name = 'work_status.html'), name='S14-01'),

    # path('S0+-0/',TemplateView.as_view(template_name = '.html'), name='S0+-0'),

]