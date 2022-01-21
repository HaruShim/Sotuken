from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.validators import RegexValidator

alphanumeric = RegexValidator(
    r'^[0-9]*$', 'Only num characters are allowed.')



# Create your models here.
class CustomUser(AbstractUser):
    """拡張ユーザーモデル"""
    class Meta(AbstractUser.Meta):
        db_table = 'custom_user'
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

    id = models.AutoField('従業員番号',primary_key=True, editable=False,validators=[alphanumeric])
    employment_status = models.SmallIntegerField(verbose_name='雇用形態',choices=estachoice)
    name = models.CharField(verbose_name='氏名',max_length=30)
    ruby_name = models.CharField(verbose_name='氏名(カナ)', max_length=30)
    tel_num = models.CharField(verbose_name='電話番号', max_length=13)
    gender = models.SmallIntegerField(verbose_name='性別',choices=genderchoice)
    birthday = models.DateField(verbose_name='生年月日')
    invalid_flg = models.BooleanField(verbose_name='無効フラグ')


    REQUIRED_FIELDS = ['id','employment_status','name','ruby_name','tel_num','birthday','invalid_flg','email','gender']