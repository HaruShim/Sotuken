"""storemas.models.py

* DBの店舗情報モデルにアクセスするためのモジュール

Todo:

    新満の確認
    *マイグレーションができるか確認
    *CSVファイルからデータをコピーできる
    *新満の最終確認

"""

from django.db import models

class StoreInfo(models.Model):
    """StoreInfo

    店舗情報モデル

    """

    store_id = models.SmallIntegerField(verbose_name='店舗ID')
    place_category = models.SmallIntegerField(verbose_name='場所カテゴリ',choices=pcchoice)
    store_name = models.CharField(verbose_name='店舗名', max_length=20)
    address = models.TextField(verbose_name='住所')
    tel = models.CharField(verbose_name='連絡先', max_length=13)
    invalid_flg = models.SmallIntegerField(verbose_name='無効フラグ')
    created_at = models.DateTimeField(verbose_name='作成日時', auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='最終更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = '店舗情報モデル'
