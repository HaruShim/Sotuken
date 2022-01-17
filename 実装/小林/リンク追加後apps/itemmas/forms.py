from django import forms
from django.forms import ModelForm
# from django.core.mail import EmailMessage

from .models import ItemInfo

class S0302Form(ModelForm):
    class Meta:
        model = ItemInfo
        fields = ('id', 'model_number', 'category', 'manufacturer_name', 'item_status','purchase_price','item_image','remarks','store_id' )

        widgets = {
                'id': forms.TextInput(attrs={'placeholder': "商品コード",'id':'item-code'}),
                # 'text': forms.Textarea(attrs={'class': 'editable'})
                # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
            }
    
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields.values():
            # self.field["name"].required = True  #必須項目のフォームに変更する
            # self.fields["category"].label = "URL"  #ユーザ視点でフォームの入力名が変わる。
            self.fields["category"].widget.attrs["placeholder"] = "コメントを書"

    # class Meta():
    #     model = Post
    #     fields = ('author', 'title', 'text')

        