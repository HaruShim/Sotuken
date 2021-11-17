from django.views import generic

class S0901View(generic.TemplateView):
    template_name = "mas_bottleneck_list.html"

class S0902View(generic.TemplateView):
    template_name = "mas_bottleneck_register.html"

class S0903View(generic.TemplateView):
    template_name = "mas_bottleneck_detail.html"

class S0904View(generic.TemplateView):
    template_name = "mas_bottleneck_edit.html"


