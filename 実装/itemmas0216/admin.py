from django.contrib import admin
from django.utils.safestring import mark_safe
from .models import ItemInfo

class ItemAdmin(admin.ModelAdmin):
    list_display = ('id','model_number','category','manufacturer_name','item_status','purchase_price','remarks','store_name')
    list_display_links = ('id',)
    search_fields = ('id',)

    def store_name(self,obj):
        return obj.store_id.store_name
    
        store_name.short_description = '店舗名'
        store_name.admin_order_field = 'id'
        # list_filter = ('item_status',)
        search_fields = ['id',]
        list_filter = ['item_status',]
        # search_fields = ('id',)
    # def item_image_preview(self, obj):
    #     return mark_safe('<img src="{}" style="width:100px; height:auto;">'.format(obj.item_image.url))

    # item_image_preview.short_description = '商品画像プレビュー'


admin.site.register(ItemInfo,ItemAdmin)

# @admin.register(Breed)
# class BreedAdmin(admin.ModelAdmin):
#     search_fields = ('name',)

# Register your models here.
# from django.contrib import admin
# from .models import Book

# class BookAdmin(admin.ModelAdmin):
#     list_display = ('id', 'title', 'author', 'author_age')
#     list_display_links = ('id', 'title')

#     def author_age(self, obj):
#         return obj.author.age
#     author_age.short_description = '著者の年齢'
#     author_age.admin_order_field = 'author__age'

# admin.site.register(Book, BookAdmin)