from allauth.account.adapter import DefaultAccountAdapter

class AccountAdapter(DefaultAccountAdapter):

    def save_user(self, request, user, form, commit=True):
        user = super(AccountAdapter, self).save_user(request, user, form, commit=False)
        user.name = form.cleaned_data.get('name')
        user.ruby_name = form.cleaned_data['ruby_name']
        user.tel_num = form.cleaned_data['tel_num']
        user.gender = form.cleaned_data['gender']
        user.birthday = form.cleaned_data['birthday']
        user.store_id = form.cleaned_data['store_id']
        user.employment_status = form.cleaned_data['employment_status']
        user.save()