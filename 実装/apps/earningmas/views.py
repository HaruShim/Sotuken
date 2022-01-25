"""earningmas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from .models import EarningInfo

class S0401View(ListView):
    """S0401View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_earning_list.html"
    model = EarningInfo
    context_object_name = 'EarningInfo'
    paginate_by = 12

class S0402View(TemplateView):
    """S0402View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_earning_detail.html"

class S0403View(TemplateView):
    """Ctitle

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_earning_edit.html"


