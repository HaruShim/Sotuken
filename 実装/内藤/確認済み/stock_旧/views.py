"""stock.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import ListView,DetailView,CreateView,DeleteView,UpdateView
from .models import SetItem
from django.shortcuts import render
from .forms import S0701Form
from django.urls import reverse_lazy

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
    success_url = reverse_lazy('stock:S07-01')

    def form_valid(self, form):
        item = form.save(commit=False)  # 保存処理など
        # messages.add_message(self.request, messages.SUCCESS, '登録しました！')  # メッセージ出力
        item.save()
        return super().form_valid(form)

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