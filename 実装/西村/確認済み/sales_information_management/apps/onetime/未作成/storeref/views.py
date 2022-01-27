from django.views import generic

class S1301View(generic.TemplateView):
    template_name = "mas_bottleneck_list.html"

class S1302View(generic.TemplateView):
    template_name = "mas_bottleneck_register.html"


