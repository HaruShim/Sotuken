from django.views.generic import TemplateView,ListView
from .models import Bottleneck

class S0601View(ListView):
    template_name = "mas_bottleneck_list.html"
    context_object_name = 'bottleneck'
    model = Bottleneck
    paginate_by = 12

class S0602View(TemplateView):
    template_name = "mas_bottleneck_register.html"

class S0603View(TemplateView):
    template_name = "mas_bottleneck_edit.html"


