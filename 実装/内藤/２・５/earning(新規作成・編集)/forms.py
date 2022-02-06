from django import forms
from django.forms import ModelForm

from earningmas.models import EarningInfo

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
        fields = ('selling_price',)
