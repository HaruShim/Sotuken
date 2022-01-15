"""bottleneckmas.models.py

    * DBのボトルネックモデルにアクセスするためのモジュール

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
    game_appropriatechoices=(
        (0,'-'),
        (1,'S+'),
        (2,'S'),
        (3,'S-'),
        (4,'A+'),
        (5,'A'),
        (6,'A-'),
        (7,'B+'),
        (8,'B'),
        (9,'B-'),
        (10,'C+'),
        (11,'C'),
        (12,'C-'),
        (13,'D+'),
        (14,'D'),
        (15,'D-'),
        
    )
    game_deliverychoices=(
        (0,'-'),
        (1,'✕'),
        (2,'△'),
        (3,'〇'),
        (4,'◎'),
    )
    video_editingchoices=(
        (0,'-'),
        (1,'✕'),
        (2,'△'),
        (3,'〇'),
        (4,'◎'),
    )
    encodechoices=(
        (0,'-'),
        (1,'✕'),
        (2,'△'),
        (3,'〇'),
        (4,'◎'),
    )

    id = models.AutoField(verbose_name='ボトルネックID',db_column='bottleneck_id',primary_key=True,editable=False)
    cpu_name = models.CharField(verbose_name='CPU名', max_length=60)
    gpu_name = models.CharField(verbose_name='GPU名', max_length=60)
    balance = models.SmallIntegerField(verbose_name='バランス',choices=balancechoices,default = 4,)
    wqhd = models.SmallIntegerField(verbose_name='WQHD',choices=wqhdchoices,default = 4,)
    four_k = models.SmallIntegerField(verbose_name='4K解像度',choices=four_kchoices,default = 4,)
    game_appropriate = models.SmallIntegerField(verbose_name='ゲーム適正',choices=game_appropriatechoices,default = 8,)
    game_delivery = models.SmallIntegerField(verbose_name='ゲーム配信',choices=game_deliverychoices,default = 4,)
    video_editing = models.SmallIntegerField(verbose_name='動画編集',choices=video_editingchoices,default = 4,)
    encode = models.SmallIntegerField(verbose_name='エンコード',choices=encodechoices,default = 4,)
    created_at = models.DateTimeField(verbose_name='作成日時',auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='最終更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = 'ボトルネックモデル'
