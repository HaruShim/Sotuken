import csv
import datetime
import os

from django.conf import settings
from django.core.management.base import BaseCommand
#*変更点1
from ...models import CustomUser


class Command(BaseCommand):
#*変更点2
    help = "Full Backup CustomUser data"

    def handle(self, *args, **options):
        # 実行時のYYYYMMDDを取得
        date = datetime.date.today().strftime("%Y%m%d")

        # 保存ファイルの相対パス
        #*変更点3
        file_path = settings.BACKUP_PATH + 'employeeinfo_w/' + 'employeeinfo_' + date + '_full.csv'

        # 保存ディレクトリが存在しなければ作成
        #*変更点4
        os.makedirs(settings.BACKUP_PATH + 'employeeinfo_w/', exist_ok=True)

        # バックアップファイルの作成
        with open(file_path, 'w') as file:
            writer = csv.writer(file)

            # ヘッダーの書き込み
            #*変更点5
            header = [field.name for field in CustomUser._meta.fields]
            writer.writerow(header)

            # StoreInfoテーブルの全データを取得
            #*変更点6
            customuser = CustomUser.objects.all()

            # データ部分の書き込み
            #*変更点7
            for cu in customuser:
                writer.writerow(
                    [cu.username,
                    str(cu.employment_status),
                    cu.name,
                    cu.tel_num,
                    str(cu.gender),
                    str(cu.birthday),
                    str(cu.invalid_flg),
                    str(cu.store_id),
                    ])

        # 保存ディレクトリのファイルリストを取得
        #*変更点8
        files = os.listdir(settings.BACKUP_PATH + 'employeeinfo_w/')
        # ファイルが設定数以上あったら一番古いファイルを削除
        if len(files) >= settings.NUM_SAVED_FULLBACKUP:
            files.sort()
            #*変更点9
            print(settings.BACKUP_PATH + 'employeeinfo_w/' + files[0],'このファイルを削除しました')
            os.remove(settings.BACKUP_PATH + 'employeeinfo_w/' + files[0])
