"""employeemas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from accounts.models import CustomUser
from earningmas.models import EarningInfo
from django.shortcuts import render
from .forms import S0102Form,S0104Form
from django.urls import reverse_lazy
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

# 01/21
from django.shortcuts import redirect,render
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required

class S0101View(ListView):
    """S0101View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    @login_required
    def mylist(request):
        # 02/02 マスタには全件表示、従業員用には有効アカウントのみ表示
        # object_list = CustomUser.objects.filter(is_active=True).order_by('id')
        # 変更必須
        # CustomUserモデルから管理者アカウントを除く全件を降順で取得
        object_list = CustomUser.objects.all().exclude(is_superuser=True).order_by('id')
        # object_list = CustomUser.objects.all().exclude(username='99999999').order_by('id')
        paginator = Paginator(object_list, 7)
        page = request.GET.get('page', 1)
        try:
            object_list = paginator.page(page)
        except PageNotAnInteger:
            object_list = paginator.page(1)
        except EmptyPage:
            object_list = paginator.page(1)
        context = {'object_list': object_list,}
        return render(request, 'mas_employee_list.html', context)

class S0102View(LoginRequiredMixin,CreateView,):
    """S0102View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = CustomUser
    template_name = "mas_employee_register.html"
    form_class = S0102Form
    success_url = reverse_lazy('employeemas:S01-01')

    def form_valid(self, form):
        item = form.save(commit=False)  # 保存処理など
        item.save()
        return super().form_valid(form)

class S0103View(LoginRequiredMixin,DetailView):
    """S0103View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = CustomUser
    template_name = "mas_employee_detail.html"
    success_url = reverse_lazy('employeemas:S01-01')

    # 削除(フラグをオフに) 01/20
    @login_required
    def invalid(request,pk):
        if request.method == 'POST':
            if 'button_1' in request.POST:
                # ボタン1がクリックされた場合の処理
                record = CustomUser.objects.get(id = pk)
                if record.is_active:
                    record.is_active = False
                else:
                    record.is_active = True
                record.save()
                return redirect('employeemas:S01-01')



class S0104View(LoginRequiredMixin,UpdateView):
    """S0104View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = CustomUser
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


