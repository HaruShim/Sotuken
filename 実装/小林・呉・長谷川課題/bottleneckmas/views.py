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


class S0601View(ListView):
    """S0601View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    def mylist(request):
        # レンダリングするテンプレートのディレクトリを指定
        template_name = "mas_bottleneck_list.html"
        # name="query"から値を取得してq_wordに代入
        q_word = request.GET.get('query') 
        # q_wordが値を取得している場合
        if q_word:
            # object_listにBottleneckモデルからq_wordの検索結果
            # id降順でクエリセットを代入
            object_list = Bottleneck.objects.filter(
                Q(cpu_name__icontains=q_word) | Q(gpu_name__icontains=q_word)).order_by('id')
            paginator = Paginator(object_list, 12)
            page = request.GET.get('page', 1)
            try:
                object_list = paginator.page(page)
            except PageNotAnInteger:
                object_list = paginator.page(1)
            except EmptyPage:
                object_list = paginator.page(1)
        # q_wordが未取得の場合
        else:
            # object_listにBottleneckモデルから全件ID降順でクエリセットを代入
            object_list = Bottleneck.objects.all().order_by('id')
            paginator = Paginator(object_list, 12)
            page = request.GET.get('page', 1)
            try:
                object_list = paginator.page(page)
            except PageNotAnInteger:
                object_list = paginator.page(1)
            except EmptyPage:
                object_list = paginator.page(1)
        context = {'object_list': object_list,}
        # リクエスト元にtemplate_nameや、辞書型の変数を返す
        return render(request,template_name,context)

class S0602View(CreateView):
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


class S0603View(UpdateView):
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
        return reverse_lazy('bottleneckmas:S06-01')
    def form_valid(self,form):
        return super().form_valid(form)


