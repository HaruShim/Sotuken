"""employeemas.models.py

Todo:

新満の確認

    *マイグレーションができるか確認
    *CSVファイルからデータをコピーできる
    *新満の最終確認

"""
from django.db import models
#storemas から storeinfo をインポート
from storemas.models import StoreInfo


class EmployeeInfo(models.Model):
    """従業員情報モデル

        EmployeeInfo

    """

    genderchoice = (
        (0,'男性'),
        (1,'女性'),
    )
    estachoice = (
        (0,'管理者'),
        (1,'店長'),
        (2,'正規社員'),
        (3,'非正規社員')
    )


    id = models.CharField(verbose_name='従業員ID',max_length=13,db_column='employee_id',primary_key=True,editable=False)
    employment_status = models.SmallIntegerField(verbose_name='雇用形態',choices=estachoice)
    name = models.CharField(verbose_name='氏名',max_length=30)
    ruby_name = models.CharField(verbose_name='氏名(カナ)', max_length=30)
    tel_num = models.CharField(verbose_name='電話番号', max_length=13)
    gender = models.SmallIntegerField(verbose_name='性別',choices=genderchoice)
    birthday = models.DateField(verbose_name='生年月日')
    invalid_flg = models.BooleanField(verbose_name='無効フラグ')
    created_at = models.DateTimeField(verbose_name='作成日時',auto_now_add=True)
    lastlogin_at = models.DateTimeField(verbose_name='最終ログイン日時',auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='更新日時',auto_now=True)
    store_id = models.ForeignKey(StoreInfo,verbose_name='店舗ID',db_column='store_id',on_delete=models.CASCADE,null=True)

    class Meta:
        verbose_name_plural = '従業員情報モデル'
