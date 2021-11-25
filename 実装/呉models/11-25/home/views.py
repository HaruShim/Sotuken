from django.views import generic

class HomeView(generic.TemplateView):
    template_name = "home.html"

class TrialtableView(generic.TemplateView):
    template_name = "trial_table.html"