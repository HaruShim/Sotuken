# from django import forms
# from .models import IgMstProduct,IgMstBrand
# # forms.py

# class CustomModelChoiceField(forms.ModelChoiceField):
#     def label_from_instance(self, obj): # label_from_instance 関数をオーバーライド
#         return obj.brand_nm # 表示したいカラム名を return


# class IgProductForm(forms.ModelForm):
#     brand_cd = CustomModelChoiceField(queryset=IgMstBrand.objects.all()) # 上記のクラスを参照する様変更

#     class Meta:
#         model = IgMstProduct
#         fields = ('product_nm', 'brand_cd', 'product_url',)