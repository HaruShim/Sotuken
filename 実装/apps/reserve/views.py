from django.views import generic

class S0901View(generic.TemplateView):
    template_name = "reserve_list.html"

class S0902View(generic.TemplateView):
    template_name = "reserve_register.html"

class S0903View(generic.TemplateView):
    template_name = "reserve_detail.html"

class S0904View(generic.TemplateView):
    template_name = "reserve_edit.html"


