"""storeref.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""


from django.db import models
from django.views.generic import TemplateView,ListView,DetailView,CreateView,DeleteView,UpdateView
from storemas.models import StoreInfo
# from storemas.forms import S0202Form
from django.urls import reverse_lazy
from employeemas.models import EmployeeInfo
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

class S1301View(ListView):
    """S1301View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "store_list.html"
    model = StoreInfo
    context_object_name = 'StoreInfo'
    def index(request):
        Posts = Post.objects.order_by('id').reverse()
        paginator = Paginator(Posts, 3)
        page = request.GET.get('page', 1)
        try:
            pages = paginator.page(page)
        except PageNotAnInteger:
            pages = paginator.page(1)
        except EmptyPage:
            pages = paginator.page(1)
        context = {'pages': pages}
        return render(request, 'store_list.html', context)

class S1302View(DetailView):
    """S1302View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    model = StoreInfo
    template_name = "store_detail.html"
    success_url = reverse_lazy('storemas:S13-01')

    def delete(self,request,*args,**kwargs):
        return super().delete(request,*args,**kwargs)


