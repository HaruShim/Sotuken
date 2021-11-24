from accounts.models import CustomUser 
from django.db import models

class Householdaccountbook(models.Model):
  Outin = (
    ('out','支出'),
    ('in','収入'),
  )
  Genre = (
    ('food','食品'),
    ('clothing','衣類'),
    ('favo','娯楽'),
    ('payment','支払い'),
    ('salary','給料'),
    ('other','その他'),
  )

    # name = models.CharField(_('フルーツカテゴリ'), max_length=10, choices=Genre, unique=True, default='')


  user = models.ForeignKey(CustomUser, verbose_name='ユーザー', on_delete=models.PROTECT)

  date = models.DateField(verbose_name='日付')
  choice = models.CharField(verbose_name='出入金', max_length=10, choices=Outin, unique=False, default='')
  genre = models.CharField(verbose_name='ジャンル', max_length=10, choices=Genre, unique=False, default='')
  title = models.CharField(verbose_name='品名', max_length=20,blank=True)
  quanity = models.PositiveIntegerField(verbose_name='数量',null=True)
  money = models.PositiveIntegerField(verbose_name='金額')
  content = models.TextField(verbose_name='備考', blank=True)

  created_at = models.DateTimeField(verbose_name='作成日時', auto_now_add=True)
  updated_at = models.DateTimeField(verbose_name='更新日時', auto_now=True)

  class Meta:
    verbose_name_plural = 'Householdaccountbook'

  def __str__(self):
    return self.title
