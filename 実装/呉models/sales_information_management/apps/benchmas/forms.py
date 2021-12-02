from .models import GpuBench
from django import forms


class Benchmark_registerForm(forms.ModelForm):
    class Meta:
        model = GpuBench
        fields = '__all__'

        def __init__(self, *args, **kwargs):
            super().__init__(*args, **kwargs)
            for field in self.fields.values():
                field.widget.attrs['class'] = 'form-control'
