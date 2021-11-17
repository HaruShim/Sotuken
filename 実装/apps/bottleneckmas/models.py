from re import VERBOSE
from django.db import models


class Bottleneck(models.Model):
    bottleneck_id = models.IntegerField(verbose_name='ボトルネックID')
    cpu_name = models.CharField(verbose_name='CPU名', max_length=30)
    gpu_name = models.CharField(verbose_name='GPU名', max_length=30)
    balance = models.SmallIntegerField(verbose_name='バランス')
    wqhd = models.SmallIntegerField(verbose_name='WQHD')
    four_k = models.SmallIntegerField(verbose_name='4K解像度')
    game_appropriate = models.CharField(verbose_name='ゲーム適正', max_length=2)
    game_delivery = models.SmallIntegerField(verbose_name='ゲーム配信')
    video_editing = models.SmallIntegerField(verbose_name='動画編集')
    encode = models.SmallIntegerField(verbose_name='エンコード')
    created_at = models.DateTimeField(verbose_name='作成日時')
    updated_at = models.DateTimeField(verbose_name='最終更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = 'ボトルネックモデル'
