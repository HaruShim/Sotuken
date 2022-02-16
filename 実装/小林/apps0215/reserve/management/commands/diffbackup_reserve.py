import csv
import datetime
import os

from django.conf import settings
from django.core.management.base import BaseCommand


from ...models import Reserve


class Command(BaseCommand):
    help = "Backup Reserve data"

    def handle(self, *args, **options):
        # 保存ディレクトリのファイルリストを取得してソート
        full_files = os.listdir(settings.BACKUP_PATH + 'reserve_w/')
        full_files.sort()
        # 最新(今週)のフルバックアップをオープンしてリストに代入
        with open(settings.BACKUP_PATH + 'reserve_w/' + full_files[-1], "r") as f:
            beforelists = f.read().splitlines()

        # 実行時のYYYYMMDDを取得
        date = datetime.date.today().strftime("%Y%m%d")

        # 保存ファイルの相対パス
        file_path = settings.BACKUP_PATH + 'reserve_d/' + 'reserve_' + date + '_diff.csv'

        # 保存ディレクトリが存在しなければ作成
        os.makedirs(settings.BACKUP_PATH + 'reserve_d/', exist_ok=True)

        # バックアップファイルの作成
        with open(file_path, 'w') as file:
            writer = csv.writer(file)

            # ヘッダーの書き込み
            header = [field.name for field in Reserve._meta.fields]
            writer.writerow(header)

            # StoreInfoテーブルの全データを取得
            reserves = Reserve.objects.all()

            # データ部分の書き込み
            for cu in reserves:
                writer.writerow(
                    [str(cu.reserve_id),
                    str(cu.item_code),
                    str(cu.store_id),
                    str(cu.reserver_name),
                    str(cu.reserver_tel),
                    str(cu.reserve_at),
                    str(cu.updated_at),
                    str(cu.invalid_flg),
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
            header = [field.name for field in Reserve._meta.fields]
            writer.writerow(header)

            # データ部分の差分を書き込み
            for check in diff:
                l = check.split(',')
                writer.writerow(
                    [str(l[0]),l[1],str(l[2]),str(l[3]),str(l[4]),str(l[5]),str(l[6]),l[7],])

        # 保存ディレクトリのファイルリストを取得
        files = os.listdir(settings.BACKUP_PATH + 'reserve_d')
        # ファイルが設定数以上あったら一番古いファイルを削除
        if len(files) >= settings.NUM_SAVED_DIFFBACKUP:
            files.sort()
            print(settings.BACKUP_PATH + 'reserve_d/' + files[0],'このファイルを削除しました')
            os.remove(settings.BACKUP_PATH + 'reserve_d/' + files[0])
            
