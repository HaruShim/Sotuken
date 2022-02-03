from django.contrib import admin

from .models import CustomUser
from django.contrib.auth.admin import UserAdmin

# admin.site.register(CustomUser)

class UserAdmin(admin.ModelAdmin):
    model = CustomUser
    fields = ["username","employment_status","name","ruby_name","tel_num","gender","birthday","is_active","is_superuser","store_id","groups"]
    # fields = "__all__"

admin.site.register(CustomUser,UserAdmin)