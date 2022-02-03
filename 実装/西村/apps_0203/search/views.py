"""stock.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views import generic

class S0801View(generic.TemplateView):
    """S0801View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "item_search.html"

class S0802View(generic.TemplateView):
    """S0802View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "bottleneck_search.html"

class S0803View(generic.TemplateView):
    """S0803View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "benchmark_search.html"

# class S0804View(generic.TemplateView):
#     """S0804View

#     レスポンスをフォーム、モデル、テンプレートなどから生成する

#     Attributes:
#         name (): 

#     """
#     template_name = ".html"


