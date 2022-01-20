"""bottleneckmas.models.py

* DBのボトルネックモデルにアクセスするためのモジュール

Todo:

    新満の確認
    *マイグレーションができるか確認
    *CSVファイルからデータをコピーできる
    *新満の最終確認

"""

from django.db import models


class Aaaaa(models.Model):
    
    """Bottleneck

    ボトルネックモデル

    """
    balancechoices=(
        (0,'-'),
        (1,'✕'),
        (2,'△'),
        (3,'〇'),
        (4,'◎'),
    )
    wqhdchoices=(
        (0,'-'),
        (1,'✕'),
        (2,'△'),
        (3,'〇'),
        (4,'◎'),
    )
    four_kchoices=(
        (0,'-'),
        (1,'✕'),
        (2,'△'),
        (3,'〇'),
        (4,'◎'),
    )

    id = models.AutoField(verbose_name='ボトルネックID',db_column='bottleneck_id',primary_key=True,editable=False)
    name = models.CharField(verbose_name='CPU名', max_length=60)
    balance = models.SmallIntegerField(verbose_name='バランス',choices=balancechoices)
    wqhd = models.SmallIntegerField(verbose_name='WQHD',choices=wqhdchoices)
    four_k = models.SmallIntegerField(verbose_name='4K解像度',choices=four_kchoices)

    class Meta:
        verbose_name_plural = 'ボトルネックモデル'
