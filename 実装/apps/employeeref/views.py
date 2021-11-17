from django.views import generic

class S1201View(generic.TemplateView):
    template_name = "mas_bottleneck_list.html"

class S1202View(generic.TemplateView):
    template_name = "mas_bottleneck_register.html"


