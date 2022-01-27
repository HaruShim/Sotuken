from django.shortcuts import render
# from django.shortcuts import render

# def top_page(request):
#     return render(request, 'toppage.html')

def top_page(request):

    var = "abc"
    wara = 123
    python = "def"

    dict = {
        'aiueo': var,
        'www': wara,
        'django': python,
    }

    return render(request, 'toppage.html', dict)

def abc_page(request):

    a = "a"
    b = "b"
    c = "c"
    var = a + b + c

    return render(request, 'abcpage.html', {'aiueo': var})