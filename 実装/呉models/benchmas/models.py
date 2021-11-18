
"""Bench.models.py
*
Todo:

    新満の確認
    *〇〇_idは基本外部(ForeignKey)キーに修正
    *int型のfieldにはmax_lengthをつけないでください
    
    *マイグレーションができるか確認
    *CSVファイルからデータをコピーできる
    *新満の最終確認


"""
from django.db import models

class GpuBench(models.Model):

    """GpuBench

    Gpuベンチマーク

    """
    id = models.AutoField(verbose_name='GPUベンチマークID',db_column='gpu_bench_id', primary_key=True, editable=False)
    gpu_name = models.CharField(verbose_name='GPU名称', max_length=30)
    marktimespygraphics = models.IntegerField(verbose_name='Mark Time Spy Graphics')
    tdp = models.IntegerField(verbose_name='TDP')
    cost_performance = models.FloatField(verbose_name='コスパ', max_length=4)
    wattage_performance = models.FloatField(verbose_name='ワットパフォーマンス', max_length=6)
    list_price = models.IntegerField(verbose_name='定価')
    created_at = models.DateTimeField(verbose_name='作成日時', auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = 'Gpuベンチマーク'


class CpuBench(models.Model):
    
    """CpuBench

    Cpuベンチマーク

    """
    id = models.AutoField(verbose_name='CPUベンチマークID',db_column='cpu_bench_id', primary_key=True, editable=False)
    cpu_name = models.CharField(verbose_name='CPU名称', max_length=30)
    passmark = models.IntegerField(verbose_name='PassMark', max_length=7)
    core = models.IntegerField(verbose_name='コア', max_length=4)
    thread = models.IntegerChoices(verbose_name='スレッド', max_length=4)
    tdp = models.IntegerChoices(verbose_name='TDP', max_length=5)
    rated_clock = models.FloatField(verbose_name='定格クロック', max_length=4)
    max_clock = models.FloatField(verbose_name='最大クロック',max_length=4)
    list_price = models.IntegerField(verbose_name='定価',max_length=8)
    cost_performance = models.FloatField(verbose_name='定格クロック')
    created_at = models.DateTimeField(verbose_name='作成日時', auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = 'Cpuベンチマーク'
