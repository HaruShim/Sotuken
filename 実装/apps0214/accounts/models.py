from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.validators import RegexValidator
from storemas.models import StoreInfo
from django.db.models.signals import pre_save
from django.db import transaction
from django.dispatch import receiver
from django.contrib.auth.models import Group

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

    username = models.CharField('従業員番号',validators=[alphanumeric],max_length=8,unique=True,null=True,blank=True)
    employment_status = models.SmallIntegerField(verbose_name='雇用形態',choices=estachoice,default=3)
    name = models.CharField(verbose_name='氏名',max_length=30,null=True,blank=True)
    ruby_name = models.CharField(verbose_name='氏名(カナ)', max_length=30,null=True,blank=True)
    tel_num = models.CharField(verbose_name='電話番号', max_length=13,null=True,blank=True)
    gender = models.SmallIntegerField(verbose_name='性別',choices=genderchoice,null=True,default=None)
    birthday = models.DateField(verbose_name='生年月日',null=True,blank=True)
    invalid_flg = models.BooleanField(verbose_name='無効フラグ',null=True,blank=True,default=False)
    store_id = models.ForeignKey(StoreInfo,verbose_name='店舗名',db_column='store_id',on_delete=models.CASCADE,null=True,blank=True)

    def __str__(self):
        return str(self.name)

@receiver(models.signals.post_save, sender=CustomUser)
def post_save_user_signal_handler(sender, instance, created, **kwargs):
    if created:
        print('アカウント作成')
        # print('1:',instance.__class__.__name__)
        # print('2:',instance)
        # print('3:',instance.employment_status)
        # print(type(instance.employment_status))
        # print('4:',employment_status)
        if instance.employment_status == 0:
            group = Group.objects.get(name='管理者')
            print('管理者アカウントを作成',group)
        elif instance.employment_status == 1:
            group = Group.objects.get(name='店長')
            print('店長アカウントを作成',group)
        else:
            group = Group.objects.get(name='従業員')
            print('従業員アカウントを作成',group)
        instance.groups.add(group)
        instance.save()