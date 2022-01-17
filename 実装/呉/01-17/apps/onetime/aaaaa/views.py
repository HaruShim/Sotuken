from django.views import generic
from django.shortcuts import render
from .models import Aaaaa

class AaaaaView(generic.ListView):
    template_name = "sample.html"
    model = Aaaaa
    context_object_name = 'articles'
    def viewFunction(request):
        # template_name = "template.html"
        template_text = "c" # <- テンプレートに渡したい文字列
        context = {"text" : template_text} # <- "text"がテンプレート内での変数名
        return render(request,template_name,context)

def sample_page(request):
    a = "a"
    b = "b"
    c = "c"
    var = "a + b + c"
    
    params = {'aiueo' : var}
    return render(request,'aaaaa:sample.html',params)

    
def sample_page2(request):
    var = "abc"
    wara = 123
    python = "def"
    context = {
        'aiueo': var,
        'www': wara,
        'django': python,
    }
    return render(request, 'aaaaa/sample.html', context)

