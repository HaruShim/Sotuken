from django.urls import path,include
from django.views.generic import TemplateView 

from . import views


app_name = 'tamesi1'
urlpatterns = [
  path('',TemplateView.as_view(template_name = 'index.html'), name='index'),
  path('base/',views.BaseView.as_view(),name='base'),
]
