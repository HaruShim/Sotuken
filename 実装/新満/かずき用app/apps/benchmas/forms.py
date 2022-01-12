from django import forms
from django.forms import ModelForm

from .models import CpuBench,GpuBench

class S0502CPUForm(ModelForm):
    class Meta:
        model = CpuBench
        fields = ('cpu_name','passmark','core','thread','tdp','rated_clock','max_clock','list_price','cost_performance')

        widgets = {
                # 'tel': forms.TextInput(attrs={'placeholder': "000-0000-0000"}),
                # 'text': forms.Textarea(attrs={'class': 'editable'})
                # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
            }

class S0502GPUForm(ModelForm):
    class Meta:
        model = GpuBench
        fields = ('gpu_name','marktimespygraphics','tdp','cost_performance','wattage_performance','list_price',)

        widgets = {
                # 'tel': forms.TextInput(attrs={'placeholder': "000-0000-0000"}),
                # 'text': forms.Textarea(attrs={'class': 'editable'})
                # cssクラスの追加(titleにtextinputclass, textにeditableクラスが追加されるようになる)
            }