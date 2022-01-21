"""storeref.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""


from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from storemas.models import StoreInfo
from accounts.models import CustomUser
from django.shortcuts import redirect,render # 01/20追加
from django.urls import reverse_lazy
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

class S1301View(ListView):
    """S1301View 01/20

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    def mylist(request):
        template_name = "store_list.html"
        # storeinfo = StoreInfo.objects.all().order_by('id')
        storeinfo = StoreInfo.objects.filter(invalid_flg=True,place_category = 1).order_by('id')
        st_list = []
        get_store_mas = CustomUser.objects.filter(employment_status = 1).values_list('name','store_id')
        for data1 in storeinfo:
            storemas_list = {}
            storemas_list['list'] = data1
            for data2 in get_store_mas:
                # print(get_store_mas[1][1])
                if data1.id == data2[1]:
                    storemas_list['store_manager'] = data2[0]
                    break
                else:
                    storemas_list['store_manager'] = '未設定'
            st_list.append(storemas_list)
        paginator = Paginator(storeinfo, 12)
        page = request.GET.get('page', 1)
        try:
            storeinfo = paginator.page(page)
        except PageNotAnInteger:
            storeinfo = paginator.page(1)
        except EmptyPage:
            storeinfo = paginator.page(1)
        context = {'st_list':st_list}
        return render(request, template_name, context)

class S1302View(DetailView):
    """S1302View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = StoreInfo
    template_name = "store_detail.html"
    success_url = reverse_lazy('storemas:S13-01')



