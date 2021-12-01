"""itemmas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
# from django.views.generic import ListView,TemplateView
from django.views.generic import TemplateView,ListView
from .models import ItemInfo

class S0301View(ListView):
    """S0301View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_item_list.html"
    context_object_name = 'ItemList'
    model = ItemInfo

# class S0302View(TemplateView):
#     template_name = "mas_item_register.html"

# class S0303View(TemplateView):
#     template_name = "mas_item_detail.html"

# class S0304View(TemplateView):
#     template_name = "mas_item_edit.html"


