from django.urls import path
from .import views
import example
from django.urls import path

app_name = "example"
urlpatterns = [
    path('', views.IndexView.as_view(),name = "example"),
]
