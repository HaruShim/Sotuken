# Generated by Django 2.2.2 on 2021-12-01 14:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('itemmas', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='iteminfo',
            name='item_status',
            field=models.SmallIntegerField(choices=[(0, '販売中'), (1, '販売済み'), (2, '修理中'), (3, '取置')], verbose_name='商品状態'),
        ),
    ]
