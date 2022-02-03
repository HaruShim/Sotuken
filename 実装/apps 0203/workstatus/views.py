"""workstatus.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views import generic
# 01/28
# 02/03
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import redirect,render
from storemas.forms import S1401Form
from accounts.models import CustomUser


class S1401View(LoginRequiredMixin, generic.ListView):
    """S1401View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    @login_required
    def mylist(request):
        form = S1401Form
        object_list = CustomUser.objects.all().exclude(is_superuser=True).order_by('id')
        template_name = "work_status.html"
        paginator = Paginator(object_list, 7)
        page = request.GET.get('page', 1)
        try:
            object_list = paginator.page(page)
        except PageNotAnInteger:
            object_list = paginator.page(1)
        except EmptyPage:
            object_list = paginator.page(1)
        context = {'form':form,'object_list':object_list,}
        return render(request, template_name, context)


