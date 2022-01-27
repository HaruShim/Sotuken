from django.contrib import admin
from django.utils.safestring import mark_safe
from .models import GpuBench,CpuBench

class CpuAdmin(admin.ModelAdmin):
    list_display = ['id','cpu_name','passmark','core','thread','tdp','rated_clock','max_clock','list_price','cost_performance']
    search_fields = ['cpu_name',]
    list_filter = ['created_at',]
    ordering = ['id',]


class GpuAdmin(admin.ModelAdmin):
    list_display = ['id','gpu_name','marktimespygraphics','tdp','cost_performance','wattage_performance','list_price']
    search_fields = ['gpu_name',]
    list_filter = ['id',]
    ordering = ['id',]

admin.site.register(GpuBench,GpuAdmin)
admin.site.register(CpuBench,CpuAdmin)
