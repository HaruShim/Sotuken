"""workstatus.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views import generic
from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.views.generic import ListView, TemplateView
from employeemas.models import EmployeeInfo
from django.views import generic


class S1401View(ListView):
    """S1401View

    レスポンスをフォーム、モデル、テンプレートなどから生成する EmployeeInfo

    Attributes:
        name (): 

    """
    def mylist(request):
        EmployeeInfos = EmployeeInfo.objects.all()
        paginator = Paginator(EmployeeInfos, 12)
        page = request.GET.get('page', 1)
        try:
            employeeinfo = paginator.page(page)
        except PageNotAnInteger:
            employeeinfo = paginator.page(1)
        except EmptyPage:
            employeeinfo = paginator.page(1)
        context = {'employeeinfo': employeeinfo}
        return render(request, 'work_status.html', context)   #
