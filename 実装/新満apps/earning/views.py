from django.views.generic import TemplateView,ListView
from earningmas.models import EarningInfo

class S1101View(ListView):
    template_name = "earning_list.html"
    model = EarningInfo
    paginate_by = 12

class S1102View(TemplateView):
    template_name = "earning_register.html"

class S1103View(TemplateView):
    template_name = "earning_detail.html"

class S1104View(TemplateView):
    template_name = "earning_edit.html"


