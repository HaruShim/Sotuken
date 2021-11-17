from django.views import generic

class S0501View(generic.TemplateView):
    template_name = "mas_bottleneck_list.html"

class S0502View(generic.TemplateView):
    template_name = "mas_bottleneck_register.html"

class S0503View(generic.TemplateView):
    template_name = "mas_bottleneck_edit.html"


