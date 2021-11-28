from django.db import models
from django.views.generic import TemplateView,ListView
from .models import EarningInfo

class S0401View(ListView):
    template_name = "mas_earning_list.html"
    model = EarningInfo
    context_object_name = 'EarningInfo'
    paginate_by = 12

class S0402View(TemplateView):
    template_name = "mas_earning_detail.html"

class S0403View(TemplateView):
    template_name = "mas_earning_edit.html"


