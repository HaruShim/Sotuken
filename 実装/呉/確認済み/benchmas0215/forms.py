from django import forms
from django.forms import ModelForm

from .models import CpuBench,GpuBench

class S0502CPUForm(ModelForm):
    class Meta:
        model = CpuBench
        fields = ('cpu_name','passmark','core','thread','tdp','rated_clock','max_clock','list_price','cost_performance')

        widgets = {
            'cpu_name':forms.TextInput(attrs={'placeholder':"Ryzen 9 5950X"}),
            'passmark':forms.TextInput(attrs={'placeholder':"46132"}),
            'core':forms.TextInput(attrs={'placeholder':"16"}),
            'thread':forms.TextInput(attrs={'placeholder':"32"}),
            'tdp':forms.TextInput(attrs={'placeholder':"3.4"}),
            'rated_clock':forms.TextInput(attrs={'placeholder':"4.9"}),
            'max_clock':forms.TextInput(attrs={'placeholder':"105"}),
            'list_price':forms.TextInput(attrs={'placeholder':"106500"}),
            'cost_performance':forms.TextInput(attrs={'placeholder':"0.43"}),
                # 'tel': forms.TextInput(attrs={'placeholder': "000-0000-0000"}),
                # 'text': forms.Textarea(attrs={'class': 'editable'})
                # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
            }
    # ラベルの：を消す
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.label_suffix = " "

class S0502GPUForm(ModelForm):
    class Meta:
        model = GpuBench
        fields = ('gpu_name','marktimespygraphics','tdp','cost_performance','wattage_performance','list_price',)

        widgets = {
            'gpu_name':forms.TextInput(attrs={'placeholder':"GeForce RTX 3090"}),
            'marktimespygraphics':forms.TextInput(attrs={'placeholder':"19867"}),
            'tdp':forms.TextInput(attrs={'placeholder':"350"}),
            'cost_performance':forms.TextInput(attrs={'placeholder':"0.069"}),
            'wattage_performance':forms.TextInput(attrs={'placeholder':"56.8"}),
            'list_price':forms.TextInput(attrs={'placeholder':"29000"}),
                # 'tel': forms.TextInput(attrs={'placeholder': "000-0000-0000"}),
                # 'text': forms.Textarea(attrs={'class': 'editable'})
                # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
            }