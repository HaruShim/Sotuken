from django.views import generic

class S0301View(generic.TemplateView):
    template_name = "mas_bottleneck_list.html"

class S0302View(generic.TemplateView):
    template_name = "mas_bottleneck_register.html"

class S0303View(generic.TemplateView):
    template_name = "mas_bottleneck_edit.html"

class S0304View(generic.TemplateView):
    template_name = "mas_bottleneck_edit.html"


