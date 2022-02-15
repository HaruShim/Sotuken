import csv
import datetime
import os

from django.conf import settings
from django.core.management.base import BaseCommand
from ...models import Bottleneck


class Command(BaseCommand):
    help = "Full Backup Bottleneck data"

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
            header = [field.name for field in Bottleneck._meta.fields]
            writer.writerow(header)

            # StoreInfoテーブルの全データを取得
            bottleneck = Bottleneck.objects.all()

            # データ部分の書き込み
            for cu in bottlenecks:
                writer.writerow(
                    [str(cu.bottleneck_id),
                    cu.cpu_name,
                    cu.gpu_name,
                    str(cu.balance),
                    str(cu.wqhd),
                    str(cu.four_k),
                    str(cu.game_appropriate),
                    str(cu.game_delivery),
                    str(cu.video_editing),
                    str(cu.encode),
                    str(cu.created_at),
                    str(cu.updated_at),
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
