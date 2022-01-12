# Generated by Django 2.2.2 on 2022-01-12 02:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('itemmas', '0001_initial'),
        ('storemas', '0001_initial'),
        ('employeemas', '0001_initial'),
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
                ('employee_id', models.ForeignKey(db_column='employee_id', on_delete=django.db.models.deletion.CASCADE, to='employeemas.EmployeeInfo', verbose_name='従業員ID')),
                ('item_code', models.ForeignKey(db_column='item_code', on_delete=django.db.models.deletion.CASCADE, to='itemmas.ItemInfo', verbose_name='商品コード')),
                ('store_id', models.ForeignKey(db_column='store_id', on_delete=django.db.models.deletion.CASCADE, to='storemas.StoreInfo', verbose_name='店舗ID')),
            ],
            options={
                'verbose_name_plural': '売上情報モデル',
            },
        ),
    ]
