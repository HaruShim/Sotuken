"""benchmas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from django.urls import reverse_lazy
from .forms import S0502CPUForm,S0502GPUForm
from .models import CpuBench,GpuBench
# 01/23 追記
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import redirect,render

class S0501CPUView(ListView):
    """S0501View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    def mylist(request):
        template_name = "mas_benchmark_list_CPU.html"
        object_list = CpuBench.objects.order_by('id')
        paginator = Paginator(object_list, 12)
        page = request.GET.get('page', 1)
        try:
            object_list = paginator.page(page)
        except PageNotAnInteger:
            object_list = paginator.page(1)
        except EmptyPage:
            object_list = paginator.page(1)
        context = {'object_list': object_list,}
        return render(request, template_name, context)

class S0501GPUView(ListView):
    """S0501View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    def mylist(request):
        template_name = "mas_benchmark_list_GPU.html"
        object_list = GpuBench.objects.order_by('id')
        paginator = Paginator(object_list, 12)
        page = request.GET.get('page', 1)
        try:
            object_list = paginator.page(page)
        except PageNotAnInteger:
            object_list = paginator.page(1)
        except EmptyPage:
            object_list = paginator.page(1)
        context = {'object_list': object_list,}
        return render(request, template_name, context)

class S0502CPUView(CreateView):
    """S0501View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = CpuBench
    template_name = "mas_benchmark_register_CPU.html"
    form_class = S0502CPUForm
    success_url = reverse_lazy('benchmas:S05-01CPU')

    def form_valid(self, form):
        item = form.save(commit=False)  # 保存処理など
        item.save()
        return super().form_valid(form)

class S0502GPUView(CreateView):
    """S0501View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = GpuBench
    template_name = "mas_benchmark_register_GPU.html"
    form_class = S0502GPUForm
    success_url = reverse_lazy('benchmas:S05-01GPU')

    def form_valid(self, form):
        item = form.save(commit=False)  # 保存処理など
        item.save()
        return super().form_valid(form)

class S0503CPUView(UpdateView):
    """S0501View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = CpuBench
    template_name = "mas_benchmark_edit_CPU.html"
    success_url = reverse_lazy('benchmas:S05-01CPU')
    form_class = S0502CPUForm

    def get_success_url(self):
        return reverse_lazy('benchmas:S05-03CPU',kwargs={'pk':self.kwargs['pk']})
    def form_valid(self,form):
        return super().form_valid(form)

class S0503GPUView(UpdateView):
    """S0501View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = GpuBench
    template_name = "mas_benchmark_edit_GPU.html"
    success_url = reverse_lazy('benchmas:S05-01GPU')
    form_class = S0502GPUForm

    def get_success_url(self):
        return reverse_lazy('benchmas:S05-03GPU',kwargs={'pk':self.kwargs['pk']})
    def form_valid(self,form):
        return super().form_valid(form)

