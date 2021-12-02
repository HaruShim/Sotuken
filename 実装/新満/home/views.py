"""home.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views import generic

class HomeView(generic.TemplateView):
    """HomeView

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "home.html"

class TrialtableView(generic.TemplateView):
    """TrialtableView

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "trial_table.html"