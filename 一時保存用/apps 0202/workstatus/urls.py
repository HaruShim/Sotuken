from django.urls import path
from . import views

app_name = 'workstatus'
urlpatterns = [
    path('S14-01/',views.S1401View.as_view(),name = "S14-01"), #勤務状況一覧
]