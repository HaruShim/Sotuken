"""bottleneckmas.models.py

* 

Todo:

    * conf.pyの``todo_include_todos = True``にしないと表示されない

"""

from re import VERBOSE
from django.db import models


class Bottleneck(models.Model):
    """Bottleneck

    ボトルネックモデル

    Attributes:
        属性の名前 (属性の型): 属性の説明
        属性の名前 (:obj:`属性の型`): 属性の説明.

    """

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
