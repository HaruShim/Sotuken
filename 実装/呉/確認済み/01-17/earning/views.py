"""earning.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView, ListView, DetailView, CreateView, DeleteView, UpdateView
from django.urls import reverse_lazy
from .forms import S1102Form, S1104Form
from django.shortcuts import render
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


class S1102View(CreateView, ListView):
    """S1102View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = EarningInfo
    template_name = "earning_register.html"
    form_class = S1102Form
    success_url = reverse_lazy('earning:S11-01')

    def form_valid(self, form):
        item = form.save(commit=False)  # 保存処理など
        # messages.add_message(self.request, messages.SUCCESS, '登録しました！')  # メッセージ出力
        item.save()
        return super().form_valid(form)


class S1103View(TemplateView):
    """S1103View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "earning_detail.html"


class S1104View(UpdateView):
    """S1104View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = EarningInfo
    template_name = "earning_edit.html"
    form_class = S1104Form

    def get_success_url(self):
        return reverse_lazy('earning:S11-01')

    def form_valid(self, form):
        return super().form_valid(form)
