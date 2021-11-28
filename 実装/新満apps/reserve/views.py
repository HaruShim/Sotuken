from django.views.generic import TemplateView,ListView
from .models import Reserve

class S0901View(ListView):
    template_name = "reserve_list.html"
    model = Reserve
    paginate_by = 12

class S0902View(TemplateView):
    template_name = "reserve_register.html"

class S0903View(TemplateView):
    template_name = "reserve_detail.html"

class S0904View(TemplateView):
    template_name = "reserve_edit.html"


