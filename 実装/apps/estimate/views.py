from django.views import generic

class S1001View(generic.TemplateView):
    template_name = "customer_estimate.html"

class S1002View(generic.TemplateView):
    template_name = "estimate_.html"


