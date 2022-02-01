from django import forms
from django.forms import ModelForm
# from django.core.mail import EmailMessage

from .models import Reserve

class S0902Form(ModelForm):
    class Meta:
        model = Reserve
        fields = ('item_code', 'store_id', 'reserver_name', 'reserver_tel',)

        widgets = {
                # 'id': forms.TextInput(attrs={'placeholder': "商品コード",'id':'item-code'}),
                # 'item_image':
                # 'text': forms.Textarea(attrs={'class': 'editable'})
                # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
            }
    # 一括でフィールドにclassなどを付けたい場合
    def __init__(self, *args, **kwargs):
        for field in self.base_fields.values():
            field.widget.attrs.update({"class":"inputsize"})
        super().__init__(*args, **kwargs)
class S0904Form(ModelForm):
    class Meta:
        model = Reserve
        fields = ('store_id', 'reserver_name', 'reserver_tel','reserve_at')

        widgets = {
                # 'id': forms.TextInput(attrs={'placeholder': "商品コード",'id':'item-code'}),
                # 'item_image':
                # 'text': forms.Textarea(attrs={'class': 'editable'})
                # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
            }
            # 一括でフィールドにclassなどを付けたい場合
    def __init__(self, *args, **kwargs):
        for field in self.base_fields.values():
            field.widget.attrs.update({"class":"inputsize"})
        super().__init__(*args, **kwargs)   

        