# Generated by Django 2.2.2 on 2022-01-12 06:04

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='EarningInfo',
            fields=[
                ('id', models.AutoField(db_column='earning_id', editable=False, primary_key=True, serialize=False, verbose_name='売上情報ID')),
                ('selling_price', models.IntegerField(verbose_name='販売価格')),
                ('gross_profit', models.IntegerField(verbose_name='粗利')),
                ('gross_profit_margin', models.FloatField(verbose_name='粗利率')),
                ('sale_date', models.DateField(auto_now_add=True, verbose_name='販売日')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='最終更新日時')),
            ],
            options={
                'verbose_name_plural': '売上情報モデル',
            },
        ),
    ]
