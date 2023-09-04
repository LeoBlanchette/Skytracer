from django.db import models

# Create your models here.


class SkytracerImage(models.Model):
    filename = models.CharField(max_length=200)
    date = models.DateTimeField("date published")
