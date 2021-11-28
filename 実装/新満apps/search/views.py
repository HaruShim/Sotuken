from django.views.generic import TemplateView,ListView
from benchmas.models import CpuBench,GpuBench
from bottleneckmas.models import Bottleneck
from itemmas.models import ItemInfo

class S0801View(ListView):
    template_name = "item_search.html"
    model = ItemInfo
    paginate_by = 12

class S0802View(ListView):
    template_name = "bottleneck_search.html"
    model = Bottleneck
    paginate_by = 12

class S0803View(ListView):
    template_name = "benchmark_search.html"
    model = CpuBench
    paginate_by = 12


