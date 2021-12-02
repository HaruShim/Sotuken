
from django.db import models


class GpuBench(models.Model):
    id = models.AutoField(verbose_name='GPUベンチマークID', db_column='gpu_bench_id',primary_key=True,editable=False)
    gpu_name = models.CharField(verbose_name='GPU名称', max_length=60)
    marktimespygraphics = models.IntegerField(verbose_name='Mark Time Spy Graphics')
    tdp = models.IntegerField(verbose_name='TDP')
    cost_performance = models.FloatField(verbose_name='コスパ', max_length=4)
    wattage_performance = models.FloatField(verbose_name='ワットパフォーマンス', max_length=6)
    list_price = models.IntegerField(verbose_name='定価')
    created_at = models.DateTimeField(verbose_name='作成日時')
    updated_at = models.DateTimeField(verbose_name='更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = 'GpuBench'


        
    




