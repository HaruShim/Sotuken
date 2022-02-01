from django.urls import path
from . import views

app_name = 'aaaaa'
urlpatterns = [
    path('',views.AaaaaView.as_view(),name = "aaaaa"),
]

