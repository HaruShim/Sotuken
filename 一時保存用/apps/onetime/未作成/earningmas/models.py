# """earningmas.models.py
# """

# from re import VERBOSE
# from django.db import models
# from django.db.models.manager import ManagerDescriptor


# class EarningInfo(models.Model):
#     """EarningInfo

#     売上情報モデル

#     """

#     earning_id = models.IntegerField(verbose_name='売上情報ID', max_length=8)
#     item_code = models.CharField(verbose_name='商品コード', max_length=9)
#     store_id = models.SmallIntegerField(verbose_name='店舗ID', max_length=3)
#     employee_id = models.CharField(verbose_name='従業員ID', max_length=13)
#     selling_price = models.IntegerField(verbose_name='販売価格', max_length=8)
#     gross_profit = models.IntegerField(verbose_name='粗利', max_length=8)
#     gross_profit_margin = models.IntegerField(verbose_name='粗利率', max_length=4)
#     sale_date = models.DateTimeField(verbose_name='販売日', auto_now_add=True)
#     updated_at = models.DateTimeField(verbose_name='最終更新日時', auto_now=True)

#     class Meta:
#         verbose_name_plural = '売上情報モデル'
