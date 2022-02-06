"""earning.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""
from urllib import request
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from django.urls import reverse_lazy
from django.shortcuts import render
# モデル
from django.db import models
from earningmas.models import EarningInfo
from itemmas.models import ItemInfo
from storemas.models import StoreInfo
from accounts.models import CustomUser
from django.contrib.auth.models import Group
# フォーム
from .forms import S1102Form,S1104Form
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
# 01/28
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required

class S1101View(ListView):
    """S1101View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name ():
    """

    @login_required
    def mylist(request):
        template_name = 'earning_list.html'
        EarningInfos = EarningInfo.objects.order_by('-id')
        paginator = Paginator(EarningInfos, 12)
        forms = S1102Form
        page = request.GET.get('page', 1)
        object_list = EarningInfo.objects.all().order_by('-id')

        try:
            earninginfo = paginator.page(page)
        except PageNotAnInteger:
            earninginfo = paginator.page(1)
        except EmptyPage:
            earninginfo = paginator.page(1)


        # POSTメソッドがTrueの時
        if request.method == 'POST':
            # POSTメソッドの内にボタンnameがcreate_dataが含まれている時
            if 'create_data' in request.POST:
                # 店舗ID取得
                storeid,created = StoreInfo.objects.get_or_create(
                    id = request.POST['store_id'],
                    defaults={'id':request.POST['store_id']}
                )
                # 商品コード取得
                iteminfo,created = ItemInfo.objects.get_or_create(
                    id = request.POST['item_code'],
                    defaults={'id':request.POST['item_code']}
                )
                # 従業員ID取得
                customUser,created = CustomUser.objects.get_or_create(
                    id = request.POST['employee_id'],
                    defaults={'id':request.POST['employee_id']}
                )
                # 売上オブジェクト生成・更新
                earningif,created = EarningInfo.objects.update_or_create(
                    employee_id = request.user,
                    defaults={'item_code':iteminfo,'store_id':storeid,'employee_id':customUser,'selling_price':request.POST['selling_price']}
                )
        context = {'earninginfo':earninginfo,'forms':forms,'object_list':object_list}
        return render(request, template_name, context)



class S1102View(LoginRequiredMixin, CreateView, ListView):
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
        # formで入力された商品コードと一致するレコードをItemInfoから取得
        record = ItemInfo.objects.get(id=item.item_code)
        # 上記の商品の商品状態を1(販売済み)に変更
        record.item_status = 1
        # EarningInfoのデータを保存
        item.save()
        # ItemInfoのデータを保存
        record.save()
        return super().form_valid(form)




class S1103View(LoginRequiredMixin, TemplateView):
    """S1103View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "earning_detail.html"
    
class S1104View(LoginRequiredMixin, UpdateView):
    """S1104View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """

    def sample(request,pk):
        print("sampleが実行されました")
        form = S1104Form
        template_name = "earning_edit.html"
        object_a = EarningInfo.objects.get(pk=pk)
        object_b = EarningInfo.objects.get(pk=pk)
        object_list =EarningInfo.objects.all().order_by('-id')
        context = {'object_a': object_a,'object_b': object_b,'form':form,'object_list':object_list }


        # POSTメソッドがTrue
        if request.method == 'POST':
            # 変更ボタン押下　→　DBに保存せず、編集画面に留まる
            if 'test_data' in request.POST:
                # object_afterを入力値に更新
                object_a.selling_price = request.POST['selling_price']
            # 更新(確定)ボタン押下　→　DBに保存後、一覧に戻る
            elif 'create_data' in request.POST:
                template_name = "earning_list.html"
                object_a.selling_price = request.POST['selling_price']
                object_a.save()
                context = {'object_list':object_list,'form':form}
                return render(request, template_name, context)
        return render(request, template_name, context)



