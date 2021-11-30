from django import forms
from django.db.models import fields
from .models import GpuBench,CpuBench

class BenchGpuForm(forms.ModelForm):
    class Meta():
        model = GpuBench
        fields = '__all__'

class BenchCpuForm(forms.ModelForm):
    class Meta():
        model = CpuBench
        fields = '__all__'
