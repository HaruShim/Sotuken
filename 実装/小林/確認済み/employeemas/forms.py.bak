from django import forms
from django.forms import ModelForm
# from django.core.mail import EmailMessage

from .models import EmployeeInfo

class S0102Form(ModelForm):
    class Meta:
        model = EmployeeInfo
        fields = ('employment_status','name','ruby_name','tel_num','gender','birthday','invalid_flg','store_id',)

        widgets = {
                'gender':forms.RadioSelect
                # 'id': forms.TextInput(attrs={'placeholder': "商品コード",'id':'item-code'}),
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

        


# # django.forms.Formクラス
# # お問い合わせフォームを定義
# from django import forms
# from django.core.mail import EmailMessage
# from .models import Diary


# class InquiryForm(forms.Form):
#     name = forms.CharField(label='お名前',max_length=30) # CharField - URLのための CharField (文字列)
#     email = forms.EmailField(label='メールアドレス')
#     title = forms.CharField(label='タイトル',max_length=30)
#     message = forms.CharField(label='メッセージ',widget=forms.Textarea)

#     def __init__(self,*args,**kwargs):
#         super().__init__(*args,**kwargs)

#         self.fields['name'].widget.attrs['class']='form-control col-9'
#         self.fields['name'].widget.attrs['placeholder']='お名前をここに入力してください。'
#         self.fields['email'].widget.attrs['class']='form-control col-11'
#         self.fields['email'].widget.attrs['placeholder']='メールアドレスをここに入力してください。'
#         self.fields['title'].widget.attrs['class']='form-control col-11'
#         self.fields['title'].widget.attrs['placeholder']='タイトルをここに入力してださい。'
#         self.fields['message'].widget.attrs['class']='form-control col-12'
#         self.fields['message'].widget.attrs['placeholder']='メッセージをここに入力してください。'
        
#     def send_email(self):
#         name = self.cleaned_data['name']
#         email = self.cleaned_data['email']
#         title = self.cleaned_data['title']
#         message = self.cleaned_data['message']

#         subject = 'お問い合わせ{}'.format(title)
#         message = '送信者名{0}\nメールアドレス:{1}\nメッセージ:\n{2}'.format(name,email,message)
#         from_email = 'admin@example.com'
#         to_list =[
#             'test@example.com'
#         ]
#         cc_list = [
#             email
#         ]

#         message = EmailMessage(subject=subject,body=message,from_email=from_email,to=to_list,cc=cc_list)
#         message.send()

