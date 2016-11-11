from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)
    
class Project(models.Model):
    cik = models.IntegerField(default=0)
    conm = models.CharField(max_length=100)
    type = models.CharField(max_length=10)
    date = models.CharField(max_length=20)
    path = models.CharField(max_length=50)
    def __str__(self):
        return self.conm
