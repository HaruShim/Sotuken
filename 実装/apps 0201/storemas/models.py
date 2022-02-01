"""storemas.models.py

* DBの店舗情報モデルにアクセスするためのモジュール

Todo:

    新満の確認
    *マイグレーションができるか確認
    *CSVファイルからデータをコピーできる
    *新満の最終確認

"""

from django.db import models
# 


class StoreInfo(models.Model):
    """StoreInfo

    店舗情報モデル

    """
    pcchoice = (
        (0,'倉庫'),
        (1,'店舗'),
        (2,'その他'),
    )

    id = models.AutoField(verbose_name='店舗ID',db_column='store_id',primary_key=True,editable=False)
    place_category = models.SmallIntegerField(verbose_name='場所カテゴリ',choices=pcchoice,default=1)
    store_name = models.CharField(verbose_name='店舗名', max_length=40)
    address = models.TextField(verbose_name='住所')
    tel = models.CharField(verbose_name='連絡先', max_length=13)
    invalid_flg = models.BooleanField(verbose_name='有効',default=0)
    created_at = models.DateField(verbose_name='作成日時', auto_now_add=True)
    updated_at = models.DateField(verbose_name='最終更新日時', auto_now=True)
    

    class Meta:
        verbose_name_plural = '店舗情報モデル'
    def __str__(self):
        return self.store_name
