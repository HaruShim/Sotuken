import csv
import datetime
import os

from django.conf import settings
from django.core.management.base import BaseCommand

#*変更点1
from ...models import CustomUser


class Command(BaseCommand):
#*変更点2
    help = "Backup CustomUser data"

    def handle(self, *args, **options):
        # 保存ディレクトリのファイルリストを取得してソート
        #*変更点3
        full_files = os.listdir(settings.BACKUP_PATH + 'employeeinfo_w/')
        full_files.sort()
        # 最新(今週)のフルバックアップをオープンしてリストに代入
        #*変更点4
        with open(settings.BACKUP_PATH + 'employeeinfo_w/' + full_files[-1], "r") as f:
            beforelists = f.read().splitlines()

        # 実行時のYYYYMMDDを取得
        date = datetime.date.today().strftime("%Y%m%d")

        # 保存ファイルの相対パス
        #*変更点5
        file_path = settings.BACKUP_PATH + 'employeeinfo_d/' + 'employeeinfo_' + date + '_diff.csv'

        # 保存ディレクトリが存在しなければ作成
        #*変更点6
        os.makedirs(settings.BACKUP_PATH + 'employeeinfo_d/', exist_ok=True)

        # バックアップファイルの作成
        with open(file_path, 'w') as file:
            writer = csv.writer(file)

            # ヘッダーの書き込み
            #*変更点7
            header = [field.name for field in CustomUser._meta.fields]
            writer.writerow(header)

            # StoreInfoテーブルの全データを取得
            #*変更点8
            customusers = CustomUser.objects.all()

            # データ部分の書き込み
            #*変更点9
            for cu in customusers:
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
        # 一度書き込んだ現在(今日)のデータリストを読み込んでリストに代入
        with open(file_path, 'r') as file:
            nowlists = file.read().splitlines()
        
        # 現在(今週)のフルバックアップと今日の差分をリストにして代入
        diff = list(filter(lambda x: x not in beforelists, nowlists))  

        # バックアップファイルに上書き
        with open(file_path, 'w') as file:
            writer = csv.writer(file)

            # ヘッダーの書き込み
            #*変更点10
            header = [field.name for field in CustomUser._meta.fields]
            writer.writerow(header)

            # データ部分の差分を書き込み
            for check in diff:
                l = check.split(',')
                #*変更点11
                writer.writerow(
                    [l[0],str(l[1]),l[2],l[3],str(l[4]),str(l[5]),str(l[6]),str(l[7]),])

        # 保存ディレクトリのファイルリストを取得
        files = os.listdir(settings.BACKUP_PATH_STOREINFO_D)
        # ファイルが設定数以上あったら一番古いファイルを削除
        if len(files) >= settings.NUM_SAVED_DIFFBACKUP:
            files.sort()
            #*変更点12
            print(settings.BACKUP_PATH + 'employeeinfo_d/' + files[0],'このファイルを削除しました')
            os.remove(settings.BACKUP_PATH + 'employeeinfo_d/' + files[0])
            
            #*最後に変更点のコメント消して終わり
