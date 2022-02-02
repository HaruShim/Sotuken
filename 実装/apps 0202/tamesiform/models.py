from django.db import models
from django.utils import timezone

class MyModel(models.Model):
    product_nm = models.CharField(max_length=60, blank=True, null=True)
    product_url = models.TextField(blank=True, null=True)
    class Meta:
        db_table = 'form_tamesi'

class Post(models.Model):
    title = models.CharField('タイトル', max_length=200)
    text = models.TextField('本文')
    date = models.DateTimeField('日付', default=timezone.now)

    def __str__(self):
        return self.title


class File(models.Model):
    name = models.CharField('ファイル名', max_length=255)
    src = models.FileField('添付ファイル')
    target = models.ForeignKey(
        Post, verbose_name='紐づく記事',
        blank=True, null=True,
        on_delete=models.SET_NULL
    )