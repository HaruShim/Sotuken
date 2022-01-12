# from django.db import models
# from django.contrib.auth.models import AbstractUser
# from django.contrib.auth.models import PermissionsMixin, UserManager
from employeemas.models import EmployeeInfo

# class CustomUserManager(UserManager):
#     """ユーザーマネージャー"""
#     use_in_migrations = True

#     def create_superuser(self, employee_id, password, **extra_fields):
#         extra_fields.setdefault('is_staff', True)
#         extra_fields.setdefault('is_superuser', True)
#         if extra_fields.get('is_staff') is not True:
#             raise ValueError('Superuser must have is_staff=True.')
#         if extra_fields.get('is_superuser') is not True:
#             raise ValueError('Superuser must have is_superuser=True.')
#         return self._create_user(employee_id, password, **extra_fields)

# class CustomUser(AbstractUser):

#     REQUIRED_FIELDS = ["employee_id","email"]
#     """拡張ユーザーモデル"""

#     class Meta(AbstractUser.Meta):
#         # e_status = (
#         #     ('0','非正規社員'),
#         #     ('1','正規社員'),
#         #     ('2','管理者'),
#         # )
#         # db_table = 'custom_user'
#         verbose_name_plural = 'EmployeeInfo'
#         # AutoField 

        #  color = models.ForeignKey(Color, on_delete=models.CASCADE)
    # employee_id = models.OneToOneField(EmployeeInfo,db_column="employee_id",primary_key=True,verbose_name='従業員ID',on_delete = models.PROTECT,editable=False)
#         # id = models.CharField(db_column="employee_id",default=uuid.uuid4,verbose_name='従業員ID',primary_key=True, max_length=13,unique=True,editable=False)
#         # is_staff = models.BooleanField(
#         #             _('staff status'),
#         #             db_column="employee_id",
#         #             default=False,
#         #             help_text=_('Designates whether the user can log into this admin site.'),
#         #         )
#         # is_active   = models.BooleanField(
#         #             _('active'),
#         #             default=True,
#         #             help_text=_(
#         #                 'Designates whether this user should be treated as active. '
#         #                 'Unselect this instead of deleting accounts.'
#         #             ),
#         #         )
#         # store_id = models.IntegerField(verbose_name='店舗ID')
#         # employment_status = models.CharField(verbose_name='雇用形態',choices=e_status)
#         # name = models.CharField(verbose_name='氏名', max_length=30)
#         # ruby_name = models.CharField(verbose_name='氏名(カナ)', max_length=30)
#         # tel_num = models.CharField(verbose_name='電話番号', max_length=30)
#         # gender = models.CharField(verbose_name='氏名(カナ)', max_length=30)
#         # birthday = models.DateField(verbose_name='生年月日')
#         # invalid_flg = models.BooleanField(verbose_name='生年月日',default=True)
#         # created_at = models.DateTimeField(verbose_name='作成日時', auto_now_add=True)
#         # updated_at = models.DateTimeField(verbose_name='更新日時', auto_now=True)
