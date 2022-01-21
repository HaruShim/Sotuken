"""itemmas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
# from django.views.generic import ListView,TemplateView
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from django.urls import reverse_lazy
from .forms import S0302Form,S0304Form,S0305Form
from django.shortcuts import render
from django.db.models import Q
from .models import ItemInfo,ItemSpecification
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

class S0301View(ListView):
    """S0301View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    # context_object_name = 'ItemList'
    # model = ItemInfo
    # paginate_by = 12
    def mylist(request):
        template_name = "mas_item_list.html"
        # template_name = 'earning_list.html'
        iteminfo = ItemInfo.objects.order_by('id')
        paginator = Paginator(iteminfo, 12)
        page = request.GET.get('page', 1)
        try:
            iteminfo = paginator.page(page)
        except PageNotAnInteger:
            iteminfo = paginator.page(1)
        except EmptyPage:
            iteminfo = paginator.page(1)
        context = {'iteminfo': iteminfo,}
        return render(request, template_name, context)

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

class S0305View(CreateView):
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
    




