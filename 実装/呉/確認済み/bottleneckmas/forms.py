from django import forms
from django.forms import ModelForm

from .models import Bottleneck

class S0602Form(ModelForm):
    class Meta:
        model = Bottleneck
        fields = ('cpu_name','gpu_name','balance','wqhd','four_k','game_appropriate','game_delivery','video_editing','encode',)

        widgets = {
                'cpu_name':forms.TextInput(attrs={'placeholder':"CPU型番"}),
                'gpu_name':forms.TextInput(attrs={'placeholder':"GPU型番"}),
            }
            
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # for field in self.fields.values():
        #     self.fields["category"].widget.attrs["placeholder"] = "コメントを書"

        