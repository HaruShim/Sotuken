# Generated by Django 2.2.2 on 2021-11-24 03:00

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='StoreInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('store_id', models.SmallIntegerField(verbose_name='店舗ID')),
                ('place_category', models.SmallIntegerField(verbose_name='場所カテゴリ')),
                ('store_name', models.CharField(max_length=20, verbose_name='店舗名')),
                ('address', models.TextField(verbose_name='住所')),
                ('tel', models.CharField(max_length=13, verbose_name='連絡先')),
                ('invalid_flg', models.SmallIntegerField(verbose_name='無効フラグ')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='作成日時')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='最終更新日時')),
            ],
            options={
                'verbose_name_plural': '店舗情報モデル',
            },
        ),
    ]
