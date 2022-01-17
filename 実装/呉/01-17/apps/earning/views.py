"""earning.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views.generic import TemplateView, ListView
from earningmas.models import EarningInfo

from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


class S1101View(ListView):
    def mylist(request):
        EarningInfos = EarningInfo.objects.all()
        paginator = Paginator(EarningInfos, 3)
        page = request.GET.get('page', 1)
        try:
            earninginfo = paginator.page(page)
        except PageNotAnInteger:
            earninginfo = paginator.page(1)
        except EmptyPage:
            earninginfo = paginator.page(1)
        context = {'earninginfo': earninginfo}
        return render(request, 'earning_list.html', context)


class S1102View(TemplateView):
    """S1102View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "earning_register.html"


class S1103View(TemplateView):
    """S1103View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "earning_detail.html"


class S1104View(TemplateView):
    """S1104View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "earning_edit.html"
