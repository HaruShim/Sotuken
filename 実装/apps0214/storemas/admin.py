from django.contrib import admin
from django.utils.safestring import mark_safe
from .models import StoreInfo

# class StoreAdmin(admin.ModelAdmin):

admin.site.register(StoreInfo)
# Register your models here.
