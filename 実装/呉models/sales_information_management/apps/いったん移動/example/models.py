from django.db import models
from django.db.models.fields import CharField

class Example(models.Model):
    title = models.CharField(verbose_name='タイトル',max_length=40)
    content = models.TextField(verbose_name='本文',blank=True,null=True)
