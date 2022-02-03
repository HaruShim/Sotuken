from django import forms
from .models import MyModel,Post,File
 
class MyForm(forms.ModelForm):
 
    class Meta:
        model = MyModel
        fields = (
            'product_nm',
            'product_url',
            # 'field_3',
        )
        # widgets = {
        #     'field_1': forms.Select(),
        #     'field_2':forms.Select(),
        #     'field_3':forms.NumberInput(),
        # }
 
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Classの指定など
        for field in self.fields.values():
            field.widget.attrs['class'] = 'form-control'

class PostCreateForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields.values():
            field.widget.attrs['class'] = 'form-control'

    class Meta:
        model = Post
        fields = '__all__'


FileFormset = forms.inlineformset_factory(
    Post, File, fields='__all__',
    extra=1,form=PostCreateForm,
)