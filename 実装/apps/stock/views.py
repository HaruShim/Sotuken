from django.views import generic

class S0701View(generic.TemplateView):
    template_name = "mas_bottleneck_list.html"

class S0702View(generic.TemplateView):
    template_name = "mas_bottleneck_register.html"

class S0703View(generic.TemplateView):
    template_name = "mas_bottleneck_detail.html"

class S0704View(generic.TemplateView):
    template_name = "mas_bottleneck_edit.html"


