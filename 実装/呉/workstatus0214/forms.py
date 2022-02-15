from django import forms
from django.forms import ModelForm,Form
# from django.core.mail import EmailMessage

from .models import WorkStatus
from storemas.models import StoreInfo


class S1401Form(Form):
    s_selecter = forms.ModelChoiceField(queryset=StoreInfo.objects.filter(place_category = 1,invalid_flg=True),required=False,empty_label='店舗を選択')


class Ws_selecter(Form):
    ws_selecter = forms.ModelChoiceField(queryset=StoreInfo.objects.filter(place_category = 1,invalid_flg=True),required=False,empty_label=None)


