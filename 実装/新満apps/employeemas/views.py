from django.db import models
from django.views.generic import TemplateView,ListView
from .models import EmployeeInfo

class S0101View(ListView):
    template_name = "mas_employee_list.html"
    model = EmployeeInfo
    context_object_name = 'EmployeeInfo'

class S0102View(TemplateView):
    template_name = "mas_employee_register.html"

class S0103View(TemplateView):
    template_name = "mas_employee_detail.html"

class S0104View(TemplateView):
    template_name = "mas_employee_edit.html"

class S0105View(TemplateView):
    template_name = "mas_employee_completion.html"


