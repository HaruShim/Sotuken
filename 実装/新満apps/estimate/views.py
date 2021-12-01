"""estimate.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""
from django.views import generic

class S1001View(generic.TemplateView):
    """S1001View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "estimate.html"

class S1002View(generic.TemplateView):
    """S1002View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "customer_estimate.html"
