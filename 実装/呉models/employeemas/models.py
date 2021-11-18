"""employeemas.models.py

Todo:

    *確認待ち
"""
from django.db import models


class Employeemas(models.Model):
    """従業員情報モデル
    """

    balancechoices = (
        (0, '-'),
        (1, '✕'),
        (2, '△'),
        (3, '〇'),
        (4, '◎'),
    )


    id = models.AutoField(verbose_name='従業員ID', db_column='employee_id', primary_key=True, editable=False)
    store_id = models.SmallIntegerField(verbose_name='店舗ID', choices=balancechoices)
    employment_status = models.CharField(verbose_name='雇用形態', max_length=5)
    name = models.CharField(verbose_name='氏名', max_length=30)
    ruby_name = models.CharField(verbose_name='氏名(カナ)', max_length=30)
    tel_num = models.CharField(verbose_name='電話番号', max_length=13)
    gender = models.SmallIntegerField(verbose_name='従業員ID', choices=balancechoices)
    birthday = models.TimeField(verbose_name='生年月日')
    invalid_flg = models.SmallIntegerField(
        verbose_name='無効フラグ', choices=balancechoices)
    created_at = models.DateTimeField(verbose_name='作成日時', auto_now_add=True)
    # 最終ログイン日時修正予定
    lastlogin_at = models.DateTimeField(verbose_name='最終ログイン日時', auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = '従業員情報モデル'
