"""earningmas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from .models import EarningInfo
from storemas.models import StoreInfo
from itemmas.models import ItemInfo
from accounts.models import CustomUser
from django.db.models import Q
from .forms import S1102Form,EarningForm,S1104Form
from reserve.forms import ResStore_selecter
from django.http import JsonResponse
import json
# from earning.forms import S1104Form
from django.urls import reverse_lazy
from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

# 01/28
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required


# from .models import Municipality

class S0401View(ListView):
    """S0401View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    @login_required
    def mylist(request):
        template_name = 'mas_earning.html'
        object_list = EarningInfo.objects.order_by('-id')
        form = EarningForm
        q_item = request.GET.get('q_item')
        q_query = request.GET.get('query')
        q_s_employeeselecter = request.GET.get('s_employeeselectre')
        q_lowpur = request.GET.get('q_lowpur')
        q_uppur = request.GET.get('q_uppur')
        p_s_storeselecter = request.GET.get('s_storeselecter')
        if q_item:
            object_list = object_list.filter(Q(item_code__id__exact=q_item)) #商品コードでフィルタ(検索)
        if q_query:
            object_list = object_list.filter(Q(selling_price__icontains=q_query)|
                                            Q(item_code__purchase_price__icontains=q_query)) #商品コードでフィルタ(検索)
        if q_s_employeeselecter:
            object_list = object_list.filter(Q(employee_id__id__exact=q_s_employeeselecter)) #商品コードでフィルタ(検索)
        
        if q_lowpur:
            object_list = object_list.filter(Q(sale_date__gte=q_lowpur)) #商品コードでフィルタ(検索)
        if q_uppur:
            object_list = object_list.filter(Q(sale_date__lte=q_uppur)) #商品コードでフィルタ(検索)
        if p_s_storeselecter:
            object_list = object_list.filter(Q(store_id__id__exact=p_s_storeselecter)) #商品コードでフィルタ(検索)
        
        paginator = Paginator(object_list, 6)
        page = request.GET.get('page', 1)
        try:
            object_list = paginator.page(page)
        except PageNotAnInteger:
            object_list = paginator.page(1)
        except EmptyPage:
            object_list = paginator.page(1)

        # POSTメソッドが使われているとき
        if request.method == 'POST':
            # POSTメソッドの内にボタンnameがcreate_dataが含まれているとき
            if 'create_data' in request.POST:
                if ItemInfo.objects.filter(id = request.POST['s_itemselecter'],item_status=0).exists():
                    # 店舗ID取得
                    post_storeid,created = StoreInfo.objects.get_or_create(
                        id = request.POST['s_storeselecter'],
                        defaults={'id':request.POST['s_storeselecter']}
                    )
                    # 商品コード取得
                    post_iteminfo,created = ItemInfo.objects.get_or_create(
                        id = request.POST['s_itemselecter'],
                        defaults={'id':request.POST['s_itemselecter']}
                    )
                    # 従業員ID取得
                    post_eid,created = CustomUser.objects.get_or_create(
                        username = request.user.username,
                        defaults={'id':request.user}
                    )
                    # 売上オブジェクト生成・更新
                    earningif = EarningInfo.objects.create(
                        item_code = post_iteminfo,store_id=post_storeid,employee_id=post_eid,selling_price=request.POST['selling_price']
                    )
                    # 上記の商品の商品状態を1(販売済み)に変更
                    post_iteminfo.item_status = 1
                    post_iteminfo.save()
        context = {'form':form,'object_list':object_list,}
        return render(request, template_name, context)

def send_get_json(request):
    # print('send_get')
    objs = ItemInfo.objects.all()
    data = [dict(item_code=obj.id, model_number=obj.model_number,purchase_price=obj.purchase_price) for obj in objs]
    jsondata = json.dumps(data)
    # print(type(jsondata))
    return JsonResponse(jsondata, safe=False)




# class S0402View(LoginRequiredMixin, CreateView, ListView):
#     """S1102View

#     レスポンスをフォーム、モデル、テンプレートなどから生成する

#     Attributes:
#         name (): 

#     """
#     model = EarningInfo
#     template_name = "earning_register.html"
#     form_class = S1102Form
#     success_url = reverse_lazy('earning:S11-01')

#     def form_valid(self, form):
#         item = form.save(commit=False)  # 保存処理など
#         # formで入力された商品コードと一致するレコードをItemInfoから取得
#         record = ItemInfo.objects.get(id=item.item_code)
#         # 上記の商品の商品状態を1(販売済み)に変更
#         record.item_status = 1
#         # EarningInfoのデータを保存
#         item.save()
#         # ItemInfoのデータを保存
#         record.save()
#         return super().form_valid(form)




class S0403View(LoginRequiredMixin, TemplateView):
    """S1103View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "earning_detail.html"
    
class S0404View(LoginRequiredMixin, UpdateView):
    """S1104View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """

    def sample(request,pk):
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
                template_name = "mas_earning.html"
                object_a.selling_price = request.POST['selling_price']
                object_a.save()
                context = {'object_list':object_list,'form':form}
                return render(request, template_name, context)
        return render(request, template_name, context)



