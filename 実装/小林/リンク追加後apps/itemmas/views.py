"""itemmas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
# from django.views.generic import ListView,TemplateView
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from django.urls import reverse_lazy
from .forms import S0302Form
from django.shortcuts import render
from .models import ItemInfo,ItemSpecification
from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

class S0301View(ListView):
    """S0301View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    def mylist(request):
        ItemInfos = ItemInfo.objects.all()
        #ItemInfos = ItemInfo.objects.order_by('id')
        paginator = Paginator(ItemInfos, 3)
        page = request.GET.get('page', 1)
        try:
            iteminfo = paginator.page(page)
        except PageNotAnInteger:
            iteminfo = paginator.page(1)
        except EmptyPage:
            iteminfo = paginator.page(1)
        context = {'iteminfo': iteminfo}
        return render(request, 'mas_item_list.html', context)

class S0302View(CreateView):
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
        item.save()
        return super().form_valid(form)


class S0303View(DetailView,DeleteView):
    """S0303View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = ItemInfo
    template_name = "mas_item_detail.html"
    success_url = reverse_lazy('itemmas:S03-01')

    # def get_success_url(self):
    #     return reverse_lazy('itemmas:S03-01',kwargs={'pk':self.kwargs['pk']})
    # def form_valid(self,form):
    #     return super().form_valid(form)
    # def itemdetail(request,self,pk):
    #     itemInfo = ItemInfo.objects.all()
    #     #itemInfo = ItemInfo.objects.order_by('id')
    #     context = {'itemInfo': itemInfo}
    #     return render(request, 'mas_item_detail.html', context,kwargs={'pk':self.pk})
    # def delete(self,request,*args,**kwargs):
    #     return super().delete(request,*args,**kwargs)

class S0304View(UpdateView):
    """S0304View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = ItemInfo
    template_name = "mas_item_edit.html"
    form_class = S0302Form
    
    def get_success_url(self):
        return reverse_lazy('itemmas:S03-03',kwargs={'pk':self.kwargs['pk']})
    def form_valid(self,form):
        return super().form_valid(form)
    




