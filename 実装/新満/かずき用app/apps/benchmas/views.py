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

class S0501CPUView(ListView):
    """S0501View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_benchmark_list_CPU.html"
    model = CpuBench
    paginate_by = 12

class S0501GPUView(ListView):
    """S0501View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_benchmark_list_GPU.html"
    model = GpuBench
    paginate_by = 12

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

class S0503CPUView(UpdateView,DeleteView):
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
        return reverse_lazy('benchmas:S01-03',kwargs={'pk':self.kwargs['pk']})
    def form_valid(self,form):
        return super().form_valid(form)
    def delete(self,request,*args,**kwargs):
        return super().delete(request,*args,**kwargs)

class S0503GPUView(UpdateView,DeleteView):
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
        return reverse_lazy('benchmas:S01-03',kwargs={'pk':self.kwargs['pk']})
    def form_valid(self,form):
        return super().form_valid(form)
    def delete(self,request,*args,**kwargs):
        return super().delete(request,*args,**kwargs)


