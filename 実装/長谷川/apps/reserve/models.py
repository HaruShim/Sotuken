"""reserve.models.py

* DBの取置商品モデルにアクセスするためのモジュール

Todo:
    新満の確認

    *マイグレーションができるか確認
    *CSVファイルからデータをコピーできる
    *新満の最終確認

"""

from django.db import models
# itemmasからItemInfoをインポート
from itemmas.models import ItemInfo
# storemas から StoreInfoをインポート
from storemas.models import StoreInfo

from django.utils import timezone


class Reserve(models.Model):

    """ Reserve

    取置商品モデル

    """
    id = models.AutoField(verbose_name='取置商品ID',db_column='reserve_id',primary_key=True,editable=False)
    item_code = models.ForeignKey(ItemInfo,verbose_name='商品コード', db_column='item_code', on_delete=models.CASCADE,limit_choices_to={"item_status":0,})
    store_id = models.ForeignKey(StoreInfo,verbose_name='店舗ID', db_column='store_id', on_delete=models.CASCADE,limit_choices_to={"place_category":1,})
    reserver_name = models.CharField(verbose_name='予約者氏名',max_length=20)
    reserver_tel = models.CharField(verbose_name='連絡先', max_length=14)
    invalid_flg = models.BooleanField(verbose_name='有効',default=0)
    reserve_at = models.DateField(verbose_name='予約日時',default=timezone.now)
    updated_at = models.DateTimeField(verbose_name='最終更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = '商品スペックモデル'
    def __str__(self):
        return str(self.item_code)

