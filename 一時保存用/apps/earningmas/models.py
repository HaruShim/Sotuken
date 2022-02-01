"""earningmas.models.py

    新満の確認
    earning_idは主キーの書き方に直してください
    *gross_profit_marginは%だからintから修正してください
    *〇〇_idは基本外部(ForeignKey)キーに修正
    
    *マイグレーションができるか確認
    *CSVファイルからデータをコピーできる
    *新満の最終確認

"""

from django.db import models
# storemas から StoreInfoをインポート
from storemas.models import StoreInfo
# itemmasからItemInfoをインポート
from itemmas.models import ItemInfo
# employeemasからEmployeemasをインポート
from employeemas.models import EmployeeInfo

from accounts.models import CustomUser

class EarningInfo(models.Model):

    """EarningInfo

    売上情報モデル

    """
    id = models.AutoField(verbose_name='売上情報ID',db_column='earning_id', primary_key=True, editable=False)
    selling_price = models.IntegerField(verbose_name='販売価格')
    sale_date = models.DateField(verbose_name='販売日', auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='最終更新日時', auto_now=True)
    item_code = models.ForeignKey(ItemInfo,db_column='item_code',verbose_name='商品コード', on_delete=models.CASCADE,limit_choices_to={"item_status":0,})
    store_id = models.ForeignKey(StoreInfo,db_column='store_id',verbose_name='店舗ID', on_delete=models.CASCADE)
    # employee_id = models.ForeignKey(CustomUser,db_column='employee_id',verbose_name='従業員ID', on_delete=models.CASCADE)
    employee_id = models.ForeignKey(CustomUser,db_column='employee_id',verbose_name='従業員ID', on_delete=models.CASCADE)

    class Meta:
        verbose_name_plural = '売上情報モデル'
