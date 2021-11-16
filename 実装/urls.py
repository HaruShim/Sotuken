from django.urls import path,include
from django.views.generic import TemplateView 


from . import views

appname = 'display'
urlpatterns = [
    path('',TemplateView.as_view(template_name = 'base.html'), name='base'),
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