# Generated by Django 2.2.2 on 2022-01-12 06:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('storemas', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='ItemSpecification',
            fields=[
                ('id', models.AutoField(db_column='spec_id', editable=False, primary_key=True, serialize=False, verbose_name='スペックID')),
                ('model_number', models.CharField(max_length=60, verbose_name='型番')),
                ('cpu', models.CharField(blank=True, default='無し', max_length=60, verbose_name='CPU')),
                ('hdd', models.FloatField(blank=True, default='0', verbose_name='HDD')),
                ('ssd', models.SmallIntegerField(blank=True, default='0', verbose_name='SSD')),
                ('monitor_size', models.FloatField(blank=True, default='0', verbose_name='モニタサイズ')),
                ('monitor_vertical', models.SmallIntegerField(blank=True, default='0', verbose_name='モニタ解像度(縦)')),
                ('monitor_horizon', models.SmallIntegerField(blank=True, default='0', verbose_name='モニタ解像度(横)')),
                ('camera', models.BooleanField(default=0, verbose_name='カメラ')),
                ('wifi', models.BooleanField(default=0, verbose_name='Wi-Fi')),
                ('optical_drive', models.BooleanField(default=0, verbose_name='光学ドライブ')),
                ('graphic', models.CharField(blank=True, default='無し', max_length=40, verbose_name='グラフィック')),
                ('os', models.CharField(blank=True, default='無し', max_length=40, verbose_name='OS')),
            ],
            options={
                'verbose_name_plural': '商品スペックモデル',
            },
        ),
        migrations.CreateModel(
            name='ItemInfo',
            fields=[
                ('id', models.CharField(db_column='item_code', max_length=9, primary_key=True, serialize=False, verbose_name='商品コード')),
                ('model_number', models.CharField(max_length=60, verbose_name='型番')),
                ('category', models.SmallIntegerField(choices=[(0, 'ノートPC'), (1, 'デスクトップ'), (2, 'モニター'), (3, 'メモリ'), (4, 'HDD'), (5, 'SDD'), (6, 'Office'), (7, 'その他')], verbose_name='カテゴリ')),
                ('manufacturer_name', models.CharField(max_length=30, verbose_name='メーカー名')),
                ('item_status', models.SmallIntegerField(choices=[(0, '販売中'), (1, '販売済み'), (2, '修理中'), (3, '取置')], verbose_name='商品状態')),
                ('purchase_price', models.IntegerField(verbose_name='仕入価格')),
                ('item_image', models.ImageField(blank=True, null=True, upload_to='', verbose_name='商品画像')),
                ('remarks', models.TextField(blank=True, null=True, verbose_name='備考')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='作成日時')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='最終更新日時')),
                ('store_id', models.ForeignKey(db_column='store_id', on_delete=django.db.models.deletion.CASCADE, to='storemas.StoreInfo', verbose_name='店舗名')),
            ],
            options={
                'verbose_name_plural': '商品情報モデル',
            },
        ),
    ]
