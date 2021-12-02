from django.views import generic
from .models import StoreInfo


class S0201View(generic.ListView):
    model = StoreInfo
    template_name = "mas_store_list.html"


class S0202View(generic.TemplateView):
    template_name = "mas_store_register.html"


class S0203View(generic.TemplateView):
    template_name = "mas_store_detail.html"


class S0204View(generic.TemplateView):
    template_name = "mas_store_edit.html"
