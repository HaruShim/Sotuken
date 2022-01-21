from allauth.account.forms import SignupForm,LoginForm
from django import forms
from .models import CustomUser
from storemas.models import StoreInfo
from allauth.account.adapter import DefaultAccountAdapter

class MySignupForm(SignupForm):
    genderchoice = (
        (0,'男性'),
        (1,'女性'),
    )
    estachoice = (
        (0,'管理者'),
        (1,'店長'),
        (2,'正規社員'),
        (3,'非正規社員')
    )
    username = forms.CharField(
        max_length=30,
        # required=False,
        label='従業員番号'
    )
    name = forms.CharField(label='名前',max_length=30)
    ruby_name = forms.CharField(label='氏名(カナ)')
    tel_num = forms.CharField(label='電話番号')
    gender = forms.fields.ChoiceField(choices = genderchoice,label='性別',widget=forms.widgets.RadioSelect)
    birthday = forms.DateField(label='生年月日',)
    store_id = forms.ModelChoiceField(queryset=StoreInfo.objects.filter(place_category = 1))
    employment_status = forms.ChoiceField(choices=estachoice)

    class Meta:
        model = CustomUser
        fields = ('username','name','ruby_name','tel_num','gender','birthday','store_id','password1','employment_status',)

    def signup(self, request,user):
        user.name = self.cleaned_data['name']
        user.ruby_name = self.cleaned_data['ruby_name']
        user.tel_num = self.cleaned_data['tel_num']
        user.gender = self.cleaned_data['gender']
        user.birthday = self.cleaned_data['birthday']
        user.store_id = self.cleaned_data['store_id']
        user.employment_status = self.cleaned_data['employment_status']
        user.save()
        return user
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['password1'].widget.attrs['placeholder'] = '任意の文字'

class MyLoginForm(LoginForm):
    username = forms.CharField(
        max_length=30,
        # required=False,
        label='従業員番号'
    )
    class Meta:
        model = CustomUser
        fields = ('username','password')
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        #classにbootstrapのform-controlを指定したい場合
        self.fields['username'].widget.attrs['class'] = 'form-control'
        self.fields['password'].widget.attrs['class'] = 'form-control'
        # #placeholderを設定したい場合
        self.fields['username'].widget.attrs['placeholder'] = 'name@example.com'
        self.fields['password'].widget.attrs['placeholder'] = 'Password'
        # #labelを設定したい場合
        self.fields['username'].widget.attrs['id'] = "inputEmail"
        self.fields['password'].widget.attrs['id'] = 'inputPassword'
