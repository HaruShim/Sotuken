from django.urls import path
from . import views

appname = 'storeref'
urlpatterns = [
    path('S18-01/',views.S1801View.as_view(),name = "S18-01"),
]