from django.views import generic

class S0401View(generic.TemplateView):
    template_name = "mas_bottleneck_list.html"

class S0402View(generic.TemplateView):
    template_name = "mas_bottleneck_register.html"

class S0403View(generic.TemplateView):
    template_name = "mas_bottleneck_edit.html"


