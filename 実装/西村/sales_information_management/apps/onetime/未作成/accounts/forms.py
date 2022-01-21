# from allauth.account.forms import SignupForm
# from django import forms
# from .models import CustomUser
# from allauth.account.adapter import DefaultAccountAdapter

# class CustomSignupForm(SignupForm):

#     employee_id = forms.ForeignKey()
#     # store_id = forms.IntegerField()
#     # employment_status = forms.CharField()
#     # name = forms.CharField()
#     # ruby_name = forms.CharField()
#     # tel_num = forms.CharField()
#     # gender = forms.CharField()
#     # birthday = forms.DateField()
#     # invalid_flg = forms.BooleanField()
#     # created_at = forms.DateTimeField()
#     # updated_at = forms.DateTimeField()


#     class Meta:
#         model = CustomUser
#         # widgets={'employee_id': forms.TextInput(attrs={"readonly": "readonly"})}

#     def signup(self, request,user):
#         user.employee_id = self.cleaned_data['employee_id']
#         # user.store_id = self.cleaned_data['store_id']

#         # user.age = self.cleaned_data['age']
#         # user.weight = self.cleaned_data['weight']
#         user.save()
#         return user