from django import forms
from django.forms import ModelForm,ModelChoiceField
# from django.core.mail import EmailMessage

from itemmas.models import ItemInfo,ItemSpecification

class CustomModelChoiceField(ModelChoiceField):
    def label_from_instance(self, obj): # label_from_instance 関数をオーバーライド
        return obj.id # 表示したいカラム名を return
# class IgProductForm(forms.ModelForm):
#     brand_cd = CustomModelChoiceField(queryset=IgMstBrand.objects.all()) # 上記のクラスを参照する様変更
#     class Meta:
#         model = IgMstProduct
#         fields = ('product_nm', 'product_category', 'brand_cd', 'product_url',)

class S1001Form(ModelForm):
    id = CustomModelChoiceField(queryset=ItemInfo.objects.all())
    class Meta:
        model = ItemInfo
        fields = ('id', )
    # def __init__( self, *args, **kwargs):
    #     super(ItemInfo,self).__init__(*args, **kwargs)
    #     self.fields['id'].queryset = ItemInfo.objects.filter(category = 6)