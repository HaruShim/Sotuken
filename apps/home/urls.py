from django.urls import path

from . import views

appname = 'home'
urlpatterns = [
    path('',views.HomeView.as_view(),name="home"),
    path('trial_table/',views.TrialtableView.as_view(),name="trial_table"),
]