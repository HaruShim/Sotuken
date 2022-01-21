from allauth.account.forms import (
    SignupForm,
    LoginForm,
    ResetPasswordForm,
    ResetPasswordKeyForm,
    ChangePasswordForm,
    SetPasswordForm, 
)
from django import forms
from django.forms import ModelForm
from .models import CustomUser

class MySignupForm(SignupForm):
    username = forms.CharField(
        max_length=30,
        # required=False,
        label='従業員番号'
    )
    name = forms.CharField(label='名前',max_length=30)
    def signup(self, request, user):
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.name = self.cleaned_data['name']
        user.save()
        print(self)
        print(request)
        print(user)
        print("signup実行")
        print("signup実行")
        print("signup実行")
        return user
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # django-allauthのフィールドを上書き
        self.fields['username'].widget.attrs['placeholder'] = 'ためs'
        # self.fields['employment_status'].widget.attrs['placeholder'] = 'employment_status'
        # self.fields['name'].widget.attrs['placeholder'] = 'name'
        # self.fields['ruby_name'].widget.attrs['placeholder'] = 'ruby_name'
        # self.fields['tel_num'].widget.attrs['placeholder'] = 'tel_num'
        # self.fields['gender'].widget.attrs['placeholder'] = 'gender'
        # self.fields['birthday'].widget.attrs['placeholder'] = 'birthday'
        # self.fields['username'].widget.attrs['placeholder'] = 'メールアドレス'
        # self.fields['password1'].label = 'パスワード'
        # self.fields['password1'].widget.attrs['placeholder'] = 'パスワード'

    class Meta:
        model = CustomUser
        fields = ('username','name','ruby_name' )