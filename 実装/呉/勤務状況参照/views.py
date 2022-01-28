"""workstatus.views
* リクエストに対してhtml形式のレスポンスを返す

Todo:
    * 

"""

from django.views import generic
# 01/28
from django.contrib.auth.mixins import LoginRequiredMixin


class S1401View(LoginRequiredMixin, generic.TemplateView):
    """S1401View

    レスポンスをフォーム、モデル、テンプレートなどから生成する

    Attributes:
        name (): 

    """
    template_name = "work_status.html"
