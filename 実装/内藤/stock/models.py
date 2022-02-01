"""stock.models.py

    新満の確認
    *マイグレーションができるか確認
    *CSVファイルからデータをコピーできる
    *新満の最終確認

"""

from django.db import models
# storemas から StoreInfoをインポート
from storemas.models import StoreInfo
# itemmasからItemInfoをインポート
from itemmas.models import ItemInfo

class SetItem(models.Model):
    
    """

    """

    id = models.AutoField(verbose_name='セット商品ID',db_column='set_item_id', primary_key=True, editable=False)
    store_id = models.ForeignKey(StoreInfo,db_column='store_id',verbose_name='店舗ID', on_delete=models.CASCADE)
    set_name = models.CharField(verbose_name='セット名', max_length=30)
    set_item = models.ManyToManyField(ItemInfo)
    created_at = models.DateTimeField(verbose_name='作成日時',auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='最終更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = 'セット商品'
    def __str__(self):
        return self.set_name

