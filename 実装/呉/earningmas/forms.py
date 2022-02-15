from django import forms
from django.forms import ModelForm,Form

from .models import EarningInfo
from storemas.models import StoreInfo
from accounts.models import CustomUser
from itemmas.models import ItemInfo




class EarningForm(Form):
    s_storeselecter = forms.ModelChoiceField(queryset=StoreInfo.objects.filter(place_category = 1,invalid_flg=True),required=False,empty_label='店舗を選択')
    s_employeeselectre = forms.ModelChoiceField(queryset=CustomUser.objects.filter(is_active = True).exclude(employment_status=0),required=False,empty_label='担当者を選択')
    s_itemselecter = forms.ModelChoiceField(queryset=ItemInfo.objects.filter(item_status = 0),required=False,empty_label='商品コードを選択')

class S1102Form(ModelForm):
    class Meta:
        model = EarningInfo
        fields = ('selling_price','item_code','store_id','employee_id', )

        widgets = {
                # 'id': forms.TextInput(attrs={'placeholder': "商品コード",'id':'item-code'}),
                # 'text': forms.Textarea(attrs={'class': 'editable'})
                # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
            }

class S1104Form(ModelForm):
    class Meta:
        model = EarningInfo
        fields = ('selling_price','store_id','employee_id' )

