from django.views import generic

class S0801View(generic.TemplateView):
    template_name = "mas_bottleneck_list.html"

class S0802View(generic.TemplateView):
    template_name = "mas_bottleneck_register.html"

class S0803View(generic.TemplateView):
    template_name = "mas_bottleneck_edit.html"


