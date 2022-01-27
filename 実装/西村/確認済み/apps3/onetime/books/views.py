from django.shortcuts import render
from .models import Book
from django.views.generic import ListView
from django.db.models import Q


class BookList(ListView):
    template_name = "book_list.html"

    def get_queryset(self):
        q_word = self.request.GET.get('query')

        if q_word:
            object_list = Book.objects.filter(
                Q(title__icontains=q_word) | Q(author__icontains=q_word))
        else:
            object_list = Book.objects.all()
        return object_list