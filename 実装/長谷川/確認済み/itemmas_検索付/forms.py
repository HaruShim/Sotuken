from modulefinder import Module
from multiprocessing.spawn import import_main_path
from tkinter import Widget
from django import forms
from django.forms import ModelForm
# from django.core.mail import EmailMessage

from .models import ItemInfo,ItemSpecification
from storemas.models import StoreInfo

class S0301Form(ModelForm):
    store_id = forms.ModelChoiceField(queryset=StoreInfo.objects.all(),required=False,empty_label='販売店舗を選択')
    widgets = {
        # 'store_id':forms.ChoiceField(attrs={'name':"query_4"})
    }
    class Meta:
        model = StoreInfo
        fields = "__all__"

class S0302Form(ModelForm):
    class Meta:
        model = ItemInfo
        fields = ('id','model_number', 'category', 'manufacturer_name','purchase_price','item_image','remarks','store_id' )

        widgets = {
                
                # 'item_image':
                # 'text': forms.Textarea(attrs={'class': 'editable'})
                # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
            }
    
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields.values():
            # self.field["name"].required = True  #必須項目のフォームに変更する
            # self.fields["category"].label = "URL"  #ユーザ視点でフォームの入力名が変わる。
            # self.fields["id"].widget.attrs["type"] = "hidden"
            self.fields["category"].widget.attrs["placeholder"] = "コメントを書"
            self.fields["item_image"].widget.attrs["onChange"] = "imgPreView(event)"

class S0304Form(ModelForm):
    class Meta:
        model = ItemInfo
        fields = ('model_number', 'category', 'manufacturer_name','purchase_price','item_image','remarks','store_id' )

        # widgets = {
    #             'id': forms.TextInput(attrs={'placeholder': "商品コード",'id':'item-code'}),
    #             # 'item_image':
    #             # 'text': forms.Textarea(attrs={'class': 'editable'})
    #             # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
    #         }
    # def __init__(self, *args, **kwargs):
    #     super().__init__(*args, **kwargs)
    #     self.fields['id'].widget = forms.HiddenInput()


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