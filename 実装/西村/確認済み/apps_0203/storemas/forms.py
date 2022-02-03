from django import forms
from django.forms import ModelForm
from .models import StoreInfo

class S0202Form(ModelForm):
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
    store_selecter = forms.ModelChoiceField(queryset=StoreInfo.objects.filter(place_category = 1,invalid_flg=True),required=False,empty_label='店舗を選択')
    class Meta:
        model = StoreInfo
        fields = '__all__'

class Store_selecterAP(ModelForm):
    store_selecter = forms.ModelChoiceField(queryset=StoreInfo.objects.filter(invalid_flg=True),required=False,empty_label='場所を選択')
    class Meta:
        model = StoreInfo
        fields = '__all__'

