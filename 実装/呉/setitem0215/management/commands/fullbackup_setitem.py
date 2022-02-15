import csv
import datetime
import os

from django.conf import settings
from django.core.management.base import BaseCommand

from ...models import StoreInfo


class Command(BaseCommand):
    help = "Full Backup StoreInfo data"

    def handle(self, *args, **options):
        # 実行時のYYYYMMDDを取得
        date = datetime.date.today().strftime("%Y%m%d")

        # 保存ファイルの相対パス
        file_path = settings.BACKUP_PATH_STOREINFO_W + 'storeinfo_' + date + '_full.csv'

        # 保存ディレクトリが存在しなければ作成
        os.makedirs(settings.BACKUP_PATH_STOREINFO_W, exist_ok=True)

        # バックアップファイルの作成
        with open(file_path, 'w') as file:
            writer = csv.writer(file)

            # ヘッダーの書き込み
            header = [field.name for field in StoreInfo._meta.fields]
            writer.writerow(header)

            # StoreInfoテーブルの全データを取得
            storeinfos = StoreInfo.objects.all()

            # データ部分の書き込み
            for si in storeinfos:
                writer.writerow(
                    [str(si.id),
                    str(si.place_category),
                    si.store_name,
                    si.address,
                    si.tel,
                    str(si.invalid_flg),
                    str(si.created_at),
                    str(si.updated_at),
                    ])

        # 保存ディレクトリのファイルリストを取得
        files = os.listdir(settings.BACKUP_PATH_STOREINFO_W)
        # ファイルが設定数以上あったら一番古いファイルを削除
        if len(files) >= settings.NUM_SAVED_FULLBACKUP:
            files.sort()
            print(settings.BACKUP_PATH_STOREINFO_W + files[0],'このファイルを削除しました')
            os.remove(settings.BACKUP_PATH_STOREINFO_W + files[0])
