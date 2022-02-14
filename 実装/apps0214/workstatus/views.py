"""workstatus.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from ast import Store
from itertools import count
from pyexpat import model
import re
from wave import WAVE_FORMAT_PCM
from django.forms import modelformset_factory
from django.views import generic
# 01/28
# 02/03
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import redirect, render
from storemas.forms import Store_selecter
from .models import WorkStatus
from django.db.models import Q
from storemas.models import StoreInfo
from accounts.models import CustomUser
from django.urls import reverse_lazy
from .forms import S1401Form,Ws_selecter


class S1401View(LoginRequiredMixin, generic.CreateView,generic.UpdateView):
    """S1401View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    @login_required
    def mylist(request):
        template_name = "work_status_register.html"
        # template_name = "work_status.html"
        form = Store_selecter
        forms = S1401Form
        form2 = Ws_selecter
        object_list = WorkStatus.objects.all().order_by('id')
        q_query = request.GET.get('query',None)
        q_storename = request.GET.get('s_selecter',None)
        q_others = request.GET.get('others',None)
        if q_query:
            object_list = object_list.filter(Q(employee_id__username__exact = q_query))
        if q_storename:
            object_list = object_list.filter(Q(store_id__id__icontains = q_storename))
        if q_others:
            object_list = object_list.filter(Q(employee_id__name__icontains = q_others))

        if request.method == 'POST':
            if 'create_data' in request.POST:
                getstoreid,created = StoreInfo.objects.get_or_create(
                    id = request.POST['selecter'],
                    defaults={'id':request.POST['selecter']}
                )
                workstate,created = WorkStatus.objects.update_or_create(
                    employee_id = request.user,
                    defaults={'store_id':getstoreid,'employee_id':request.user}
                )
            elif 'update_data' in request.POST:
                getstoreid,created = StoreInfo.objects.get_or_create(
                    id = request.POST['ws2_selecter'],
                    defaults={'id':request.POST['ws2_selecter']}
                )
                workstate,created = WorkStatus.objects.update_or_create(
                    employee_id = request.user,
                    defaults={'store_id':getstoreid,'employee_id':request.user}
                )
            elif 'delete_data' in request.POST:
                # del_buttonがクリックされた場合の処理
                # 呼び出されたログインユーザと一致するユーザレコードを取得
                delete_record = WorkStatus.objects.filter(employee_id = request.user)
                # レコードを削除
                delete_record.delete()
                # 処理を実行し、下記のURLを参照して遷移する
                return redirect('workstatus:S14-01')
        paginator = Paginator(object_list, 7)
        page = request.GET.get('page', 1)
        try:
            object_list = paginator.page(page)
        except PageNotAnInteger:
            object_list = paginator.page(1)
        except EmptyPage:
            object_list = paginator.page(1)
        context = {'form': form,'form2': form2, 'forms': forms, 'object_list': object_list}
        return render(request, template_name, context)

    # login_required
    # def mylist(request):
    #     form = S1401Form
    #     model = WorkStatus
    #     object_list = CustomUser.objects.all().exclude(is_superuser=True).order_by('id')
    #     template_name = "work_status_register.html"
    #     paginator = Paginator(object_list, 7)
    #     page = request.GET.get('page', 1)
    #     try:
    #         object_list = paginator.page(page)
    #     except PageNotAnInteger:
    #         object_list = paginator.page(1)
    #     except EmptyPage:
    #         object_list = paginator.page(1)
    #     context = {'form':form,'object_list':object_list,}
    #     return render(request, template_name, context)

    # def form_valid(self, form):
    #     item = form.save(commit=False)  # 保存処理など
    #     # messages.add_message(self.request, messages.SUCCESS, '登録しました！')  # メッセージ出力
    #     item.save()
    #     return super().form_valid(form)
