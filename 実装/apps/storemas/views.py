from django.views import generic

class S0201View(generic.TemplateView):
    template_name = "mas_bottleneck_list.html"

class S0202View(generic.TemplateView):
    template_name = "mas_bottleneck_register.html"

class S0203View(generic.TemplateView):
    template_name = "mas_bottleneck_edit.html"

class S0204View(generic.TemplateView):
    template_name = "mas_bottleneck_edit.html"


