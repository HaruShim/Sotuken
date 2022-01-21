# Generated by Django 2.2.2 on 2022-01-12 06:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('itemmas', '0001_initial'),
        ('storemas', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Reserve',
            fields=[
                ('id', models.AutoField(db_column='reserve_id', editable=False, primary_key=True, serialize=False, verbose_name='取置商品ID')),
                ('reserver_name', models.CharField(max_length=20, verbose_name='予約者氏名')),
                ('reserver_tel', models.CharField(max_length=13, verbose_name='連絡先')),
                ('reserve_at', models.DateField(auto_now_add=True, verbose_name='予約日時')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='最終更新日時')),
                ('item_code', models.ForeignKey(db_column='item_code', on_delete=django.db.models.deletion.CASCADE, to='itemmas.ItemInfo', verbose_name='商品コード')),
                ('store_id', models.ForeignKey(db_column='store_id', on_delete=django.db.models.deletion.CASCADE, to='storemas.StoreInfo', verbose_name='店舗ID')),
            ],
            options={
                'verbose_name_plural': '商品スペックモデル',
            },
        ),
    ]
