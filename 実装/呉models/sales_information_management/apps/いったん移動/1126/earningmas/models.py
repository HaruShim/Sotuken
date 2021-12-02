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

class EarningInfo(models.Model):

    """EarningInfo

    売上情報モデル

    """
    id = models.AutoField(verbose_name='売上情報ID', db_column='earning_id', primary_key=True, editable=False)
    item_code = models.ForeignKey(ItemInfo,verbose_name='商品コード', on_delete=models.CASCADE)
    store_id = models.ForeignKey(StoreInfo, verbose_name='店舗ID', on_delete=models.CASCADE)
    employee_id = models.ForeignKey(EmployeeInfo, verbose_name='従業員ID', on_delete=models.CASCADE)
    selling_price = models.IntegerField(verbose_name='販売価格')
    gross_profit = models.IntegerField(verbose_name='粗利')
    gross_profit_margin = models.FloatField(verbose_name='粗利率')
    sale_date = models.DateTimeField(verbose_name='販売日', auto_now_add=True)
    updated_at = models.DateTimeField(verbose_name='最終更新日時', auto_now=True)

    class Meta:
        verbose_name_plural = '売上情報モデル'
