from django.urls import path
from django.views.generic import TemplateView
from . import views


app_name = 'table'
urlpatterns = [
    path('', views.HouseholdaccountListView.as_view(), name="table"),
    path('table_detail/<int:pk>',views.TableDetailView.as_view(),name = "table_detail"),
    path('table_create/',views.TableCreateView.as_view(),name="table_create"),
    path('table_update/<int:pk>/',views.TableUpdateView.as_view(),name="table_update"),
    path('table_delete/<int:pk>/',views.TableDeleteView.as_view(),name="table_delete"),
    # path('',TemplateView.as_view(template_name = 'tables.html'), name='table'),
]
