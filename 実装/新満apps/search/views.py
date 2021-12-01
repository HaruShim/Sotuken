"""search.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views.generic import TemplateView,ListView
from benchmas.models import CpuBench,GpuBench
from bottleneckmas.models import Bottleneck
from itemmas.models import ItemInfo

class S0801View(ListView):
    """S0801View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "item_search.html"
    model = ItemInfo
    paginate_by = 12

class S0802View(ListView):
    """S0802View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "bottleneck_search.html"
    model = Bottleneck
    paginate_by = 12

class S0803View(ListView):
    """S0803View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "benchmark_search.html"
    model = CpuBench
    paginate_by = 12


