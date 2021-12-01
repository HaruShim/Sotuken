"""benchmas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views.generic import TemplateView,ListView
from .models import CpuBench

class S0501View(ListView):
    """S0501View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_benchmark_list.html"
    model = CpuBench
    paginate_by = 12

class S0502View(TemplateView):
    """S0501View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_bottleneck_register.html"

class S0503View(TemplateView):
    """S0501View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_bottleneck_edit.html"


