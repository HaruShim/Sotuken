from django.urls.base import reverse_lazy
from django.views.generic import CreateView, ListView, TemplateView, UpdateView, DeleteView
from .models import GpuBench
from .forms import Benchmark_registerForm
from django.contrib import messages


import logging
# from .forms import InquiryForm
from django.contrib.auth.mixins import LoginRequiredMixin
# from .models import Diary


class S0501View(ListView):  # 一覧
    model = GpuBench
    template_name = "mas_benchmark_list.html"


class S0502View(CreateView):  # 新規
    model = GpuBench
    template_name = "mas_benchmark_register.html"
    form_class = Benchmark_registerForm
    success_url = reverse_lazy('benchamas:S05-01')

    def form_valid(self, form):
        gpubench = form.save(commit=False)
        gpubench.user = self.request.user
        gpubench.save()
        messages.success(self.request, '新規を作成しました。')
        return super().form_valid(form)

    def form_invalid(self, form):
        messages.error(self.request, '新規の作成に失敗しました。')
        return super().form_invalid(form)


class S0503View(ListView):  # 更新
    model = GpuBench
    template_name = "mas_benchmark_edit.html"
    
    form_class = Benchmark_registerForm

    def get_success_url(self):
       return reverse_lazy('benchamas:S05-01',kwargs={'pk':self.kwargs['pk']})

    def form_valid(self, form):
        messages.success(self.request, '更新を作成しました。')
        return super().form_valid(form)

    def form_invalid(self, form):
        messages.error(self.request, '更新の作成に失敗しました。')
        return super().form_invalid(form)
        

class S0504View(ListView):
    model = GpuBench
    template_name = 'mas_benchmark_delete.html'
    success_url = reverse_lazy('benchamas:S05-01')

    def delete(self, request, *args, **kwargs):
        messages.success(self.request, "日記を削除しました。")
        return super().delete(request, *args, **kwargs)
