from django.views import generic

# from .forms import BaseForm

class BaseView(generic.TemplateView):
  template_name = 'base.html'