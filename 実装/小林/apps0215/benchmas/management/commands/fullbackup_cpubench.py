import csv
import datetime
import os

from django.conf import settings
from django.core.management.base import BaseCommand
from ...models import CpuBench


class Command(BaseCommand):
    help = "Full Backup CpuBench data"

    def handle(self, *args, **options):
        # 実行時のYYYYMMDDを取得
        date = datetime.date.today().strftime("%Y%m%d")

        # 保存ファイルの相対パス
        file_path = settings.BACKUP_PATH + 'cpubench_w/' + 'cpubench_' + date + '_full.csv'

        # 保存ディレクトリが存在しなければ作成
        os.makedirs(settings.BACKUP_PATH + 'cpubench_w/', exist_ok=True)

        # バックアップファイルの作成
        with open(file_path, 'w') as file:
            writer = csv.writer(file)

            # ヘッダーの書き込み
            header = [field.name for field in CpuBench._meta.fields]
            writer.writerow(header)

            # StoreInfoテーブルの全データを取得
            cpubench = CpuBench.objects.all()

            # データ部分の書き込み
            for cu in cpubench:
                writer.writerow(
                    [str(cu.cpu_bench_id),
                    cu.cpu_name,
                    str(cu.passmark),
                    str(cu.thread),
                    str(cu.tdp),
                    cu.rated_clock,
                    cu.max_clock,
                    str(cu.list_price),
                    cu.cost_performance,
                    str(cu.created_at),
                    str(cu.updated_at),
                    ])

        # 保存ディレクトリのファイルリストを取得
        files = os.listdir(settings.BACKUP_PATH + 'cpubench_w/')
        # ファイルが設定数以上あったら一番古いファイルを削除
        if len(files) >= settings.NUM_SAVED_FULLBACKUP:
            files.sort()
            print(settings.BACKUP_PATH + 'cpubench_w/' + files[0],'このファイルを削除しました')
            os.remove(settings.BACKUP_PATH + 'cpubench_w/' + files[0])
