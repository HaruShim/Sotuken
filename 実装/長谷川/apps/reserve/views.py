"""reserve.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from .models import Reserve
from itemmas.models import ItemInfo
from .forms import ResStore_selecter
from django.db.models import Q
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
        form = ResStore_selecter
        q_item = request.GET.get('q_item') #商品コードを取得
        q_mnum = request.GET.get('q_mnum') #型番を取得
        q_selecter = request.GET.get('selecter') #店舗IDを取得
        q_reserver = request.GET.get('reserver') #予約者名を取得
        q_lowpur = request.GET.get('q_lowpur') #日にち(以降)を取得
        q_uppur = request.GET.get('q_uppur') # 日にち(以降)を取得
        if q_item:
            object_list = object_list.filter(Q(item_code__id__exact=q_item)) #商品コードでフィルタ(検索)
        if q_mnum:
            object_list = object_list.filter(Q(item_code__model_number__icontains=q_mnum)) #商品コードでフィルタ(検索)
        if q_selecter:
            object_list = object_list.filter(Q(store_id__id__icontains=q_selecter)) #商品コードでフィルタ(検索)
        if q_reserver:
            object_list = object_list.filter(Q(reserver_name__icontains=q_mnum)) #商品コードでフィルタ(検索)
        if q_uppur:
            object_list = object_list.filter(Q(reserve_at__lte=q_uppur)) #仕入価格上限
        if q_lowpur:
            object_list = object_list.filter(Q(reserve_at__gte=q_lowpur)) #仕入価格下限
        
        paginator = Paginator(object_list, 7)
        page = request.GET.get('page', 1)
        try:
            object_list = paginator.page(page)
        except PageNotAnInteger:
            object_list = paginator.page(1)
        except EmptyPage:
            object_list = paginator.page(1)
        context = {'object_list': object_list,'form':form}
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
