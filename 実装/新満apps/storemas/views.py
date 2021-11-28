from django.db import models
from django.views.generic import TemplateView,ListView
from .models import StoreInfo
from employeemas.models import EmployeeInfo

class S0201View(ListView):
    template_name = "mas_store_list.html"
    model = StoreInfo
    context_object_name = 'StoreInfo'

    # def get_queryset(self):
    #     store_manager = EmployeeInfo.objects.filter(name = '竹井 一馬')
    #     return store_manager

class S0202View(TemplateView):
    template_name = "mas_store_register.html"

class S0203View(TemplateView):
    template_name = "mas_store_detail.html"

class S0204View(TemplateView):
    template_name = "mas_store_edit.html"


