from unicodedata import category
from django.contrib import admin
from .models import SetItem

admin.site.register(SetItem)

# class SetItemAdmin(admin.ModelAdmin):
#     fields = ["store_id","set_name","set_item"]

# admin.site.register(SetItem, SetItemAdmin)