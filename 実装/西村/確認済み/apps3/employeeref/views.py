"""employeeref.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,DeleteView,UpdateView
from employeemas.models import EmployeeInfo
# from .forms import S0102Form
from django.urls import reverse_lazy

class S1201View(ListView):
    """S1201View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "employee_list.html"
    model = EmployeeInfo
    paginate_by = 12

class S1202View(DetailView):
    """S1202View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = EmployeeInfo
    template_name = "employee_detail.html"
    success_url = reverse_lazy('employeemas:S01-01')


