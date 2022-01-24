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
    template_name = "mas_bottleneck_list.html"
    paginate_by = 10
    # page_kwarg = 'p'
    # context_object_name = 'bottleneck'
    # model = Bottleneck
    # paginate_by = 3

    # def mylist(request):
    #     Bottlenecks = Bottleneck.objects.order_by('id')
    #     paginator = Paginator(Bottlenecks, 12)
    #     page = request.GET.get('page', 1)
    #     try:
    #         bottleneck = paginator.page(page)
    #     except PageNotAnInteger:
    #         bottleneck = paginator.page(1)
    #     except EmptyPage:
    #         bottleneck = paginator.page(1)
    #     context = {'bottleneck': bottleneck}
    #     return render(request, 'mas_bottleneck_list.html', context)

    def get_queryset(self):
        q_word = self.request.GET.get('query')
        if q_word:
            object_list = Bottleneck.objects.filter(
                Q(cpu_name__icontains=q_word) | Q(gpu_name__icontains=q_word))
        else:
            object_list = Bottleneck.objects.all()
        return object_list
        return render(request, 'mas_bottleneck_list.html', context)

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


