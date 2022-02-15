import csv
import datetime
import os

from django.conf import settings
from django.core.management.base import BaseCommand

from ...models import CpuBench


class Command(BaseCommand):
    help = "Backup CpuBench data"

    def handle(self, *args, **options):
        # 保存ディレクトリのファイルリストを取得してソート
        full_files = os.listdir(settings.BACKUP_PATH + 'cpubench_w/')
        full_files.sort()
        # 最新(今週)のフルバックアップをオープンしてリストに代入
        with open(settings.BACKUP_PATH + 'cpubench_w/' + full_files[-1], "r") as f:
            beforelists = f.read().splitlines()

        # 実行時のYYYYMMDDを取得
        date = datetime.date.today().strftime("%Y%m%d")

        # 保存ファイルの相対パス
        file_path = settings.BACKUP_PATH + 'cpubench_d/' + 'cpubench_' + date + '_diff.csv'

        # 保存ディレクトリが存在しなければ作成
        os.makedirs(settings.BACKUP_PATH + 'cpubench_d/', exist_ok=True)

        # バックアップファイルの作成
        with open(file_path, 'w') as file:
            writer = csv.writer(file)

            # ヘッダーの書き込み
            header = [field.name for field in CpuBench._meta.fields]
            writer.writerow(header)

            # StoreInfoテーブルの全データを取得
            customusers = CpuBench.objects.all()

            # データ部分の書き込み
            #*変更点9
            for cu in customusers:
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
                    str(cu,updated_at),
                    ])
        # 一度書き込んだ現在(今日)のデータリストを読み込んでリストに代入
        with open(file_path, 'r') as file:
            nowlists = file.read().splitlines()
        
        # 現在(今週)のフルバックアップと今日の差分をリストにして代入
        diff = list(filter(lambda x: x not in beforelists, nowlists))  

        # バックアップファイルに上書き
        with open(file_path, 'w') as file:
            writer = csv.writer(file)

            # ヘッダーの書き込み
            header = [field.name for field in CpuBench._meta.fields]
            writer.writerow(header)

            # データ部分の差分を書き込み
            for check in diff:
                l = check.split(',')
                #*変更点11
                writer.writerow(
                    [str(l[0]),l[1],str(l[2]),str(l[3]),str(l[4]),l[5],l[6],str(l[7]),l[8],str(l[9]),str(l[10]),])

        # 保存ディレクトリのファイルリストを取得
        files = os.listdir(settings.BACKUP_PATH_STOREINFO_D)
        # ファイルが設定数以上あったら一番古いファイルを削除
        if len(files) >= settings.NUM_SAVED_DIFFBACKUP:
            files.sort()
            print(settings.BACKUP_PATH + 'cpubench_d/' + files[0],'このファイルを削除しました')
            os.remove(settings.BACKUP_PATH + 'cpubench_d/' + files[0])
            
            #*最後に変更点のコメント消して終わり
