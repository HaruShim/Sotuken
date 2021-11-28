from django.views.generic import TemplateView,ListView
from employeemas.models import EmployeeInfo

class S1201View(ListView):
    template_name = "employee_list.html"
    model = EmployeeInfo
    paginate_by = 12

class S1202View(TemplateView):
    template_name = "employee_detail.html"


