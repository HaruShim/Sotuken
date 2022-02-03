from django import forms
from django.forms import ModelForm
# from django.core.mail import EmailMessage

from .models import WorkStatus

class S1401Form(ModelForm):
    class Meta:
        model = WorkStatus
        fields = ("store_id",)

