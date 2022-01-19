# 自作フィルタを定義するためにtemplateをインポート
import string
from unittest import result
from django import template
import math


register = template.Library()

@register.filter(name="string_link")
def string_link(value, args):
    return value - args