"""benchamas.views.py

* 情報を紐図けるするモジュール

Todo:

    * これ見てgitのappsのurls全部変更お願いします 　
    * このアプリで使用するhtmlのpathを全て追加　
    * pathのurlpatternsを矢印の下のもので統一してください!
    * nameはhtml組と要相談

"""
from django.views import generic
from .models import GpuBench,CpuBench

class S0501View(generic.ListView):
    template_name = "mas_benchmark_list.html"
    # モデルを二つ合わせて呼び出せるのかどうか
    model = GpuBench

class S0502CpuView(generic.TemplateView):
    template_name = "mas_benchmark_register.html"
    model = CpuBench

class S0502GpuView(generic.TemplateView):
    template_name = "mas_benchmark_register(gpu).html"
    model = GpuBench

class S0503CpuView(generic.TemplateView):
    template_name = "mas_benchmark_edit.html"
    model = CpuBench

class S0503GpuView(generic.TemplateView):
    template_name = "mas_benchmark_edit(gpu).html"
    model = GpuBench
