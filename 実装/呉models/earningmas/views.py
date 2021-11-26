from django.db import models
from django.views import generic
from . models import EarningInfo

class S0401View(generic.TemplateView):
    models = EarningInfo
    template_name = "mas_earning_list.html"

class S0402View(generic.TemplateView):
    template_name = "mas_earning_detail.html"

class S0403View(generic.TemplateView):
    template_name = "mas_earning_edit.html"


