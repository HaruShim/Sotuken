from django.views import generic

class S1101View(generic.TemplateView):
    template_name = "mas_bottleneck_list.html"

class S1102View(generic.TemplateView):
    template_name = "mas_bottleneck_register.html"

class S1103View(generic.TemplateView):
    template_name = "mas_bottleneck_edit.html"

class S1104View(generic.TemplateView):
    template_name = "mas_bottleneck_edit.html"


