from pkgutil import ImpImporter
from django.contrib import admin
from workstatus.models import WorkStatus

# class StoreAdmin(admin.ModelAdmin):

admin.site.register(WorkStatus)
# Register your models here.
