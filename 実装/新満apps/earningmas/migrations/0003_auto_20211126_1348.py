# Generated by Django 2.2.2 on 2021-11-26 04:48

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('storemas', '0001_initial'),
        ('earningmas', '0002_earninginfo_employee_id'),
        ('itemmas', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='earninginfo',
            name='item_code',
            field=models.ForeignKey(db_column='item_code', on_delete=django.db.models.deletion.CASCADE, to='itemmas.ItemInfo', verbose_name='商品コード'),
        ),
        migrations.AddField(
            model_name='earninginfo',
            name='store_id',
            field=models.ForeignKey(db_column='store_id', on_delete=django.db.models.deletion.CASCADE, to='storemas.StoreInfo', verbose_name='店舗ID'),
        ),
    ]
