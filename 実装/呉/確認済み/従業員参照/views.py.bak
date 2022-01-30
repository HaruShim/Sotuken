"""employeeref.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView, ListView, DetailView, DeleteView, UpdateView
# from .forms import S0102Form
from django.urls import reverse_lazy
from accounts.models import CustomUser
# 01/24
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import redirect, render
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required


class S1201View(ListView):
    """S1201View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    @login_required
    # template_name = "employee_list.html"
    def mylist(request):
        object_list = CustomUser.objects.filter(
            is_active=True).exclude(employment_status=0).order_by('id')
        paginator = Paginator(object_list, 6)
        page = request.GET.get('page', 1)
        try:
            object_list = paginator.page(page)
        except PageNotAnInteger:
            object_list = paginator.page(1)
        except EmptyPage:
            object_list = paginator.page(1)
        context = {'object_list': object_list, }
        return render(request, 'employee_list.html', context)


class S1202View(LoginRequiredMixin, DetailView):
    """S1202View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name ():

    最終変更日 01/27

    """
    model = CustomUser
    template_name = "employee_detail.html"
    success_url = reverse_lazy('employeeref:S12-01')
