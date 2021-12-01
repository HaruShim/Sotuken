"""employeemas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView,ListView
from .models import EmployeeInfo

class S0101View(ListView):
    """S0101View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_employee_list.html"
    model = EmployeeInfo
    context_object_name = 'EmployeeInfo'

class S0102View(TemplateView):
    """S0102View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_employee_register.html"

class S0103View(TemplateView):
    """S0103View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_employee_detail.html"

class S0104View(TemplateView):
    """S0104View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_employee_edit.html"

class S0105View(TemplateView):
    """S0105View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_employee_completion.html"


