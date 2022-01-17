"""earningmas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView,ListView
from .models import EarningInfo
from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

class S0401View(ListView):
    """S0401View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    def mylist(request):
        EarningInfos = EarningInfo.objects.all()
        #EarningInfos = EarningInfo.objects.order_by('id')
        paginator = Paginator(EarningInfos, 12)
        page = request.GET.get('page', 1)
        try:
            earningnfo = paginator.page(page)
        except PageNotAnInteger:
            earningnfo = paginator.page(1)
        except EmptyPage:
            earningnfo = paginator.page(1)
        context = {'earningnfo': earningnfo}
        return render(request, 'mas_earning_list.html', context)

class S0402View(TemplateView):
    """S0402View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_earning_detail.html"

class S0403View(TemplateView):
    """Ctitle

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_earning_edit.html"


