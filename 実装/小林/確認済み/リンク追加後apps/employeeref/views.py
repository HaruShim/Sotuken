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
from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

class S1201View(ListView):
    """S1201View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    def mylist(request):
        EmployeeInfos = EmployeeInfo.objects.all()
        #EmployeeInfos = EmployeeInfo.objects.order_by('id')
        paginator = Paginator(EmployeeInfos, 3)
        page = request.GET.get('page', 1)
        try:
            employeeinfo = paginator.page(page)
        except PageNotAnInteger:
            employeeinfo = paginator.page(1)
        except EmptyPage:
            employeeinfo = paginator.page(1)
        context = {'employeeinfo': employeeinfo}
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


