"""itemmas.models.py

* DBの商品情報モデルにアクセスするためのモジュール

Todo:
    新満の確認

    *マイグレーションができるか確認
    *CSVファイルからデータをコピーできる
    *新満の最終確認

"""
from django.db import models
from storemas.models import StoreInfo


class ItemInfo(models.Model):

    """ ItemInfo

    商品情報モデル

    """
    catchoice = (
        (0,'ノートPC'),
        (1,'デスクトップ'),
        (2,'モニター'),
        (3,'メモリ'),
        (4,'HDD'),
        (5,'SDD'),
        (6,'Office'),
        (7,'その他')
    )

    id = models.CharField(verbose_name='商品コード',db_column='item_code',max_length=9,primary_key=True,editable=False)
    model_number = models.CharField(verbose_name='型番', max_length=60)
    category = models.SmallIntegerField(verbose_name='カテゴリ', choices=catchoice)
    manufacturer_name = models.CharField(verbose_name='メーカー名', max_length=30)
    item_status = models.CharField(verbose_name='商品状態', max_length=10)
    purchase_price = models.IntegerField(verbose_name='仕入価格')
    item_image = models.ImageField(verbose_name='商品画像',blank=True,null=True)
    remarks = models.TextField(verbose_name='備考')
    created_at = models.DateTimeField(verbose_name='作成日時', auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='最終更新日時', auto_now=True)
    store_id = models.ForeignKey(StoreInfo,verbose_name='店舗ID', db_column='store_id', on_delete=models.CASCADE)

    class Meta:
        verbose_name_plural = '商品情報モデル'

class ItemSpecification(models.Model):

    """ ItemSpecification

        商品スペックモデル

    """
    id = models.AutoField(verbose_name='スペックID',db_column='spec_id',primary_key=True,editable=False)
    model_number = models.CharField(verbose_name='型番', max_length=60)
    cpu = models.CharField(verbose_name='CPU',default='無し',blank=True,max_length=60)
    hdd = models.FloatField(verbose_name='HDD',default='0',blank=True)
    ssd = models.SmallIntegerField(verbose_name='SSD',default='0',blank=True)
    monitor_size = models.FloatField(verbose_name='モニタサイズ',default='0',blank=True)
    monitor_vertical = models.SmallIntegerField(verbose_name='モニタ解像度(縦)',default='0',blank=True)
    monitor_horizon = models.SmallIntegerField(verbose_name='モニタ解像度(横)',default='0',blank=True)
    camera = models.BooleanField(verbose_name='カメラ',default=0)
    wifi = models.BooleanField(verbose_name='Wi-Fi',default=0)
    optical_drive = models.BooleanField(verbose_name='光学ドライブ',default=0)
    graphic = models.CharField(verbose_name='グラフィック',default='無し',blank=True,max_length=40)
    os = models.CharField(verbose_name='OS',default='無し',blank=True,max_length=40)
