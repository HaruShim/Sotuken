from django import forms
from django.core.mail import EmailMessage

from .models import Householdaccountbook

# class HouseholdaccountbookForm(forms.ModelForm):
#   class Meta:
#     model = Householdaccountbook
#     fields = ["pref","choice",]
class TableCreateForm(forms.ModelForm):
  class Meta:
    model = Householdaccountbook
    fields = ('title', 'choice', 'date', 'genre', 'quanity', 'money', 'content' )

  def __init__(self, *args, **kwargs):
    super().__init__(*args, **kwargs)
    for field in self.fields.values():
      field.widget.attrs['class'] = 'form-control'
    # self.fields['date'].widget.attrs['class'] = 'form-control'
    # self.fields['date'].widget.attrs['id'] = "inputdate"
    self.fields['date'].widget.attrs['placeholder'] = "例 2000-12-05"