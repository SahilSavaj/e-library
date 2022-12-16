from django.db import models
from config import bucket,BUCKET_NAME
from django.contrib.auth.models import AbstractUser, UserManager
# Create your models here.


# Create your models here.
class Snippet(models.Model):
    name = models.CharField(max_length = 100)
    Email = models.EmailField()
    Category = models.CharField(max_length=20,choices=[('Improper Notes','improper notes'),('Others','others')],default='Choice')
    Details = models.CharField(max_length=1000)

    def __str__(self):
        return self.name

class UploadPDF(models.Model):
    title = models.CharField(max_length=100)
    slug = models.SlugField(unique=True)
    subject = models.CharField(max_length=20, null=False)
    description = models.CharField(max_length=5000)
    pdf = models.FileField(upload_to="pdfs/")


