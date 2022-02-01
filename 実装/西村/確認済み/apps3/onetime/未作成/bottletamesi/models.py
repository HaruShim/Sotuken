"""bottleneckmas.models.py

* 

Todo:

    * conf.pyの``todo_include_todos = True``にしないと表示されない

"""

from django.db import models
from tamesi.models import IgMstBrand


class Bottletamesi(models.Model):
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

    id = models.AutoField(verbose_name='ボトルネックID',db_column='bottle_id',primary_key=True,editable=False,default="",)
    balance = models.SmallIntegerField(verbose_name='バランス',choices=balancechoices)
    product_nm = models.CharField(max_length=60, blank=True, null=True)
    brand_cd = models.ForeignKey(IgMstBrand,on_delete=models.SET_NULL, null=True, db_column='brand_cd')
    product_url = models.TextField(blank=True, null=True)
    # created_at = models.DateTimeField(verbose_name='作成日時',auto_now_add=True)
    # updated_at = models.DateTimeField(verbose_name='最終更新日時', auto_now=True)

    # class Meta:
        # managed = False
        # db_table = 'ig_mst_product'
