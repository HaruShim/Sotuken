from django.views import generic

class S1101View(generic.TemplateView):
    template_name = "earning_list.html"

class S1102View(generic.TemplateView):
    template_name = "earning_register.html"

class S1103View(generic.TemplateView):
    template_name = "earning_detail.html"

class S1104View(generic.TemplateView):
    template_name = "earning_edit.html"


