from django.urls import path
from . import views

appname = 'employee'
urlpatterns = [
    path('',views.EmployeeView.as_view(),name = "master_employee"),
]