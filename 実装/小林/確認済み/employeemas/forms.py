from django import forms
from django.forms import ModelForm

from .models import EmployeeInfo

class S0102Form(ModelForm):
    class Meta:
        model = EmployeeInfo
        fields = ('employee_id','employment_status','name','ruby_name','tel_num','gender','birthday','invalid_flg','store_id',)

        widgets = {
                'gender':forms.RadioSelect
            }

class S0104Form(ModelForm):
    class Meta:
        model = EmployeeInfo
        fields = ('employment_status','name','ruby_name','tel_num','gender','birthday','invalid_flg','store_id',)

        widgets = {
                'gender':forms.RadioSelect
            }

