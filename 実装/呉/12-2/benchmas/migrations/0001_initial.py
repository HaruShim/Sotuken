# Generated by Django 2.2.2 on 2021-11-30 06:20

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='CpuBench',
            fields=[
                ('id', models.AutoField(db_column='cpu_bench_id', editable=False, primary_key=True, serialize=False, verbose_name='CPUベンチマークID')),
                ('cpu_name', models.CharField(max_length=60, verbose_name='CPU名称')),
                ('passmark', models.IntegerField(verbose_name='PassMark')),
                ('core', models.IntegerField(verbose_name='コア')),
                ('thread', models.IntegerField(verbose_name='スレッド')),
                ('tdp', models.IntegerField(verbose_name='TDP')),
                ('rated_clock', models.FloatField(verbose_name='定格クロック')),
                ('max_clock', models.FloatField(verbose_name='最大クロック')),
                ('list_price', models.IntegerField(verbose_name='定価')),
                ('cost_performance', models.FloatField(verbose_name='コスパ')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='作成日時')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='更新日時')),
            ],
            options={
                'verbose_name_plural': 'Cpuベンチマーク',
            },
        ),
        migrations.CreateModel(
            name='GpuBench',
            fields=[
                ('id', models.AutoField(db_column='gpu_bench_id', editable=False, primary_key=True, serialize=False, verbose_name='GPUベンチマークID')),
                ('gpu_name', models.CharField(max_length=60, verbose_name='GPU名称')),
                ('marktimespygraphics', models.IntegerField(verbose_name='Mark Time Spy Graphics')),
                ('tdp', models.IntegerField(verbose_name='TDP')),
                ('cost_performance', models.FloatField(verbose_name='コスパ')),
                ('wattage_performance', models.FloatField(verbose_name='ワットパフォーマンス')),
                ('list_price', models.IntegerField(verbose_name='定価')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='作成日時')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='更新日時')),
            ],
            options={
                'verbose_name_plural': 'Gpuベンチマーク',
            },
        ),
    ]
