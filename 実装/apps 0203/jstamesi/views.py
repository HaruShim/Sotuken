from django.shortcuts import render
from django.conf import settings
from django.http import JsonResponse

def index(request):
    return render(request, 'index.html', {})

def ajax_number(request):
    number1 = request.POST.get('number1')
    number2 = request.POST.get('number2')
    print(number1)
    # plus = number1 + number2
    # minus = number1 - number2
    plus = 100
    minus = 200
    d = {
        'plus': plus,
        'minus': minus,
    }
    return JsonResponse(d)