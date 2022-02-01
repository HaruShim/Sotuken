# 自作フィルタを定義するためにtemplateをインポート
import string
from unittest import result
from django import template
import math


register = template.Library()

@register.filter(name="grass_profit")
def grass_profit(value, args):
    result = (value - args)
    return result

@register.filter(name="grass_profit_margin")
def grass_profit_margin(value, args):
    result = grass_profit(value, args)
    result2 = math.floor((result / value) * 100)
    return result2

# register.filter(name="multipliy")
# def multipliy(value, args):
#     result = math.floor(value * args)
#     return result

@register.simple_tag
def multiply2(value1, value2):
    return value1 * value2