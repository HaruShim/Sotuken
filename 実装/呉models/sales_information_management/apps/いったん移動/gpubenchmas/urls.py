from django.urls import path


from . import views

app_name = "gpubenchmas"

urlpatterns = [
    path('', views.GpuBenchlistView.as_view(), name="GpuBench"),

]
