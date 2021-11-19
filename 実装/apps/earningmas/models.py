"""earningmas.models.py

    新満の確認
    *earning_idは主キーの書き方に直してください
    *gross_profit_marginは%だからintから修正してください
    *〇〇_idは基本外部(ForeignKey)キーに修正
    
    *マイグレーションができるか確認
    *CSVファイルからデータをコピーできる
    *新満の最終確認

"""

from django.db import models

class EarningInfo(models.Model):

    """EarningInfo

    売上情報モデル

    """
    id = models.AutoField(verbose_name='売上情報ID', db_column='earning_id', primary_key=True, editable=False)
    item_code = models.CharField(verbose_name='商品コード', max_length=9)
    store_id = models.SmallIntegerField(verbose_name='店舗ID')
    employee_id = models.CharField(verbose_name='従業員ID', max_length=13)
    selling_price = models.IntegerField(verbose_name='販売価格')
    gross_profit = models.IntegerField(verbose_name='粗利')
    gross_profit_margin = models.IntegerField(verbose_name='粗利率')
    sale_date = models.DateTimeField(verbose_name='販売日', auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='最終更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = '売上情報モデル'
