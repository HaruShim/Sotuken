"""employeemas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from .models import EmployeeInfo
from django.shortcuts import render
from .forms import S0102Form,S0104Form
from django.urls import reverse_lazy


class S0101View(ListView):
    """S0101View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_employee_list.html"
    model = EmployeeInfo
    context_object_name = 'EmployeeInfo'

class S0102View(CreateView):
    """S0102View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = EmployeeInfo
    template_name = "mas_employee_register.html"
    form_class = S0102Form
    # form_class = SampleForm
    # success_url = reverse_lazy('employeemas:S01-05')

    def form_valid(self, form):
        item = form.save(commit=False)  # 保存処理など
        # messages.add_message(self.request, messages.SUCCESS, '登録しました！')  # メッセージ出力
        item.save()
        return super().form_valid(form)

class S0103View(DetailView,DeleteView):
    """S0103View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = EmployeeInfo
    template_name = "mas_employee_detail.html"
    success_url = reverse_lazy('employeemas:S01-01')

    def delete(self,request,*args,**kwargs):
        return super().delete(request,*args,**kwargs)



class S0104View(UpdateView):
    """S0104View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = EmployeeInfo
    template_name = "mas_employee_edit.html"
    form_class = S0104Form

    def get_success_url(self):
        return reverse_lazy('employeemas:S01-03',kwargs={'pk':self.kwargs['pk']})
    def form_valid(self,form):
        return super().form_valid(form)



# class S0105View(CreateView):
#     """S0105View

#     レスポンスをフォーム、モデル、テンプレートなどから生成する

#     Attributes:
#         name (): 

#     """
def create_done(request, **kwargs):
    template_name = "mas_employee_completion.html"
    contents = {}
    for key, val in kwargs.items():
        contents[key] = val
    birthday_pass = contents['birthday'][5] + contents['birthday'][6] + contents['birthday'][8] + contents['birthday'][9]

    
    context = {'name': contents['name'],'employee_id':contents['employee_id'],'birthday':contents['birthday'],'birthday_pass':birthday_pass}

    return render(request,template_name,context)


