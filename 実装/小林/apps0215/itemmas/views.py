"""itemmas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""
import json
from django.db import models
# from django.views.generic import ListView,TemplateView
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from django.urls import reverse_lazy
from .forms import S0301Form,S0302Form,S0304Form,S0305Form
from django.shortcuts import redirect,render
from django.db.models import Q
from .models import ItemInfo,ItemSpecification
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
# 01/28
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required

class S0301View(ListView):
    """S0301View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    context_object_name = 'ItemList'
    model = ItemInfo
    def mylist(request):
        form = S0301Form
        template_name = "mas_item_list.html"
        # template_name = 'earning_list.html'
        object_list = ItemInfo.objects.all().order_by('id')
        item_word= request.GET.get('q_item') #商品コードを受け取る
        num_word= request.GET.get('q_num') #型番
        category_word= request.GET.get('category') #カテゴリ
        store_word=request.GET.get('store_id') #在庫場所
        lowpur_word=request.GET.get('q_lowpur') #仕入価格下限
        uppur_word=request.GET.get('q_uppur') #仕入価格上限
        status_word=request.GET.get('q_stat') #取扱ステータス

    #     # ind= 0

        if item_word or num_word or category_word or store_word or lowpur_word or uppur_word or status_word: #入力があれば
            if item_word:
                object_list = ItemInfo.objects.filter(
                    Q(id__icontains=item_word)).order_by('id') #商品コードでフィルタ(検索)
            if num_word:
                object_list = object_list.filter(
                    Q(model_number__icontains=num_word)).order_by('id') #型番
            if category_word:
                object_list = object_list.filter(
                    Q(category__icontains=category_word)).order_by('id') #カテゴリ
            if store_word:
                object_list = object_list.filter(
                    Q(store_id__id__icontains=store_word)).order_by('id') #在庫場所
                # ind= category_word
            if lowpur_word:
                object_list = object_list.filter(
                    Q(purchase_price__gte=lowpur_word)).order_by('id') #仕入価格下限
            if uppur_word:
                object_list = object_list.filter(
                    Q(purchase_price__lte=uppur_word)).order_by('id') #仕入価格上限
            if status_word:
                object_list = object_list.filter(
                    Q(item_status__icontains=status_word)).order_by('id') #取扱ステータス
        else:
            object_list = ItemInfo.objects.all().order_by('id')
        paginator = Paginator(object_list, 8)
        page = request.GET.get('page', 1)
        try:
            object_list = paginator.page(page)
        except PageNotAnInteger:
            object_list = paginator.page(1)
        except EmptyPage:
            object_list = paginator.page(1)
        context = {'form':form,'object_list':object_list,'category':category_word}
        return render(request, template_name, context)
    # paginate_by = 12

    # @login_required
    # def mylist(request):
    #     template_name = "mas_item_list.html"
    #     # template_name = 'earning_list.html'
    #     object_list = ItemInfo.objects.order_by('id')
    #     paginator = Paginator(object_list, 8)
    #     page = request.GET.get('page', 1)
    #     js_list = {}
    #     ob_list = []
    #     try:
    #         object_list = paginator.page(page)
    #     except PageNotAnInteger:
    #         object_list = paginator.page(1)
    #     except EmptyPage:
    #         object_list = paginator.page(1)
    #     for data in object_list:
    #         js_list['list'] = data
    #         js_list['data'] = data.id
    #         ob_list.append(js_list)
    #     # object_list2 = {}
    #     context = {'object_list': object_list,'ob_list':ob_list}
    #     return render(request, template_name, context)

class S0302View(LoginRequiredMixin,CreateView):
    """S0302View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = ItemInfo
    template_name = "mas_item_register.html"
    form_class = S0302Form
    success_url = reverse_lazy('itemmas:S03-01')

    def form_valid(self, form):
        item = form.save(commit=False)  # 保存処理など
        # messages.add_message(self.request, messages.SUCCESS, '登録しました！')  # メッセージ出力
        products = ItemInfo.objects.filter(Q(item_status="1")|Q(item_status="2")|Q(item_status="3")) # 条件を設定してから
        products.update(item_status="0") 

        item.save()
        # record.save()
        return super().form_valid(form)


class S0303View(DetailView):
    """S0303View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    # itemtamesi = ItemInfo.objects.get(id=1)
    
    # def get_success_url(self):
    #     return reverse_lazy('itemmas:S03-01',kwargs={'pk':self.kwargs['pk']})
    # def get_context_data(self, **kwargs):
    #     queryset = ItemSpecification.objects.filter(model_number='asdfghjkl').values()
    #     print(queryset)
    #     return reverse_lazy({'itemmas:S03-01',{'pk':self.kwargs['pk']}})
    # def tamesi(request):
    #     context = {
    #         'test_list': ItemInfo.objects.all(),
    #     }
    #     return render(request, 'mas_item_detail.html', context)

    # def form_valid(self,form):
    #     return super().form_valid(form)
    @login_required
    def itemdetail(request,pk):
        model = ItemInfo
        model2 = ItemSpecification
        template_name = "mas_item_detail.html"  
        # get_model_num = 
        # success_url = reverse_lazy('itemmas:S03-01')
        object = model.objects.filter(id = pk).first()
        tamesi = model.objects.values_list('model_number','category').get(id=pk)
        try:
            object_detail = model2.objects.get(model_number = tamesi,category = tamesi[1])
        except model2.DoesNotExist:
            object_detail = model2.objects.get(id = '0')
        # object_detail = model2.objects.get(model_number = tamesi.model_number)
        itemInfo = ItemInfo.objects.all()
        #itemInfo = ItemInfo.objects.order_by('id')
        # context = {'itemInfo': itemInfo}
        context = {'object': object,'object_detail':object_detail}
        return render(request,template_name,context)
    # def delete(self,request,*args,**kwargs):
    #     return super().delete(request,*args,**kwargs)
    # 有効・無効化(フラグの変更) 01/27
    def invalid(request,pk):
        if request.method == 'POST':
            if 'button_1' in request.POST:
                # ボタン1がクリックされた場合の処理
                # 呼び出された情報のIDと一致する店舗のレコードを取得
                record = ItemInfo.objects.get(id = pk)
                # フラグがオンならオフ、オフならオンに
                if record.item_status == 0 or record.item_status == 1 or record.item_status == 2 or record.item_status == 3:
                    record.item_status = 4
                elif record.item_status == 4:
                    record.item_status = 0
                # レコードを保存
                record.save()
                return redirect('itemmas:S03-01')

    # DBからレコードを削除 01/27
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
                delete_record = ItemInfo.objects.filter(id = pk)
                # レコードを削除
                delete_record.delete()
                # 処理を実行し、下記のURLを参照して遷移する
                return redirect('itemmas:S03-01')

class S0304View(LoginRequiredMixin,UpdateView):
    """S0304View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = ItemInfo
    template_name = "mas_item_edit.html"
    form_class = S0304Form
    
    def get_success_url(self):
        return reverse_lazy('itemmas:S03-03',kwargs={'pk':self.kwargs['pk']})
    def form_valid(self,form):
        return super().form_valid(form)

class S0305View(LoginRequiredMixin,CreateView):
    """S0302View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = ItemSpecification
    template_name = "mas_item_register1.html"
    form_class = S0305Form
    success_url = reverse_lazy('itemmas:S03-01')

    def form_valid(self, form):
        item = form.save(commit=False)  # 保存処理など
        # messages.add_message(self.request, messages.SUCCESS, '登録しました！')  # メッセージ出力
        item.save()
        return super().form_valid(form)
    




