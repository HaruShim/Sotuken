"""reserve.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views.generic import TemplateView,ListView
from .models import Reserve

class S0901View(ListView):
    """Ctitle

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "reserve_list.html"
    model = Reserve
    paginate_by = 12

class S0902View(TemplateView):
    """S0902View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "reserve_register.html"

class S0903View(TemplateView):
    """S0903View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "reserve_detail.html"

class S0904View(TemplateView):
    """S0904View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "reserve_edit.html"


