from django import forms
from django.forms import ModelForm
# from django.core.mail import EmailMessage

from .models import ItemInfo,ItemSpecification

class S0302Form(ModelForm):
    class Meta:
        model = ItemInfo
        fields = ('id', 'model_number', 'category', 'manufacturer_name', 'item_status','purchase_price','item_image','remarks','store_id' )

        widgets = {
                'id': forms.TextInput(attrs={'placeholder': "商品コード",'id':'item-code'}),
                # 'item_image':
                # 'text': forms.Textarea(attrs={'class': 'editable'})
                # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
            }
    
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields.values():
            # self.field["name"].required = True  #必須項目のフォームに変更する
            # self.fields["category"].label = "URL"  #ユーザ視点でフォームの入力名が変わる。
            self.fields["category"].widget.attrs["placeholder"] = "コメントを書"
            self.fields["item_image"].widget.attrs["onChange"] = "imgPreView(event)"

    # class Meta():
    #     model = Post
    #     fields = ('author', 'title', 'text')
class S0305Form(ModelForm):
    class Meta:
        model = ItemSpecification
        fields = ('model_number', 'cpu', 'hdd', 'ssd', 'monitor_size','monitor_vertical','monitor_horizon','camera','wifi','optical_drive','graphic','os' )

        widgets = {
                'id': forms.TextInput(attrs={'placeholder': "商品コード",'id':'item-code'}),
                # 'item_image':
                # 'text': forms.Textarea(attrs={'class': 'editable'})
                # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
            }