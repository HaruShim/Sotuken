from django.shortcuts import render
from django.views import generic
from django.urls import reverse_lazy
from .models import IgMstProduct
from .forms import IgProductForm

class TamesiView(generic.CreateView):
    template_name = 'tamesi.html'
    model = IgMstProduct
    form_class = IgProductForm

class Tamesi2View(generic.TemplateView):
    template_name = 'sample_mas_item_list.html'

    