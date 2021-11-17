
from django.db import models


class GpuBench(models.Model):
    gpu_bench_id = models.IntegerField(verbose_name='GPUベンチマークID', max_length=4)
    gpu_name = models.CharField(verbose_name='GPU名称', max_length=30)
    marktimespygraphics = models.IntegerField(verbose_name='Mark Time Spy Graphics', max_length=7)
    tdp = models.IntegerField(verbose_name='TDP', max_length=5)
    cost_performance = models.FloatField(verbose_name='コスパ', max_length=4)
    wattage_performance = models.FloatField(verbose_name='ワットパフォーマンス', max_length=6)
    list_price = models.IntegerField(verbose_name='定価')
    created_at = models.DateTimeField(verbose_name='作成日時')
    updated_at = models.DateTimeField(verbose_name='更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = 'GpuBench'


        
    




