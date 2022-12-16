from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.shortcuts import redirect
from django.contrib.auth.models import auth
from library_auth.models import User
# Create your views here.
@login_required
def profile(request):
    return render(request, "library_auth/profile.html")

def logout_view(request):
    auth.logout(request)
    return redirect("/accounts/login/")
    

