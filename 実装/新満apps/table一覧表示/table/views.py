from django.views import generic
import logging

from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy
from django.shortcuts import render


# from .forms import InquiryForm, DiaryCreateForm
    # from .models import Member
from .models import Householdaccountbook
from .forms import TableCreateForm


# class TablesView(generic.TemplateView):
#     template_name = "tables.html"

class HouseholdaccountListView(LoginRequiredMixin, generic.ListView):
  model = Householdaccountbook
  template_name = 'tables.html'
  # paginate_by = 3

  def get_queryset(self):
    return Householdaccountbook.objects.filter(user=self.request.user).order_by('-created_at')

class TableDetailView(LoginRequiredMixin, generic.DetailView):
  model = Householdaccountbook
  template_name = 'table_detail.html'

class TableCreateView(LoginRequiredMixin, generic.CreateView):
  model = Householdaccountbook
  template_name = 'table_create.html'
  form_class = TableCreateForm
  success_url = reverse_lazy('table:table')

  def form_valid(self, form):
    table = form.save(commit=False)
    table.user = self.request.user
    table.save()
    messages.success(self.request, 'データを登録しました。')
    return super().form_valid(form)

  def form_invalid(self, form):
    messages.error(self.request, "データの登録に失敗しました。")
    return super().form_invalid(form)

class TableUpdateView(LoginRequiredMixin, generic.UpdateView):
  model = Householdaccountbook
  template_name = 'table_update.html'
  form_class = TableCreateForm

  def get_success_url(self):
    return reverse_lazy('table:table_detail', kwargs={'pk': self.kwargs['pk']})

  def form_valid(self, form):
    messages.success(self.request, 'データを更新しました。')
    return super().form_valid(form)

  def form_invalid(self, form):
    messages.error(self.request, "データの更新に失敗しました。")
    return super().form_invalid(form)

class TableDeleteView(LoginRequiredMixin, generic.DeleteView):
  model = Householdaccountbook
  template_name = 'table_delete.html'
  success_url = reverse_lazy('table:table')

  def delete(self, request, *args, **kwargs):
    messages.success(self.request, "データを削除しました。")
    return super().delete(request, *args, **kwargs)

#   def list(request):
#     data = Householdaccountbook.objects.all()
#     params = {'message': 'メンバーの一覧', 'data': data}
#     return render(request, 'tables.html', params)

#   def list_customer(request):
#     customers = Householdaccountbook.objects.all()
#     context = {
#       'index': "Customer",
#       'customers': customers
#     }
#     return render(request, 'tables.html', context)
  

# def list(request):
#   data = Householdaccountbook.objects.all()
#   params = {'message': 'メンバーの一覧', 'data': data}
#   return render(request, 'table:table', params)

# def list_customer(request):
#   customers = Householdaccountbook.objects.all()
#   context = {
#     'index': "Customer",
#     'customers': customers
#   }
#   return render(request, 'table:table', context)


# def users(request):
#   user_list = Householdaccountbook.objects.all() # 値一覧を取得
#   user_dict = {'users': user_list} # ディクショナリーの形で設定

#   return render(request, 'table:table', context=user_dict) # context=user_dict