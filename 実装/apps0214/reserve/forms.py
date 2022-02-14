from django import forms
from django.forms import ModelForm
# from django.core.mail import EmailMessage

from .models import Reserve
from storemas.models import StoreInfo

class ResStore_selecter(ModelForm):
    selecter = forms.ModelChoiceField(queryset=StoreInfo.objects.filter(place_category = 1,invalid_flg=True),required=False,empty_label='店舗を選択')
    class Meta:
        model = StoreInfo
        fields = '__all__'

class S0902Form(ModelForm):
    reserver_name = forms.CharField(
        # label=labels[3],
        required=True,
        disabled=False,
        max_length=20,
        min_length=1,
        widget=forms.TextInput(attrs={
            # 'id': 'reserver_name',
            'placeholder': 'オオハラ ハナコ',
            'pattern': '^[ｦ-ﾟァ-ヴ]+$'}
        ))
    reserver_tel = forms.CharField(
        # label=labels[3],
        required=True,
        disabled=False,
        max_length=14,
        # min_length=14,
        widget=forms.TextInput(attrs={
            'placeholder': '000-0000-0000',
            'pattern':'\d{2,4}-\d{2,4}-\d{3,4}'}
        ))
    # pattern="\d{2,4}-\d{2,4}-\d{3,4}"

    class Meta:
        model = Reserve
        fields = ('item_code', 'store_id', 'reserver_name', 'reserver_tel',)
    # 一括でフィールドにclassなどを付けたい場合

    def __init__(self, *args, **kwargs):
        for field in self.base_fields.values():
            field.widget.attrs.update({"class": "inputsize"})
        super().__init__(*args, **kwargs)
    



class S0904Form(ModelForm):
    class Meta:
        model = Reserve
        fields = ('store_id', 'reserver_name', 'reserver_tel', 'reserve_at')

        widgets = {
            # 'id': forms.TextInput(attrs={'placeholder': "商品コード",'id':'item-code'}),
            # 'item_image':
            # 'text': forms.Textarea(attrs={'class': 'editable'})
            # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
        }
        # 一括でフィールドにclassなどを付けたい場合

    def __init__(self, *args, **kwargs):
        for field in self.base_fields.values():
            field.widget.attrs.update({"class": "inputsize"})
        super().__init__(*args, **kwargs)
