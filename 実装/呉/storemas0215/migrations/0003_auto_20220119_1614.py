# Generated by Django 2.2.2 on 2022-01-19 07:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('storemas', '0002_auto_20220119_0913'),
    ]

    operations = [
        migrations.AlterField(
            model_name='storeinfo',
            name='created_at',
            field=models.DateField(auto_now_add=True, verbose_name='作成日時'),
        ),
        migrations.AlterField(
            model_name='storeinfo',
            name='updated_at',
            field=models.DateField(auto_now=True, verbose_name='最終更新日時'),
        ),
    ]
