from django.views import generic

class S0401View(generic.TemplateView):
    template_name = "earningmas_list.html"

class S0402View(generic.TemplateView):
    template_name = "earningmas_detail.html"

class S0403View(generic.TemplateView):
    template_name = "earningmas_edit.html"


