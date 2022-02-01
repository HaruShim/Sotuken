"""reserve.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from .models import Reserve
from itemmas.models import ItemInfo
from .forms import S0902Form,S0904Form
from django.urls import reverse_lazy
from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required



class S0901View(ListView):
    """Ctitle

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    @login_required
    def mylist(request):
        object_list = Reserve.objects.order_by('id')
        paginator = Paginator(object_list, 12)
        page = request.GET.get('page', 1)
        try:
            object_list = paginator.page(page)
        except PageNotAnInteger:
            object_list = paginator.page(1)
        except EmptyPage:
            object_list = paginator.page(1)
        context = {'object_list': object_list}
        return render(request, 'reserve_list.html', context)

class S0902View(LoginRequiredMixin, CreateView):
    """S0902View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = Reserve
    template_name = "reserve_register.html"
    form_class = S0902Form
    success_url = reverse_lazy('reserve:S09-01')

    def form_valid(self, form):
        item = form.save(commit=False)  # 保存処理など
        # formで入力された商品コードと一致するレコードをItemInfoから取得
        record = ItemInfo.objects.get(id=item.item_code)
        # 上記の商品の商品状態を3(取置)に変更
        record.item_status = 3
        # のデータを保存
        item.save()
        # ItemInfoのデータを保存
        record.save()
        return super().form_valid(form)

class S0903View(LoginRequiredMixin, DetailView,DeleteView):
    """S0903View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = Reserve
    template_name = "reserve_detail.html"
    success_url = reverse_lazy('reserve:S09-01')

    def delete(self,request,*args,**kwargs):
        return super().delete(request,*args,**kwargs)

class S0904View(LoginRequiredMixin, UpdateView):
    """S0904View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = Reserve
    template_name = "reserve_edit.html"
    form_class = S0904Form

    def get_success_url(self):
        return reverse_lazy('reserve:S09-03',kwargs={'pk':self.kwargs['pk']})
    def form_valid(self,form):
        return super().form_valid(form)
