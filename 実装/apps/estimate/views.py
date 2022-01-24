"""estimate.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""
import copy
import itertools
from django.http import JsonResponse
# import json
from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from django.urls import reverse_lazy
from .forms import S1001Form
from django.shortcuts import render
from django.db.models import Q
from itemmas.models import ItemInfo,ItemSpecification
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
# from django_datatables_view.base_datatable_view import BaseDatatableView

# class ItemsJsonView(BaseDatatableView):
#     # モデルの指定
#     model = Item
#     # 表示するフィールドの指定
#     columns = ['id', 'pref_name', 'name', 'furigana', 'zipcode', 'address', 'tel', 'code']

#     # 検索方法の指定：部分一致
#     def get_filter_method(self):
#         return super().FILTER_ICONTAINS


class S1001View(ListView):
    """S1001View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = ItemInfo
    template_name = "ajax.html"
    # form_class = S1001Form
    success_url = reverse_lazy('estimate:S10-01')
    
    def mylist(request):
        form = S1001Form()
        template_name = "estimate.html"
        params = {}
        view_list = []
        view_tameis = []
        view_dict = {}
        sumre = 0
        
        # iteminfo = ItemInfo.objects.order_by('id')
        # office = ItemInfo.objects.filter(category = 6).order_by('id')
        # 'iteminfo':iteminfo,'office':office,
        # context = {'form':form}
        # return render(request, template_name, context)
        params['form'] = S1001Form
        if request.method == 'POST':
            params['post_id'] = request.POST['id']
            params['vi_li'] = ItemInfo.objects.filter(id = params['post_id'])[0]
            # pre_list={}
            # pre_list = request.POST.get('hidden_data',None)
            # print(pre_list)
            # view_list = []
            # view_list.append(pre_list)
            # print(view_list)
            # view_list.append(lis[0][0])
            # if '[]' in lis:
            #     lis.remove('[]')
            # for data in request.POST.getlist('hidden_data',None):
            #     # if '[]' in data:
            #     #     data.remove('[]')
            #     print('data' + str(data))
            #     view_list.append(data)
                # print('view' + str(view_list))
            # nan = copy.copy(request.POST.getlist('hidden_data',None))
            # nan = list(itertools.chain.from_iterable(request.POST.getlist('hidden_data',None)))
            # if len(request.POST.getlist('hidden_data',None)[0]) == NULL:
            #     print('から')
            # nan = 
            # print(nan)
            # view_list.append(request.POST.getlist('hidden_data',None)[0])
            # view_dict['id'] = params['post_id']
            # view_dict['query'] = params['vi_li']
            # if lis[0] != NULL:
            # view_list.append(lis)
            # view_list.append(params['post_id'])
            # nan.append(view_dict)
            # view_list.append(params['post_id'])
            # for data in nan:
            #     view_list.append(data[1])
            # print(view_list)
            # params['post_key_word'] = request.POST['key_word']
            # input type="hidden" で設定したデータを受け取る。テンプレートで受け取った
            # 「隠しデータです。」という文字列に「ほげほげ」を追記している。
            params['post_hidden_data'] = f"{request.POST.get('hidden_data',None)} {request.POST.get('id')}"
            view_list = params['post_hidden_data'].split()
            print(view_list)
            for data in view_list:
                view_dict[data] = ItemInfo.objects.filter(id = data)
            for i in view_list:
                view_tameis.append(ItemInfo.objects.filter(id = i)[0])
                su = ItemInfo.objects.get(id = i)
                sumre += int(su.purchase_price)
                # print(type(ItemInfo.objects.get(id = i)))
        test = {'params':params,'view_list':view_list,'view_dict':view_dict,'view_tamesi':view_tameis,'sumre':sumre}

        return render(request,template_name,test)

def ajax_post_add(request):
    title = request.POST.get('title')
    post = Post.objects.create(title=title)
    d = {
        'title': post.title,
    }
    return JsonResponse(d)

def ajax_post_search(request):
    keyword = request.GET.get('title')

    # 検索キーワードがあればそれで絞り込み、なければ全ての記事
    # JSONシリアライズするには、Querysetをリストにする必要あり
    if keyword:
        title_list = [post.title for post in Post.objects.filter(title__icontains=keyword)]  # タイトルにキーワードを含む。大文字小文字の区別なし
    else:
        title_list = [post.title for post in Post.objects.all()]

    d = {
        'title_list': title_list,
    }
    return JsonResponse(d)

class S1002View(TemplateView):
    """S1002View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "customer_estimate.html"
