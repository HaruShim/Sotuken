"""employeeref.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views.generic import TemplateView,ListView
from employeemas.models import EmployeeInfo

class S1201View(ListView):
    """S1201View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "employee_list.html"
    model = EmployeeInfo
    paginate_by = 12

class S1202View(TemplateView):
    """S1202View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "employee_detail.html"


