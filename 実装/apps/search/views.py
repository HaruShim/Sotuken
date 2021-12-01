"""stock.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views import generic

class S0701View(generic.TemplateView):
    """S0701View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "set_item_list.html"

class S0702View(generic.TemplateView):
    """S0702View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "set_item_register.html"

class S0703View(generic.TemplateView):
    """S0703View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "set_item_detail.html"

class S0704View(generic.TemplateView):
    """S0704View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "set_item_edit.html"


