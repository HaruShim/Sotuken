import csv
import datetime
import os

from django.conf import settings
from django.core.management.base import BaseCommand

from ...models import WorkStatus


class Command(BaseCommand):
    help = "Full Backup WorkStatus data"

    def handle(self, *args, **options):
        os.makedirs(settings.BACKUP_PATH+'workstatus_w/', exist_ok=True)
        # 実行時のYYYYMMDDを取得
        date = datetime.date.today().strftime("%Y%m%d")

        # 保存ファイルの相対パス
        file_path = settings.BACKUP_PATH+'workstatus_w/' + \
            'workstatus_' + date + '_full.csv'

        # 保存ディレクトリが存在しなければ作成
        os.makedirs(settings.BACKUP_PATH+'workstatus_w/', exist_ok=True)

        # バックアップファイルの作成
        with open(file_path, 'w') as file:
            writer = csv.writer(file)

            # ヘッダーの書き込み
            header = [field.name for field in WorkStatus._meta.fields]
            writer.writerow(header)

            # StoreInfoテーブルの全データを取得
            workstatuss = WorkStatus.objects.all()

            # データ部分の書き込み
            for wo in workstatuss:
                writer.writerow(
                    [str(wo.id),
                     str(wo.employee),
                     str(wo.store_id),
                     ])

        # 保存ディレクトリのファイルリストを取得
        files = os.listdir(settings.BACKUP_PATH + 'workstatus_d')
        # ファイルが設定数以上あったら一番古いファイルを削除
        if len(files) >= settings.NUM_SAVED_FULLBACKUP:
            files.sort()
            print(settings.BACKUP_PATH + 'workstatus_d/' +
                  files[0], 'このファイルを削除しました')
            os.remove(settings.BACKUP_PATH + 'workstatus_d/' + files[0])
