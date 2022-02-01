from django import forms
from django.forms import ModelForm

from .models import EmployeeInfo
from accounts.models import CustomUser

class S0102Form(ModelForm):
    class Meta:
        model = CustomUser
        fields = ('username','employment_status','name','ruby_name','tel_num','gender','birthday','invalid_flg','store_id',"password")
        widgets = {
                'gender':forms.RadioSelect,
                'tel_num': forms.TextInput(attrs={'placeholder': '000-0000-0000'}),
                'birthday': forms.TextInput(attrs={'placeholder': '2000-01-01',}),
            }
    # 一括でフィールドにclassなどを付けたい場合
    def __init__(self, *args, **kwargs):
        for field in self.base_fields.values():
            field.widget.attrs.update({"class":"inputsize"})
        super().__init__(*args, **kwargs)

class S0104Form(ModelForm):
    class Meta:
        model = CustomUser
        fields = ('employment_status','name','ruby_name','tel_num','gender','birthday','invalid_flg','store_id',)

        widgets = {
                'gender':forms.RadioSelect
            }

