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
from storemas.models import StoreInfo
from accounts.models import CustomUser
from django.urls import reverse_lazy
from .forms import S1401Form


class S1401View(LoginRequiredMixin, generic.CreateView):
    """S1401View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    # model = WorkStatus
    # template_name = "work_status_register.html"
    # form_class = S1401Form
    # # success_url = reverse_lazy('workstatus:S14-01_as')

    @login_required
    def mylist(request):
        template_name = "work_status_register.html"
        # template_name = "work_status.html"
        form = Store_selecter
        forms = S1401Form
        object_list = WorkStatus.objects.all().order_by('id')
        # WorkStatus.objects.create(store_id=request.POST.get('store_id'),employee_id=request.user)

        # object1 = WorkStatus.objects.get()
        # store_id = request.POST.get('store_id')  # POSTで送られた店舗ID
        # print(object_list[0])
        # object = list(CustomUser.objects.filter(name=request.user))
        # print(len(object))
        # print(object.store_id)

        # for i in range(len(object_list)):
        #     print(object_list[i])

        # ボタンが押された時の動作
        # object_list = WorkStatus("")
        if request.method == 'POST':
            if 'create_data' in request.POST:
                getstoreid,created = StoreInfo.objects.get_or_create(
                    id = request.POST['store_id'],
                    defaults={'id':request.POST['store_id']}
                )
                workstate,created = WorkStatus.objects.update_or_create(
                    employee_id = request.user,
                    defaults={'store_id':getstoreid,'employee_id':request.user}
                )
                print(workstate)
                # sample = WorkStatus(store_id=request.POST.get('store_id'),employee_id=request.user)
                # sample = sample.save()
                print("登録されました。")
            # elif 'create_data' in request.POST:
            #     print("削除されました")
            # # elif 'delete_data' in request.POST:
        # print("これ")
        # print(object1)
        # print(type(request))
        # print(request.POST.get('store_id'))
        # print(request.user)
        # print(store_id)
        # print(forms)

        context = {'form': form, 'forms': forms, 'object_list': object_list}

        # for i in range(1):
        #     context["object1"] = object_list[i]

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

    def form_valid(self, form):
        item = form.save(commit=False)  # 保存処理など
        # messages.add_message(self.request, messages.SUCCESS, '登録しました！')  # メッセージ出力
        item.save()
        return super().form_valid(form)
