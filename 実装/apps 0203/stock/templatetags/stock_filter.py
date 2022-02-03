# カスタムフィルタ作成ファイル
from unicodedata import category
from unittest import result
from django import template
import math
from itemmas.models import ItemInfo

register = template.Library()

# テストフィルタ〇
@register.filter(name="A1") # デコレータをつける
def A1(value):
    return str(value) + "テスト"

# デスクトップの商品のみ表示
@register.filter(name="category_filter")
def category_filter(value):
    #      (0,'ノートPC'),
    #     (1,'デスクトップ'),
    #     (2,'モニター'),
    #     (3,'メモリ'),
    #     (4,'HDD'),
    #     (5,'SDD'),
    #     (6,'Office'),
    #     (7,'その他')
    notePC_list = list(ItemInfo.objects.filter(category = 0).values_list())
    decttop_list = list(ItemInfo.objects.filter(category = 1).values_list())
    monitor_list = list(ItemInfo.objects.filter(category = 2).values_list())
    memory_list = list(ItemInfo.objects.filter(category = 3).values_list())
    hdd_list = list(ItemInfo.objects.filter(category = 4).values_list())
    ssd_list = list(ItemInfo.objects.filter(category = 5).values_list())
    office_list = list(ItemInfo.objects.filter(category = 6).values_list())
    others_list = list(ItemInfo.objects.filter(category = 7).values_list())
    # テスト


    # result = type(list(notePC_list))
    # result = list(notePC_list)
    # return notePC_list[0][0]

    result = []
    # i = 0
    if value == 0:
        for i in range(len(notePC_list)):
            result.append(notePC_list[0][0])
        return result
    elif value == 1:
        for i in range(len(decttop_list)):
            result.append(decttop_list[i][0])
        return result
    elif value == 2:
        for i in range(len(monitor_list)):
            result.append(monitor_list[i][0])
        return result
    elif value == 3:
        for i in range(len(memory_list)):
            result.append(memory_list[i][0])
        return result
    elif value == 4:
        for i in range(len(hdd_list)):
            result.append(hdd_list[i][0])
        return result
    elif value == 5:
        for i in range(len(ssd_list)):
            result.append(ssd_list[i][0])
        return result
    elif value == 6:
        for i in range(len(office_list)):
            result.append(office_list[i][0])
        return result
    elif value == 7:
        for i in range(len(others_list)):
            result.append(others_list[i][0])
        return result



    # elif value == 1:
    #     for item in decttop_list:
    #         result = item
    #     return result
    # # テンプレ
    # for item in notePC_list:
    #     result = item
    # return result


# @register.filter(name="")
# def (value):
#     return
