ItemInfoimport csv
import datetime
import os

from django.conf import settings
from django.core.management.base import BaseCommand
from ...models import ItemInfo


class Command(BaseCommand):
    help = "Full Backup ItemInfo data"

    def handle(self, *args, **options):
        # 実行時のYYYYMMDDを取得
        date = datetime.date.today().strftime("%Y%m%d")

        # 保存ファイルの相対パス
        file_path = settings.BACKUP_PATH + 'itemInfo_w/' + 'itemInfo_' + date + '_full.csv'

        # 保存ディレクトリが存在しなければ作成
        os.makedirs(settings.BACKUP_PATH + 'itemInfo_w/', exist_ok=True)

        # バックアップファイルの作成
        with open(file_path, 'w') as file:
            writer = csv.writer(file)

            # ヘッダーの書き込み
            header = [field.name for field in ItemInfo._meta.fields]
            writer.writerow(header)

            # StoreInfoテーブルの全データを取得
            customuser = ItemInfo.objects.all()

            # データ部分の書き込み
            for cu in customuser:
                writer.writerow(
                    [cu.item_code,
                    str(cu.store_id),
                    cu.model_number,
                    cu.category,
                    cu.manufacturer_name,
                    cu.item_status,
                    str(cu.purchase_price),
                    str(cu.item_image),
                    cu.remarks,
                    str(cu.reated_at),
                    str(cu.updated_at),
                    ])

        # 保存ディレクトリのファイルリストを取得
        files = os.listdir(settings.BACKUP_PATH + 'itemInfo_w/')
        # ファイルが設定数以上あったら一番古いファイルを削除
        if len(files) >= settings.NUM_SAVED_FULLBACKUP:
            files.sort()
            print(settings.BACKUP_PATH + 'itemInfo_w/' + files[0],'このファイルを削除しました')
            os.remove(settings.BACKUP_PATH + 'itemInfo_w/' + files[0])
