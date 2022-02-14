from django.db import models
from accounts.models import CustomUser
from storemas.models import StoreInfo
from django.urls import reverse


class WorkStatus(models.Model):

    store_id = models.ForeignKey(StoreInfo,db_column='store_id',verbose_name='店舗ID', on_delete=models.CASCADE)
    employee_id = models.ForeignKey(CustomUser,db_column='employee_id',verbose_name='従業員ID', on_delete=models.CASCADE)


    def __str__(self):
        return f"{str(self.employee_id)} {self.store_id}"
    class Meta:
        verbose_name_plural = '勤務状況一覧'


    # # 勤務店舗の情報に訂正する　未
    # def __str__(self):
    #     return self.name
    # def get_absolute_url(self):
    #     return reverse("employeemas:S01-05", kwargs={
    #         'pk': self.pk,
    #         'name': self.name,
    #         'employee_id': self.employee_id,
    #         'birthday': self.birthday,
    #         })
