from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required

"""stock.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views import generic

class S0701View(LoginRequiredMixin, generic.TemplateView):
    """S0701View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "set_item_list.html"

class S0702View(LoginRequiredMixin, generic.TemplateView):
    """S0702View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "set_item_register.html"

class S0703View(LoginRequiredMixin, generic.TemplateView):
    """S0703View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "set_item_detail.html"

class S0704View(LoginRequiredMixin, generic.TemplateView):
    """S0704View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "set_item_edit.html"