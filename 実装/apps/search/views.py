from django.views import generic

class S0801View(generic.TemplateView):
    template_name = "benhmark_search.html"

class S0802View(generic.TemplateView):
    template_name = "bottleneck_search.html"

class S0803View(generic.TemplateView):
    template_name = "item_search.html"


