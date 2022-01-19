from django import forms
from django.forms import ModelForm
# from django.core.mail import EmailMessage

from .models import StoreInfo

class S0202Form(ModelForm):
    class Meta:
        model = StoreInfo
        fields = ( 'place_category', 'store_name', 'address', 'tel',)

        widgets = {
                'tel': forms.TextInput(attrs={'placeholder': "000-0000-0000"}),
                # 'text': forms.Textarea(attrs={'class': 'editable'})
                # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
            }
    
    
        # def __init__(self, *args, **kwargs):
        #     super().__init__(*args, **kwargs)
        #     for field in self.fields.values():
        #         # self.field["name"].required = True  #必須項目のフォームに変更する
        #         # self.fields["category"].label = "URL"  #ユーザ視点でフォームの入力名が変わる。
        #         self.fields["category"].widget.attrs["placeholder"] = "コメントを書"

    # class Meta():
    #     model = Post
    #     fields = ('author', 'title', 'text')
