"""setitem.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""
from hashlib import new
from operator import setitem
from django.db import models
from django.views.generic import ListView,DetailView,CreateView,DeleteView,UpdateView
from itemmas.models import ItemInfo
from django.db.models import Q
from .models import SetItems
from storemas.models import StoreInfo
from django.shortcuts import redirect, render
from .forms import S0801Form
from employeemas.forms import S0102Form
from storemas.forms import Store_selecterAP
from django.urls import reverse_lazy
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django import forms
from django.http import HttpResponse
# 02/04
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required

class S0801View(ListView):
    """S0701View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """

    @login_required
    def mylist(request):
        # レンダリングするテンプレートのディレクトリを指定
        template_name = "set_item_list.html"
        # name="query"から値を取得してq_wordに代入
        q_word = request.GET.get('query') 
        q_word2 = request.GET.get('others') 
        q_selecter = request.GET.get('store_selecter')
        form = S0102Form
        form1 = S0801Form
        # q_wordが値を取得している場合
        object_list = SetItems.objects.all().order_by('id')
        if q_selecter:
            object_list = object_list.filter(Q(store_id__exact=q_selecter))
        if q_word:
            object_list = object_list.filter(Q(set_name__icontains=q_word))
        if q_word2:
            object_list = object_list.filter(Q(notepc__exact=q_word2)|Q(desktop__exact=q_word2)|Q(monitor__exact=q_word2)|Q(memory__exact=q_word2)|Q(hdd__exact=q_word2)|Q(ssd__exact=q_word2)|Q(office__exact=q_word2)|Q(others__exact=q_word2))
        paginator = Paginator(object_list, 7)
        page = request.GET.get('page', 1)
        try:
            object_list = paginator.page(page)
        except PageNotAnInteger:
            object_list = paginator.page(1)
        except EmptyPage:
            object_list = paginator.page(1)
        # q_wordが未取得の場合
        context = {'object_list': object_list,'form':form,'form1':form1}
        # リクエスト元にtemplate_nameや、辞書型の変数を返す
        return render(request,template_name,context)

    def setregiedi(request):
        if request.method == 'POST':
            if 'button_1' in request.POST:
                p_setname = request.POST.get('set_name')
                p_store_id = request.POST.get('store_id')
                p_notepc = request.POST.get('notepc')
                p_desktop = request.POST.get('desktop')
                p_monitor = request.POST.get('monitor')
                p_memory = request.POST.get('memory')
                p_hdd = request.POST.get('hdd')
                p_ssd = request.POST.get('ssd')
                p_office = request.POST.get('office')
                p_others = request.POST.get('others')
                getstore_id,created = StoreInfo.objects.get_or_create(id = p_store_id,defaults={'id':p_store_id})
                setitems,created = SetItems.objects.update_or_create(
                    set_name = p_setname,
                    defaults={'store_id':getstore_id,'set_name':p_setname,'notepc':p_notepc,'desktop':p_desktop,'monitor':p_monitor,'memory':p_memory,'hdd':p_hdd,'ssd':p_ssd,'office':p_office,'others':p_others}
                    )
                return redirect('setitem:S08-01')

class S0802View(LoginRequiredMixin,UpdateView):
    """S0802View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = SetItems
    template_name = "set_item_detail.html"
    form_class = S0801Form

    def form_valid(self,form):
        return super().form_valid(form)
    def get_success_url(self):
        return reverse_lazy('setitem:S08-02',kwargs={'pk':self.kwargs['pk']})
    
    # DBからレコードを削除 02/05
    def del_record(request,pk):
        """ del_record

        DBから選択されたレコードを削除する
        Args:   request(WSGIRequest): HttpRequestオブジェクト
                pk(str):主キー(商品コード)
        Returns: redirect('itemmas:S03-01')
        Note: 例外処理未定義
        """
        # request.methodがPOSTかつrequest.POSTにdel_buttonが含まれる場合
        if request.method == 'POST':
            if 'del_button' in request.POST:
                # del_buttonがクリックされた場合の処理
                # 呼び出された情報のIDと一致する商品のレコードを取得
                delete_record = SetItems.objects.filter(id = pk)
                # レコードを削除
                delete_record.delete()
                # 処理を実行し、下記のURLを参照して遷移する
                return redirect('setitem:S08-01')





