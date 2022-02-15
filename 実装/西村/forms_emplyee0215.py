from django import forms
from django.forms import ModelForm

from accounts.models import CustomUser
from storemas.models import StoreInfo
from django.contrib.auth.forms import UserCreationForm


class S0102Form(UserCreationForm):
    s_selecter = forms.ModelChoiceField(queryset=StoreInfo.objects.filter(place_category = 1,invalid_flg=True),required=False,empty_label='店舗を選択')
    password1 = forms.CharField(label='パスワード', widget=forms.PasswordInput(), max_length=4)
    username = forms.CharField(
        required=True,
        disabled=False,
        max_length=8,
        min_length=8,
        widget=forms.TextInput(attrs={
            'placeholder':'12545678',
            'pattern':'^[0-9]+$'
        })
    )
    name = forms.CharField(
        required=True,
        disabled=False,
        widget=forms.TextInput(attrs={
            'placeholder':'大原 太郎',
        })
    )
    ruby_name = forms.CharField(
        required=True,
        disabled=False,
        widget=forms.TextInput(attrs={
            'placeholder':'オオハラ タロウ',
            'pattern': '^[ｦ-ﾟァ-ヴ]+$'
        })
    )
    tel_num = forms.CharField(
        # label=labels[3],
        required=True,
        disabled=False,
        max_length=14,
        # min_length=14,
        widget=forms.TextInput(attrs={
            'placeholder': '000-0000-0000',
            'pattern':'\d{2,4}-\d{2,4}-\d{3,4}'
        })
    )
    birthday = forms.CharField(
        required=True,
        disabled=False,
        widget=forms.TextInput(attrs={
            'placeholder':'2000-01-01',
            'pattern':'^\d{4}-\d\d-\d\d'
        })
    )

    class Meta:
        model = CustomUser
        fields = ('username','employment_status','name','ruby_name','tel_num','gender','birthday','invalid_flg','store_id',"password1")
        widgets = {
                'username':forms.TextInput(attrs={'placeholder': '12345678'}),
                'name':forms.TextInput(attrs={'placeholder': '大原 太郎'}),
                'ruby_name':forms.TextInput(attrs={'placeholder': 'オオハラ タロウ'}),
                'gender':forms.RadioSelect,
                'tel_num': forms.TextInput(attrs={'placeholder': '000-0000-0000'}),
                'birthday': forms.TextInput(attrs={'placeholder': '2000-01-01',}),
                'password1': forms.TextInput(attrs={'placeholder': '0248',}),
            }
    # 一括でフィールドにclassなどを付けたい場合
    def __init__(self, *args, **kwargs):
        for field in self.base_fields.values():
            field.widget.attrs.update({"class":"inputsize"})
        super().__init__(*args, **kwargs)

class S0104Form(ModelForm):
    store_id = forms.ModelChoiceField(queryset=StoreInfo.objects.filter(place_category = 1,invalid_flg=True),required=False,empty_label='店舗を選択')
    
    class Meta:
        model = CustomUser
        fields = ('name','ruby_name','tel_num','gender','birthday','store_id',)
        widgets = {
                'username':forms.TextInput(attrs={'placeholder': '12345678'}),
                'name':forms.TextInput(attrs={'placeholder': '大原 太郎'}),
                'ruby_name':forms.TextInput(attrs={'placeholder': 'オオハラ タロウ'}),
                'gender':forms.RadioSelect,
                'tel_num': forms.TextInput(attrs={'placeholder': '000-0000-0000'}),
                'birthday': forms.TextInput(attrs={'placeholder': '2000-01-01',}),
                'password1': forms.TextInput(attrs={'placeholder': '0248',}),
            }
    # 一括でフィールドにclassなどを付けたい場合
    def __init__(self, *args, **kwargs):
        for field in self.base_fields.values():
            field.widget.attrs.update({"class":"inputsize"})
        super().__init__(*args, **kwargs)

