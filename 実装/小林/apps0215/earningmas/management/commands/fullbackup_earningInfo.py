import csv
import datetime
import os

from django.conf import settings
from django.core.management.base import BaseCommand
from ...models import EarningInfo


class Command(BaseCommand):
    help = "Full Backup EarningInfo data"

    def handle(self, *args, **options):
        # 実行時のYYYYMMDDを取得
        date = datetime.date.today().strftime("%Y%m%d")

        # 保存ファイルの相対パス
        file_path = settings.BACKUP_PATH + 'earningInfo_w/' + 'earningInfo_' + date + '_full.csv'

        # 保存ディレクトリが存在しなければ作成
        os.makedirs(settings.BACKUP_PATH + 'earningInfo_w/', exist_ok=True)

        # バックアップファイルの作成
        with open(file_path, 'w') as file:
            writer = csv.writer(file)

            # ヘッダーの書き込み
            header = [field.name for field in EarningInfo._meta.fields]
            writer.writerow(header)

            # StoreInfoテーブルの全データを取得
            customuser = EarningInfo.objects.all()

            # データ部分の書き込み
            #*変更点7
            for cu in customuser:
                writer.writerow(
                    [str(cu.earning_id),
                    cu.item_code,
                    str(cu.store_id),
                    str(cu.employee_id),
                    str(cu.selling_price),
                    str(cu.gross_profit),
                    cu.gross_profit_margin,
                    cu.sale_date,
                    str(cu.updated_at),
                    ])
        # 保存ディレクトリのファイルリストを取得
        files = os.listdir(settings.BACKUP_PATH + 'earningInfo_w/')
        # ファイルが設定数以上あったら一番古いファイルを削除
        if len(files) >= settings.NUM_SAVED_FULLBACKUP:
            files.sort()
            print(settings.BACKUP_PATH + 'earningInfo_w/' + files[0],'このファイルを削除しました')
            os.remove(settings.BACKUP_PATH + 'earningInfo_w/' + files[0])
