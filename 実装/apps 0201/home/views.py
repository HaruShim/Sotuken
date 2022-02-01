"""home.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views import generic
from django.shortcuts import render

# class HomeView(generic.TemplateView):
#     """HomeView

#     レスポンスをフォーム、モデル、テンプレートなどから生成する

#     Attributes:
#         name (): 

#     """
#     template_name = "home.html"
def home_page(request):

    var = "abc"
    wara = 123
    python = "def"

    dict = {
        'aiueo': var,
        'www': wara,
        'django': python,
    }

    return render(request, 'home.html', dict)

class TrialtableView(generic.TemplateView):
    """TrialtableView

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "trial_table.html"