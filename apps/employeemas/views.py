from django.views import generic

class EmployeeView(generic.TemplateView):
    template_name = "sample_master.html"

