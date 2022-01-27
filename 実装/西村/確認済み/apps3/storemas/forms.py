from django import forms
from django.forms import ModelForm
# from django.core.mail import EmailMessage

from .models import StoreInfo

class S0202Form(ModelForm):
    class Meta:
        model = StoreInfo
        fields = ( 'place_category', 'store_name', 'address', 'tel',)

        widgets = {
                'store_name': forms.TextInput,
                'tel': forms.TextInput(attrs={'placeholder': '000-0000-0000','class':'inputsize'}),
        }
    
        # 一括でフィールドにclassなどを付けたい場合
        def __init__(self, *args, **kwargs):
            for field in self.base_fields.values():
                field.widget.attrs.update({"class":"inputsize"})
            super().__init__(*args, **kwargs)
    
        # def __init__(self, *args, **kwargs):
        #     super().__init__(*args, **kwargs)
        #     for field in self.fields.values():
        #         # self.field["name"].required = True  #必須項目のフォームに変更する
        #         # self.fields["category"].label = "URL"  #ユーザ視点でフォームの入力名が変わる。
        #         self.fields["category"].widget.attrs["placeholder"] = "コメントを書"

    # class Meta():
    #     model = Post
    #     fields = ('author', 'title', 'text')

