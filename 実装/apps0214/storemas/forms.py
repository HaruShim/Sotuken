from django import forms
from django.forms import ModelForm,Form
from .models import StoreInfo

class S0202Form(ModelForm):
    tel = forms.CharField(
        # label=labels[3],
        required=True,
        disabled=False,
        max_length=14,
        # min_length=14,
        widget=forms.TextInput(attrs={
            'placeholder': '000-0000-0000',
            'pattern':'\d{2,4}-\d{2,4}-\d{3,4}'}
        ))
    class Meta:
        model = StoreInfo
        fields = ( 'place_category', 'store_name', 'address', 'tel',)

        widgets = {
                'store_name': forms.TextInput(attrs={'placeholder': "東京大原店"}),
                'tel': forms.TextInput(attrs={'placeholder': "000-0000-0000"}),
                'address': forms.Textarea(attrs={'placeholder': "東京都千代田区西神田\n1-2-10"}),
            }

class S1401Form(ModelForm):
    # 
    store_selecter = forms.ModelChoiceField(queryset=StoreInfo.objects.filter(place_category = 1,invalid_flg=True),required=False,empty_label='店舗を選択')
    class Meta:
        model = StoreInfo
        fields = '__all__'
    

class Store_selecter(ModelForm):
    selecter = forms.ModelChoiceField(queryset=StoreInfo.objects.filter(place_category = 1,invalid_flg=True),required=False,empty_label='店舗を選択')
    ws2_selecter = forms.ModelChoiceField(queryset=StoreInfo.objects.filter(place_category = 1,invalid_flg=True),required=False,empty_label=None)
    class Meta:
        model = StoreInfo
        fields = '__all__'

class Store_selecterAP(ModelForm):
    selecter = forms.ModelChoiceField(queryset=StoreInfo.objects.filter(invalid_flg=True),required=False,empty_label='場所を選択')
    class Meta:
        model = StoreInfo
        fields = '__all__'

class Pcategory_selecter(Form):
    pcatechoice = (('','カテゴリを選択'),(0,'倉庫'),(1,'店舗'),(2,'その他'),)
    s_selecter = forms.ChoiceField(choices = pcatechoice,required=False)


