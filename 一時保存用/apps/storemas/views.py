"""storemas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView,ListView
from .models import StoreInfo
from employeemas.models import EmployeeInfo

class S0201View(ListView):
    """S0201View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_store_list.html"
    model = StoreInfo
    context_object_name = 'StoreInfo'

    # def get_queryset(self):
    #     store_manager = EmployeeInfo.objects.filter(name = '竹井 一馬')
    #     return store_manager

class S0202View(TemplateView):
    """S0202View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_store_register.html"

class S0203View(TemplateView):
    """S0203View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_store_detail.html"

class S0204View(TemplateView):
    """S0204View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_store_edit.html"


