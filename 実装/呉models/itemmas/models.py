"""itemmas.models.py

* DBの商品情報モデルにアクセスするためのモジュール

Todo:

    新満の確認
    *マイグレーションができるか確認
    *CSVファイルからデータをコピーできる
    *新満の最終確認
1
"""
from django.db import models


class ItemInfo(models.Model):

    """ ItemInfo

    商品情報モデル

    """
    id = models.AutoField(
        verbose_name='商品コード', db_column='item_code', primary_key=True, editable=False)
    store_id = models.IntegerField(verbose_name='店舗ID')
    model_number = models.CharField(verbose_name='型番', max_length=30)
    category = models.SmallIntegerField(verbose_name='カテゴリ')
    manufacturer_name = models.CharField(verbose_name='メーカー名', max_length=30)
    item_status = models.CharField(verbose_name='商品状態', max_length=10)
    purchase_price = models.IntegerField(verbose_name='仕入価格')
    item_image = models.ImageField(verbose_name='商品画像')
    remarks = models.TimeField(verbose_name='備考')
    created_at = models.DateTimeField(verbose_name='作成日時', auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='最終更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = '商品情報モデル'
