import csv
import datetime
import os

from django.conf import settings
from django.core.management.base import BaseCommand

from ...models import Bottleneck


class Command(BaseCommand):
    help = "Backup Bottleneck data"

    def handle(self, *args, **options):
        # 保存ディレクトリのファイルリストを取得してソート
        full_files = os.listdir(settings.BACKUP_PATH+'bottleneck_w/')
        full_files.sort()
        # 最新(今週)のフルバックアップをオープンしてリストに代入
        with open(settings.BACKUP_PATH+'bottleneck_w/' + full_files[-1], "r") as f:
            beforelists = f.read().splitlines()

        # 実行時のYYYYMMDDを取得
        date = datetime.date.today().strftime("%Y%m%d")

        # 保存ファイルの相対パス
        file_path = settings.BACKUP_PATH+'bottleneck_d/' + \
            'bottleneck_' + date + '_diff.csv'

        # 保存ディレクトリが存在しなければ作成
        os.makedirs(settings.BACKUP_PATH+'bottleneck_d/', exist_ok=True)

        # バックアップファイルの作成
        with open(file_path, 'w') as file:
            writer = csv.writer(file)

            # ヘッダーの書き込み
            header = [field.name for field in Bottleneck._meta.fields]
            writer.writerow(header)

            # StoreInfoテーブルの全データを取得
            bottlenecks = Bottleneck.objects.all()

            # データ部分の書き込み
            for sf in bottlenecks:
                writer.writerow(
                    [str(sf.id),
                     sf.cpu_name,
                     sf.gpu_name,
                     sf.balance,
                     sf.wqhd,
                     sf.four_k,
                     sf.game_appropriate,
                     sf.game_delivery,
                     sf.video_editing,
                     sf.encode,
                     sf.created_at,
                     sf.updated_at,
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
            header = [field.name for field in Bottleneck._meta.fields]
            writer.writerow(header)

            # データ部分の差分を書き込み
            for check in diff:
                l = check.split(',')
                writer.writerow(
                    [str(l[0]), l[1], l[2], l[3], l[4], l[5], l[6], l[7], l[8], l[9], l[10], l[11], ])

        # 保存ディレクトリのファイルリストを取得
        files = os.listdir(settings.BACKUP_PATH+'bottleneck_d')
        # ファイルが設定数以上あったら一番古いファイルを削除
        if len(files) >= settings.NUM_SAVED_DIFFBACKUP:
            files.sort()
            print(settings.BACKUP_PATH+'bottleneck_d/' +
                  files[0], 'このファイルを削除しました')
            os.remove(settings.BACKUP_PATH+'bottleneck_d/' + files[0])
