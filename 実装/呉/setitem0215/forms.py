from django import forms
from django.forms import ModelForm
from cProfile import label
from unicodedata import category
from .models import SetItems
from itemmas.models import ItemInfo
from storemas.models import StoreInfo

class S0801Form(ModelForm):
    #  S0801Form

    #  セット商品を登録するフォームを構成するクラス

    store_id = forms.ModelChoiceField(queryset=StoreInfo.objects.filter(place_category = 1,invalid_flg=True),empty_label='店舗を選択')
    set_name = forms.CharField(label='セット名',max_length=30,widget=forms.TextInput(attrs={'placeholder':'セット名を入力',}))
    notepc = forms.ModelChoiceField(queryset=ItemInfo.objects.filter(category = 0,item_status=0),required=False,empty_label='ノートPCを選択')
    desktop = forms.ModelChoiceField(queryset=ItemInfo.objects.filter(category = 1,item_status=0),required=False,empty_label='デスクトップを選択')
    monitor = forms.ModelChoiceField(queryset=ItemInfo.objects.filter(category = 2,item_status=0),required=False,empty_label='モニターを選択')
    memory = forms.ModelChoiceField(queryset=ItemInfo.objects.filter(category = 3,item_status=0),required=False,empty_label='メモリを選択')
    hdd = forms.ModelChoiceField(queryset=ItemInfo.objects.filter(category = 4,item_status=0),required=False,empty_label='HDDを選択')
    ssd = forms.ModelChoiceField(queryset=ItemInfo.objects.filter(category = 5,item_status=0),required=False,empty_label='SSDを選択')
    office = forms.ModelChoiceField(queryset=ItemInfo.objects.filter(category = 6,item_status=0),required=False,empty_label='Officeを選択')
    others = forms.ModelChoiceField(queryset=ItemInfo.objects.filter(category = 7,item_status=0),required=False,empty_label='その他選択')

    class Meta:
        model = SetItems
        fields = ('store_id','set_name','notepc','desktop','monitor','memory','hdd','ssd','office','others',)
    # 一括でフィールドにclassなどを付けたい場合
    def __init__(self, *args, **kwargs):
        for field in self.base_fields.values():
            field.widget.attrs.update({"class":"setinput"})
        super().__init__(*args, **kwargs)


