"""home.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views import generic
from django.shortcuts import render
from accounts.forms import LoginForm

# class HomeView(generic.TemplateView):
#     """HomeView

#     レスポンスをフォーム、モデル、テンプレートなどから生成する

#     Attributes:
#         name (): 

#     """
#     template_name = "home.html"
def home_page(request):

    return render(request, 'home.html')

class LoginView(generic.TemplateView):
    """TrialtableView

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "loginview.html"

