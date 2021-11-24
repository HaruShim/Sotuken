from django.views import generic
from .models import Aaaaa

class AaaaaView(generic.TemplateView):
    model = Aaaaa
    template_name = "sample.html"

