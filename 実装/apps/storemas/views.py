"""storemas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from .models import StoreInfo
from .forms import S0202Form
from django.urls import reverse_lazy
from employeemas.models import EmployeeInfo
from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


class S0201View(ListView):
    """S0201View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    def mylist(request):
        StoreInfos = StoreInfo.objects.all()
        #StoreInfos = StoreInfo.objects.order_by('id')
        paginator = Paginator(StoreInfos, 4)
        page = request.GET.get('page', 1)
        try:
            storeInfo = paginator.page(page)
        except PageNotAnInteger:
            storeInfo = paginator.page(1)
        except EmptyPage:
            storeInfo = paginator.page(1)
        context = {'storeInfo': storeInfo}
        return render(request, 'mas_store_list.html', context)

    # def get_queryset(self):
    #     store_manager = EmployeeInfo.objects.filter(name = '竹井 一馬')
    #     return store_manager

class S0202View(CreateView):
    """S0202View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = StoreInfo
    template_name = "mas_store_register.html"
    form_class = S0202Form
    success_url = reverse_lazy('storemas:S02-01')

    def form_valid(self, form):
        item = form.save(commit=False)  # 保存処理など
        # messages.add_message(self.request, messages.SUCCESS, '登録しました！')  # メッセージ出力
        item.save()
        return super().form_valid(form)


class S0203View(DetailView,DeleteView):
    """S0203View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = StoreInfo
    template_name = "mas_store_detail.html"
    success_url = reverse_lazy('storemas:S02-01')

    def delete(self,request,*args,**kwargs):
        return super().delete(request,*args,**kwargs)

class S0204View(UpdateView):
    """S0204View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = StoreInfo
    template_name = "mas_store_edit.html"
    form_class = S0202Form

    def get_success_url(self):
        return reverse_lazy('storemas:S02-03',kwargs={'pk':self.kwargs['pk']})
    def form_valid(self,form):
        return super().form_valid(form)


