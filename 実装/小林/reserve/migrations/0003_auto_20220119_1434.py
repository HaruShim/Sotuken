# Generated by Django 2.2.2 on 2022-01-19 05:34

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('reserve', '0002_auto_20220118_1216'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reserve',
            name='item_code',
            field=models.ForeignKey(db_column='item_code', limit_choices_to={'item_status': 0}, on_delete=django.db.models.deletion.CASCADE, to='itemmas.ItemInfo', verbose_name='商品コード'),
        ),
    ]
