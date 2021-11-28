from django.views.generic import TemplateView,ListView
from .models import CpuBench

class S0501View(ListView):
    template_name = "mas_benchmark_list.html"
    model = CpuBench
    paginate_by = 12

class S0502View(TemplateView):
    template_name = "mas_bottleneck_register.html"

class S0503View(TemplateView):
    template_name = "mas_bottleneck_edit.html"


