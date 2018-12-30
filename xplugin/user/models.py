# coding=utf-8
from django.db import models
from django.contrib.auth.models import AbstractUser

class UserInfo(AbstractUser):
    phone = models.CharField(u'电话',max_length=20,blank=True,null=True)
    
    def __unicode__(self):
        return self.last_name + self.first_name
