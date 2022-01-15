from django.views import generic

class S0701View(generic.TemplateView):
    template_name = "set_item_list.html"

class S0702View(generic.TemplateView):
    template_name = "set_item_register.html"

class S0703View(generic.TemplateView):
    template_name = "set_item_detail.html"

class S0704View(generic.TemplateView):
    template_name = "set_item_edit.html"


