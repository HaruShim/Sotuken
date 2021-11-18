"""bottleneckmas.models.py

* 

Todo:

    新満の確認
    *マイグレーションができるか確認
    *CSVファイルからデータをコピーできる
    *新満の最終確認
"""

from django.db import models


class Bottleneck(models.Model):
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
    id = models.AutoField(verbose_name='GPUベンチマークID',db_column='gpu_bench_id', primary_key=True, editable=False)
    bottleneck_id = models.IntegerField(verbose_name='ボトルネックID')
    cpu_name = models.CharField(verbose_name='CPU名', max_length=30)
    gpu_name = models.CharField(verbose_name='GPU名', max_length=30)
    balance = models.SmallIntegerField(verbose_name='バランス',choices=balancechoices)
    wqhd = models.SmallIntegerField(
        verbose_name='WQHD', choices=balancechoices)
    four_k = models.SmallIntegerField(
        verbose_name='4K解像度', choices=balancechoices)
    game_appropriate = models.SmallIntegerField(
        verbose_name='ゲーム適正', max_length=2, choices=balancechoices)
    game_delivery = models.SmallIntegerField(
        verbose_name='ゲーム配信', choices=balancechoices)
    video_editing = models.SmallIntegerField(
        verbose_name='動画編集', choices=balancechoices)
    encode = models.SmallIntegerField(
        verbose_name='エンコード', choices=balancechoices)
    created_at = models.DateTimeField(verbose_name='作成日時',auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='最終更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = 'ボトルネックモデル'
