# Generated by Django 2.2.2 on 2022-01-12 06:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('employeemas', '0001_initial'),
        ('earningmas', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='earninginfo',
            name='employee_id',
            field=models.ForeignKey(db_column='employee_id', on_delete=django.db.models.deletion.CASCADE, to='employeemas.EmployeeInfo', verbose_name='従業員ID'),
        ),
    ]
