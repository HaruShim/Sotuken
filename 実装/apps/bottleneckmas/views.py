"""bottleneckmas.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from django.urls import reverse_lazy
from .forms import S0602Form
from .models import Bottleneck

class S0601View(ListView):
    """S0601View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "mas_bottleneck_list.html"
    context_object_name = 'bottleneck'
    model = Bottleneck
    paginate_by = 12

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


class S0603View(UpdateView,DeleteView):
    """S0603View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = Bottleneck
    template_name = "mas_bottleneck_edit.html"
    success_url = reverse_lazy('bottleneckmas:S06-01CPU')
    form_class = S0602Form

    def get_success_url(self):
        return reverse_lazy('bottleneckmas:S06-03',kwargs={'pk':self.kwargs['pk']})
    def form_valid(self,form):
        return super().form_valid(form)
    def delete(self,request,*args,**kwargs):
        return super().delete(request,*args,**kwargs)

