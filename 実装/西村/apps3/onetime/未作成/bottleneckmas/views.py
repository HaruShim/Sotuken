from django.views import generic

class S0601View(generic.TemplateView):
    template_name = "mas_bottleneck_list.html"

class S0602View(generic.TemplateView):
    template_name = "mas_bottleneck_register.html"

class S0603View(generic.TemplateView):
    template_name = "mas_bottleneck_edit.html"


