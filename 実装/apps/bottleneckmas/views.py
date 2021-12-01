"""bottleneckmas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views.generic import TemplateView,ListView
from .models import Bottleneck

class S0601View(ListView):
    """S0601View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_bottleneck_list.html"
    context_object_name = 'bottleneck'
    model = Bottleneck
    paginate_by = 12

class S0602View(TemplateView):
    """S0602View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_bottleneck_register.html"

class S0603View(TemplateView):
    """S0603View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_bottleneck_edit.html"


