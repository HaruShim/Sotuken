from django.db import models
from django.views import generic
from .models import EmployeeInfo

class S0101View(generic.TemplateView):
    models = EmployeeInfo
    template_name = "mas_employee_list.html"

class S0102View(generic.TemplateView):
    template_name = "mas_employee_register.html"

class S0103View(generic.TemplateView):
    template_name = "mas_employee_detail.html"

class S0104View(generic.TemplateView):
    template_name = "mas_employee_edit.html"

class S0105View(generic.TemplateView):
    template_name = "mas_employee_completion.html"


