from django.contrib import admin
from django.utils.safestring import mark_safe
from .models import Bottleneck

class BottleneckAdmin(admin.ModelAdmin):
    list_display = ['id','cpu_name','gpu_name','balance','wqhd','four_k','game_appropriate','game_delivery','video_editing','encode',]
    search_fields = ['cpu_name','gpu_name',]
    list_filter = ['balance','wqhd','four_k','game_appropriate','game_delivery','video_editing','encode','created_at',]
    ordering = ['id',]

admin.site.register(Bottleneck,BottleneckAdmin)
