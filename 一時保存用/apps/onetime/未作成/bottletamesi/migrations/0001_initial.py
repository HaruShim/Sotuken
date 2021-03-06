# Generated by Django 2.2.2 on 2021-11-19 03:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('tamesi', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Bottletamesi',
            fields=[
                ('id', models.AutoField(db_column='bottle_id', default='', editable=False, primary_key=True, serialize=False, verbose_name='ボトルネックID')),
                ('balance', models.SmallIntegerField(choices=[(0, '-'), (1, '✕'), (2, '△'), (3, '〇'), (4, '◎')], verbose_name='バランス')),
                ('product_nm', models.CharField(blank=True, max_length=60, null=True)),
                ('product_url', models.TextField(blank=True, null=True)),
                ('brand_cd', models.ForeignKey(db_column='brand_cd', null=True, on_delete=django.db.models.deletion.SET_NULL, to='tamesi.IgMstBrand')),
            ],
        ),
    ]
