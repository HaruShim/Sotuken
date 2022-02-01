
"""storemas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

import json
from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from .models import StoreInfo
from .forms import S0202Form
from django.urls import reverse_lazy
from accounts.models import CustomUser
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
# 01/20
from django.shortcuts import redirect,render
# 01/28
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required

class S0201View(ListView):
    """S0201View 01/20

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    @login_required
    def mylist(request):
        template_name = "mas_store_list.html"
        storeinfo = StoreInfo.objects.all().order_by('id')
        # storeinfo2 = StoreInfo.objects.order_by('id')
        # StoreInfos = StoreInfo.objects.filter(invalid_flg=True).order_by('id')
        st_list = []
        object_list = CustomUser.objects.filter(employment_status = 1).values_list('name','store_id')
        for data1 in storeinfo:
            storemas_list = {}
            storemas_list['list'] = data1
            
            storemas_list["data"] = json.dumps("my_data")
            for data2 in object_list:
                # print(get_store_mas[1][1])
                if data1.id == data2[1]:
                    storemas_list['store_manager'] = data2[0]
                    break
                else:
                    storemas_list['store_manager'] = '未設定'
            st_list.append(storemas_list)
        paginator = Paginator(st_list, 7)
        page = request.GET.get('page', 1)
        try:
            object_list = paginator.page(page)
        except PageNotAnInteger:
            object_list = paginator.page(1)
        except EmptyPage:
            object_list = paginator.page(1)
        print(st_list)
        context = {'st_list':st_list,'object_list':object_list,'storemas_list':storemas_list}
        return render(request, template_name, context)

class S0202View(LoginRequiredMixin,CreateView):
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


class S0203View(LoginRequiredMixin,DetailView):
    """S0203View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = StoreInfo
    template_name = "mas_store_detail.html"
    success_url = reverse_lazy('storemas:S02-01')

    # 有効・無効化(フラグの変更) 01/27
    @login_required
    def invalid(request,pk):
        if request.method == 'POST':
            if 'button_1' in request.POST:
                # ボタン1がクリックされた場合の処理
                # 呼び出された情報のIDと一致する店舗のレコードを取得
                record = StoreInfo.objects.get(id = pk)
                # フラグがオンならオフ、オフならオンに
                if record.invalid_flg:
                    record.invalid_flg = False
                else:
                    record.invalid_flg = True
                レコードを保存
                record.save()
                return redirect('storemas:S02-01')

class S0204View(LoginRequiredMixin,UpdateView):
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


