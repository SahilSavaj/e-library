
from fileinput import filename
from genericpath import isdir
from django.shortcuts import render,redirect
from .forms import SnippetForms, UploadFiles
from .models import UploadPDF
import json
import boto3
import os
from config import bucket,BUCKET_NAME,BUCKET_URL
from django.contrib.auth import get_user_model, login
from .forms import UserRegistrationForm


# Create your views here.
def index(request):

    return render(request, "library/index.html")

def librarylist(request):
    data_from_db=UploadPDF.objects.all().values()
    uploaded_pdfs=[x for x in data_from_db]
    return render(request,"library/librarylist.html",{'data':uploaded_pdfs})

def pdfviewer(request):
    url=request.GET['url']
    path_of_pdf=BUCKET_URL+url[5:]
    
    return render(request,"library/pdfviewer.html",{'path':path_of_pdf})

def contact(request):
    if request.method == 'POST':
        form = SnippetForms(request.POST)   
        if form.is_valid():
            ##Contact us email daalna padega
            form.save()
    form = SnippetForms()
    return render(request,'library/hello.html',{'form':form})

def register(request):
    # Logged in user can't register a new account
    if request.user.is_authenticated:
        return redirect("/")

    if request.method == 'POST':
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/')
        else:
            for error in list(form.errors.values()):
                print(request, error)

    else:
        form = UserRegistrationForm()

    return render(
        request = request,
        template_name = "library/register.html",
        context={"form":form}
        )

def uploadPdfs(request):
    if request.method == 'POST':
        # print(request.FILES)
        form = UploadFiles(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            
            uploaded_pdfs=os.listdir('./pdfs/')
            # print(uploaded_pdfs)
            if uploaded_pdfs!=[]:
                for i in uploaded_pdfs:
                    # print(i)
                    bucket.Bucket(BUCKET_NAME).upload_file(Filename="./pdfs/"+i,Key="pdfs/"+i)
                    os.remove('./pdfs/'+i)
                
            # form = UploadFiles()
            # context = {
            # 'form': form,
            # }
            return render(request, 'library/index.html')
    else:
        form = UploadFiles()
        context = {
            'form': form,
        }
    return render(request, 'library/uploadPDF.html', context={'form': form,})
