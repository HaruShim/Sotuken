from django.urls import path
from . import views

appname = 'storeref'
urlpatterns = [
    path('S14-01/',views.S1401View.as_view(),name = "S14-01"),
]