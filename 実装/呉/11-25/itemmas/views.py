from django.db import models
from django.views import generic
from . models import ItemInfo

class S0301View(generic.ListView):
    models = ItemInfo
    template_name = "mas_item_list.html"

class S0302View(generic.TemplateView):
    template_name = "mas_item_register.html"

class S0303View(generic.TemplateView):
    template_name = "mas_item_detail.html"

class S0304View(generic.TemplateView):
    template_name = "mas_item_edit.html"


