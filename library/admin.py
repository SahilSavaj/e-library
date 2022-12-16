from django.contrib import admin
from .models import Snippet, UploadPDF
# Register your models here.
admin.site.register(Snippet)
admin.site.register(UploadPDF)