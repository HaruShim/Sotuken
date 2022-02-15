# Generated by Django 2.2.2 on 2022-01-19 00:13

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0002_auto_20220119_0224'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customuser',
            name='store_id',
            field=models.ForeignKey(blank=True, db_column='store_id', null=True, on_delete=django.db.models.deletion.CASCADE, to='storemas.StoreInfo', verbose_name='店舗名'),
        ),
    ]
