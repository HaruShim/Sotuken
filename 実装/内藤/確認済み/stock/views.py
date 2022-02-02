"""stock.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

# from curses.ascii import NUL
from hashlib import new
from operator import setitem
from django.db import models
from django.views.generic import ListView,DetailView,CreateView,DeleteView,UpdateView

from itemmas.models import ItemInfo
# from itemmas.models import ItemInfo
from .models import SetItem
from storemas.models import StoreInfo
from django.shortcuts import redirect, render
from .forms import S0701Form
from django.urls import reverse_lazy
# from .extra_views import CreateWithInlinesView, InlineFormSet
from django import forms
from django.http import HttpResponse

# def make_test_formset(request):
#     SetItemFormSet = forms.formset_factory(
#             form=S0701_2Form,
#             extra=3,
#             max_num=4
#     )
#     if request.method == 'POST':
#         formset = SetItemFormSet(request.POST)
#         if formset.is_valid():
#             data = repr(formset.cleaned_data)
#             return HttpResponse(data)
#     else:
#         formset = SetItemFormSet()
#     return render(request, 'set_item_register.html', {'formset': formset})

class S0701View(ListView):
    """S0701View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "set_item_list.html"
    model = SetItem
    context_object_name = 'SetItem'

class S0702View(CreateView):
    """S0702View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = SetItem
    template_name = "set_item_register.html"
    form_class = S0701Form
    # print(type(model.set_item))
    success_url = reverse_lazy('stock:S07-01')

    def mylist(request):
        form = S0701Form
        template_name = "set_item_register.html"
        nannka_list = []
        # template_name = 'earning_list.html'
        # object_list = SetItem.objects.all().order_by('id')
        
        set_name = request.GET.get("set_name")
        store_id = request.GET.get("store_id")
        # setitem = SetItem()
        # ×7解くらい
        # 1 ↑で値をすべて変数に代入
        nannka_list.append(request.GET.get("notePC"))
        nannka_list.append(request.GET.get("decttop"))
        nannka_list.append(request.GET.get("monitor"))
        nannka_list.append(request.GET.get("memory"))
        nannka_list.append(request.GET.get("hdd"))
        nannka_list.append(request.GET.get("ssd"))
        nannka_list.append(request.GET.get("office"))
        nannka_list.append(request.GET.get("others"))
        # print(nannka_list) テスト
        # print(setitem)
        # nannka_list内のデータを保存 #
        # for i in nannka_list:
        #     set_item = 
        #     # SetItem.set_item.add(i)
        #     SetItem.set_item.save()

        # item = form.save(commit=False)
        # print(item)
        # 2 if 文上二つがある
        if (set_name == "こんにちは2") and (store_id!=""):  # set_nameとstore_idの値がTrueの時
        #     newset =  SetItem.objects.create(set_name = "set_name",store_id = "store_id")
            # for set_item in nannka_list: 
            #     # query追加の文(item) - 引数1つ目の条件があれば「更新」なければ「挿入」
                            # id=request.get['id'],
                            # set_nameがtableに存在するか
            getstoreid, created = StoreInfo.objects.get_or_create(
                        id=store_id,
                        defaults={"id":store_id}
                        )
            print(getstoreid)
            set_item, created = SetItem.objects.update_or_create(
                        set_name=set_name,
                        defaults={"set_name":set_name,"store_id":getstoreid}
                        )
                    # 店舗名とセット名でset_ite登録
                    # set_item.save()
                # print(newset)
            print(set_item)
            for item in nannka_list:
                cre_obj = ItemInfo.objects.get(id = item)
                set_item.set_item.add(cre_obj)
            set_item.save()


        context = {'form':form}
        return render(request, template_name, context)

    # def sample_form(request):
    #     store_id = request.POST["store_id"]
    #     set_name = request.POST["set_name"]
    #     set_item = request.POST["set_item"]
    #     print(store_id)
    #     print(set_name)
    #     print(set_item)
    #     return render(request,"set_item_register.html",{
    #         '': 'test string',
    #     })
        
    
    def form_valid(self, form):
        # print(form)
        # print('form_va')
        store_id = self.request.GET["store_id"]
        set_name = self.request.GET["set_name"]
        set_item = self.request.GET.getlist("set_item")
        print("これ！")
        print(store_id)
        print(set_name)
        print(set_item)

        item = form.save(commit=False)  # 保存処理など
        # messages.add_message(self.request, messages.SUCCESS, '登録しました！')  # メッセージ出力
        item.save()
        result = super().form_valid(form)

        print("これ！！")
        print(result)
        return result



    # def TwoFom(request):
    #     if request.method == 'POST':
    #         form1 = S0701Form( request.POST,prefix="form1")
    #         form2 = S0701_2Form( request.POST,prefix="form2")
    #         print(request.POST)
    #         # if form1.is_valid() or form2.is_valid():
    #     else:
    #         form1 = S0701Form(prefix="form1")
    #         form2 = S0701_2Form(prefix="form2")
    
    # class S0702View(CreateView):
    #     model = SetItem
    #     template_name = "set_item_register.html"
    #     form_class = S0701Form
    #     success_url = reverse_lazy('stock:S07-01')

    # def regi(request):
    #     if request.method == 'POST':
    #         if 'button_1' in request.POST:
    #             print(request)
    #             return redirect('stock:S07-02')

class S0703View(DetailView,DeleteView):
    """S0703View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = SetItem
    template_name = "set_item_detail.html"
    success_url = reverse_lazy('stock:S07-01')

    def delete(self,request,*args,**kwargs):
        return super().delete(request,*args,**kwargs)

class S0704View(UpdateView):
    """S0704View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = SetItem
    template_name = "set_item_edit.html"
    form_class = S0701Form

    def get_success_url(self):
        return reverse_lazy('stock:S07-03',kwargs={'pk':self.kwargs['pk']})

    def form_valid(self,form):
        return super().form_valid(form)





# class S0105View(CreateView):
#     """S0105View

#     レスポンスをフォーム、モデル、テンプレートなどから生成する

#     Attributes:
#         name (): 

# #     """
#     def create_done(request, **kwargs):
#         template_name = "mas_employee_completion.html"
#         contents = {}
#         for key, val in kwargs.items():
#             contents[key] = val
#         birthday_pass = contents['birthday'][5] + contents['birthday'][6] + contents['birthday'][8] + contents['birthday'][9]

        
#         context = {'name': contents['name'],'employee_id':contents['employee_id'],'birthday':contents['birthday'],'birthday_pass':birthday_pass}

#         return render(request,template_name,context)