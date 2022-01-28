"""earningmas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from .models import EarningInfo
from earning.forms import S1104Form
from django.urls import reverse_lazy
from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

class S0401View(ListView):
    """S0401View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    def mylist(request):
        template_name = "mas_earning_list.html"
        EarningInfos = EarningInfo.objects.order_by('id')
        paginator = Paginator(EarningInfos, 12)
        page = request.GET.get('page', 1)
        try:
            earninginfo = paginator.page(page)
        except PageNotAnInteger:
            earninginfo = paginator.page(1)
        except EmptyPage:
            earninginfo = paginator.page(1)
        context = {'earninginfo': earninginfo,}
        return render(request, template_name, context)

class S0402View(UpdateView):
    """S0402View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = EarningInfo
    template_name = "mas_earning_edit.html"
    form_class = S1104Form

    def get_success_url(self):
        return reverse_lazy('earning:S11-01')
    def form_valid(self,form):
        return super().form_valid(form)



