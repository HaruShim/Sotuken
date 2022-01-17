"""reserve.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views.generic import TemplateView, ListView
from .models import Reserve
from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.views import generic


class S0901View(ListView):
    """Ctitle

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    def mylist(request):
        Reserves = Reserve.objects.all()
        paginator = Paginator(Reserves, 12)
        page = request.GET.get('page', 1)
        try:
            reserve = paginator.page(page)
        except PageNotAnInteger:
            reserve = paginator.page(1)
        except EmptyPage:
            reserve = paginator.page(1)
        context = {'Reserve': Reserve}
        return render(request, 'reserve_list.html', context)


class S0902View(TemplateView):
    """S0902View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "reserve_register.html"


class S0903View(TemplateView):
    """S0903View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "reserve_detail.html"


class S0904View(TemplateView):
    """S0904View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "reserve_edit.html"
