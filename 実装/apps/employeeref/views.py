"""employeeref.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,DeleteView,UpdateView
from employeemas.models import EmployeeInfo
# from .forms import S0102Form
from django.urls import reverse_lazy
from accounts.models import CustomUser
# 01/24
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import redirect,render
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required

class S1201View(ListView):
    """S1201View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "employee_list.html"
    def mylist(request):
        CustomUsers = CustomUser.objects.filter(is_active=True).order_by('id')
        paginator = Paginator(CustomUsers, 3)
        page = request.GET.get('page', 1)
        try:
            customuser = paginator.page(page)
        except PageNotAnInteger:
            customuser = paginator.page(1)
        except EmptyPage:
            customuser = paginator.page(1)
        context = {'customuser': customuser,}
        return render(request, 'employee_list.html', context)

class S1202View(DetailView):
    """S1202View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = EmployeeInfo
    template_name = "employee_detail.html"
    success_url = reverse_lazy('employeemas:S01-01')


