"""setitem.models.py

    新満の確認
    *マイグレーションができるか確認
    *CSVファイルからデータをコピーできる
    *新満の最終確認

"""

from unicodedata import category
from django.db import models
# storemas から StoreInfoをインポート
from storemas.models import StoreInfo
# itemmasからItemInfoをインポート
from itemmas.models import ItemInfo

class SetItems(models.Model):
    
    """

    """

    id = models.AutoField(verbose_name='セット商品ID',db_column='set_item_id', primary_key=True, editable=False)
    store_id = models.ForeignKey(StoreInfo,db_column='store_id',verbose_name='店舗ID', on_delete=models.CASCADE,limit_choices_to={"place_category":0,"place_category":1})
    set_name = models.CharField(verbose_name='セット名', max_length=30,null=True,blank=True,)
    notepc = models.CharField(verbose_name='ノートPC',max_length=9,null=True,blank=True,)
    desktop = models.CharField(verbose_name='デスクトップ',max_length=9,null=True,blank=True,)
    monitor = models.CharField(verbose_name='モニター',max_length=9,null=True,blank=True,)
    memory = models.CharField(verbose_name='メモリ',max_length=9,null=True,blank=True,)
    hdd = models.CharField(verbose_name='HDD',max_length=9,null=True,blank=True,)
    ssd = models.CharField(verbose_name='SSD',max_length=9,null=True,blank=True,)
    office = models.CharField(verbose_name='Office',max_length=9,null=True,blank=True,)
    others = models.CharField(verbose_name='その他',max_length=9,null=True,blank=True,)

    # notepc = models.ForeignKey(ItemInfo,verbose_name='ノートPC',on_delete=models.SET_NULL, related_name='notepc',null=True,blank=True,limit_choices_to={"category":0,'item_status':0})
    # desktop = models.ForeignKey(ItemInfo,verbose_name='デスクトップ',on_delete=models.SET_NULL, related_name='desktop',null=True,blank=True,limit_choices_to={"category":1,'item_status':0})
    # monitor = models.ForeignKey(ItemInfo,verbose_name='モニター',on_delete=models.SET_NULL, related_name='monitor',null=True,blank=True,limit_choices_to={"category":2,'item_status':0})
    # memory = models.ForeignKey(ItemInfo,verbose_name='メモリ',on_delete=models.SET_NULL, related_name='memory',null=True,blank=True,limit_choices_to={"category":3,'item_status':0})
    # hdd = models.ForeignKey(ItemInfo,verbose_name='HDD',on_delete=models.SET_NULL, related_name='hdd',null=True,blank=True,limit_choices_to={"category":4,'item_status':0})
    # ssd = models.ForeignKey(ItemInfo,verbose_name='SSD',on_delete=models.SET_NULL, related_name='ssd',null=True,blank=True,limit_choices_to={"category":5,'item_status':0})
    # office = models.ForeignKey(ItemInfo,verbose_name='Office',on_delete=models.SET_NULL, related_name='office',null=True,blank=True,limit_choices_to={"category":6,'item_status':0})
    # others = models.ForeignKey(ItemInfo,verbose_name='その他',on_delete=models.SET_NULL, related_name='others',null=True,blank=True,limit_choices_to={"category":7,'item_status':0})
    counter = models.SmallIntegerField(default=0)
    # invalid_flg = models.BooleanField(verbose_name='有効',default=0)
    created_at = models.DateField(verbose_name='作成日時',auto_now_add=True)
    updated_at = models.DateField(verbose_name='最終更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = 'セット商品'
    def __str__(self):
        return self.set_name

