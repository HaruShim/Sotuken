# Generated by Django 2.2.2 on 2022-01-19 05:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('itemmas', '0003_auto_20220119_0154'),
    ]

    operations = [
        migrations.AddField(
            model_name='itemspecification',
            name='category',
            field=models.SmallIntegerField(choices=[(0, 'ノートPC'), (1, 'デスクトップ'), (2, 'モニター'), (3, 'メモリ'), (4, 'HDD'), (5, 'SSD'), (6, 'Office'), (7, 'その他')], default='0', verbose_name='カテゴリ'),
        ),
        migrations.AlterField(
            model_name='iteminfo',
            name='category',
            field=models.SmallIntegerField(choices=[(0, 'ノートPC'), (1, 'デスクトップ'), (2, 'モニター'), (3, 'メモリ'), (4, 'HDD'), (5, 'SSD'), (6, 'Office'), (7, 'その他')], verbose_name='カテゴリ'),
        ),
    ]
