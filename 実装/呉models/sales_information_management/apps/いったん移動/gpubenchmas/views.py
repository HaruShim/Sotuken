from django.shortcuts import render
from django.views import generic
#from gpubenchmas import models
#from . models import gpubenchmas_gpubench
from django.shortcuts import HttpResponseRedirect,Http404,HttpResponse,render_to_response
from django.views import generic
from .models import GpuBench


class GpuBenchlistView(generic.ListView):
    model = GpuBench
    template_name = 'GpuBench.html'
    
    # def GpuBench(request):
    #     GpuBench_models = models.SignupForm()  # 样式 ，在forms.py里配置好了
    #     GpuBench = gpubenchmas_gpubench.objects.all()  # 获取我们的数据库信息到names里
    #     return render_to_response("GpuBench.html", locals())  # 必须用这个return


