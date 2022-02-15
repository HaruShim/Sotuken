from django import forms
from django.forms import ModelForm
# from django.core.mail import EmailMessage

from .models import ItemInfo,ItemSpecification
from storemas.models import StoreInfo

class S0301Form(ModelForm):
    catchoice = (
        ('','カテゴリを選択'),(0,'ノートPC'),(1,'デスクトップ'),(2,'モニター'),(3,'メモリ'),(4,'HDD'),(5,'SSD'),(6,'Office'),(7,'その他')
    )
    category = forms.ChoiceField(choices = catchoice,required=False)
    store_id = forms.ModelChoiceField(queryset=StoreInfo.objects.all(),required=True,empty_label='販売店舗を選択')

    class Meta:
        model = StoreInfo
        fields = "__all__"
        widgets = {
            
        }
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['category'].widget.attrs['id'] = 'itemmascategory'

class S0302Form(ModelForm):
    catchoice = (
        ('','カテゴリを選択'),(0,'ノートPC'),(1,'デスクトップ'),(2,'モニター'),(3,'メモリ'),(4,'HDD'),(5,'SSD'),(6,'Office'),(7,'その他')
    )
    category = forms.ChoiceField(choices = catchoice,required=False)
    store_id = forms.ModelChoiceField(queryset=StoreInfo.objects.all(),required=False,empty_label='販売店舗を選択')
    id = forms.CharField(required=True,disabled=False,max_length=9,min_length=9,widget=forms.TextInput(attrs={'placeholder':'000000000','pattern':'^[0-9]+$'}))
    class Meta:
        model = ItemInfo
        fields = ('id','model_number', 'category', 'manufacturer_name','purchase_price','item_image','remarks','store_id' )

        widgets = {
                'id':forms.TextInput(attrs={'placeholder':"000000000"}),
                'model_number': forms.TextInput(attrs={'placeholder': "型番を入力"}),
                'purchase_price': forms.TextInput(attrs={'placeholder': "99999"}),
                'manufacturer_name': forms.TextInput(attrs={'placeholder': "オーハラ",}),
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
    camera = forms.TypedChoiceField(
                    coerce=lambda x: x == 'True',
                    choices=((False, '無し'), (True, '有り')),
                    widget=forms.RadioSelect
                )
    wifi = forms.TypedChoiceField(
        coerce=lambda x: x == 'True',
        choices=((False, '無し'), (True, '有り')),
        widget=forms.RadioSelect
    )
    optical_drive = forms.TypedChoiceField(
                    coerce=lambda x: x == 'True',
                    choices=((False, '無し'), (True, '有り')),
                    widget=forms.RadioSelect
    )
    class Meta:
        model = ItemSpecification
        fields = ('model_number', 'cpu', 'hdd', 'ssd', 'monitor_size','monitor_vertical','monitor_horizon','camera','wifi','optical_drive','graphic','os' )

        widgets = {
                'model_number': forms.TextInput(attrs={'placeholder': "型番を入力"}),
                # 'item_image':
                # 'text': forms.Textarea(attrs={'class': 'editable'})
                # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
            }