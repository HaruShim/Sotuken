import csv
import datetime
import os

from django.conf import settings
from django.core.management.base import BaseCommand

from ...models import SetItems


class Command(BaseCommand):
    help = "Full Backup SetItems data"

    def handle(self, *args, **options):
        # 実行時のYYYYMMDDを取得
        date = datetime.date.today().strftime("%Y%m%d")

        # 保存ファイルの相対パス
        file_path = settings.BACKUP_PATH+'setitems_w/' + 'setitems_' + date + '_full.csv'

        # 保存ディレクトリが存在しなければ作成
        os.makedirs(settings.BACKUP_PATH+'setitems_w/', exist_ok=True)

        # バックアップファイルの作成
        with open(file_path, 'w') as file:
            writer = csv.writer(file)

            # ヘッダーの書き込み
            header = [field.name for field in SetItems._meta.fields]
            writer.writerow(header)

            # StoreInfoテーブルの全データを取得
            setitemss = SetItems.objects.all()

            # データ部分の書き込み
            for st in setitemss:
                writer.writerow(
                    [str(st.id),
                     str(st.store_id),
                     st.set_name,
                     st.notepc,
                     st.desktop,
                     st.monitor,
                     st.memory,
                     st.hdd,
                     st.ssd,
                     st.office,
                     st.others,
                     ])

        # 保存ディレクトリのファイルリストを取得
        files = os.listdir(settings.BACKUP_PATH+'setitems_d')
        # ファイルが設定数以上あったら一番古いファイルを削除
        if len(files) >= settings.NUM_SAVED_FULLBACKUP:
            files.sort()
            print(settings.BACKUP_PATH+'setitems_d/' +
                  files[0], 'このファイルを削除しました')
            os.remove(settings.BACKUP_PATH+'setitems_d/' + files[0])
