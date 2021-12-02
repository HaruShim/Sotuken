from django.views import generic

class S0401View(generic.TemplateView):
    template_name = "mas_earning_list.html"

class S0402View(generic.TemplateView):
    template_name = "mas_earning_detail.html"

class S0403View(generic.TemplateView):
    template_name = "mas_earning_edit.html"


