"""bottleneckmas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from django.db.models import Q
from django.urls import reverse_lazy
from .forms import S0602Form
from .models import Bottleneck
from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required



class S0601View(ListView):
    """S0601View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    @login_required
    def mylist(request):
        # レンダリングするテンプレートのディレクトリを指定
        template_name = "mas_bottleneck_list.html"
        # name="query"から値を取得してq_wordに代入
        q_word = request.GET.get('query') 
        q_word2 = request.GET.get('query2') 
        # print(request.GET)
        # print(q_word)
        # q_wordが値を取得している場合
        object_list = Bottleneck.objects.all().order_by('id')
        if q_word:
            object_list = object_list.filter(Q(cpu_name__icontains=q_word))
        if q_word2:
            # object_listにBottleneckモデルからq_wordの検索結果
            # id降順でクエリセットを代入
            object_list = object_list.filter(Q(gpu_name__icontains=q_word2))
        paginator = Paginator(object_list, 8)
        page = request.GET.get('page', 1)
        try:
            object_list = paginator.page(page)
        except PageNotAnInteger:
            object_list = paginator.page(1)
        except EmptyPage:
            object_list = paginator.page(1)
        # q_wordが未取得の場合
        context = {'object_list': object_list,}
        # リクエスト元にtemplate_nameや、辞書型の変数を返す
        return render(request,template_name,context)

class S0602View(LoginRequiredMixin, CreateView):
    """S0602View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = Bottleneck
    template_name = "mas_bottleneck_register.html"
    form_class = S0602Form
    success_url = reverse_lazy('bottleneckmas:S06-01')

    def form_valid(self, form):
        item = form.save(commit=False)  # 保存処理など
        item.save()
        return super().form_valid(form)


class S0603View(LoginRequiredMixin, UpdateView):
    """S0603View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = Bottleneck
    template_name = "mas_bottleneck_edit.html"
    # success_url = reverse_lazy('bottleneckmas:S06-01')
    form_class = S0602Form

    def get_success_url(self):
        return reverse_lazy('bottleneckmas:S06-03',kwargs={'pk':self.kwargs['pk']})
    def form_valid(self,form):
        return super().form_valid(form)


