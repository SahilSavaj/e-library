"""online_library URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from re import template
import library.views
import library_auth.views
from django.contrib import admin
from django.contrib.auth import views as auth_views
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.conf.urls.static import static
from django.urls import path, include
# from django_registration.backends.activation.views import RegistrationView
# noinspection PyUnresolvedReferences
from django_registration.backends.one_step.views import RegistrationView
from . import settings

from library_auth import forms


urlpatterns = [
    path('admin/', admin.site.urls),
    path('Contact us/',library.views.contact, name = "contact"),
    path('upload',library.views.uploadPdfs, name = "upload"),
    path('',library.views.index),
    path('librarylist/',library.views.librarylist, name="librarylist"),
    path('pdfviewer/',library.views.pdfviewer, name="pdfviewer"),
    path('accounts/logout/' ,auth_views.LogoutView.as_view(next_page = "login"), name = "logout"),
    # path('accounts/change_password/', auth_views.PasswordChangeView.as_view(
    #     template_name = "django_registration/change_password.html", success_url='/'
    #     ),
    #      name = "change_password"
    # ),
    # path('accounts/password_reset/',
    #      auth_views.PasswordResetView.as_view(
    #          template_name='django_registration/password_reset.html',
    #          subject_template_name='django_registration/password_reset_subject.txt',
    #          email_template_name='django_registration/password_reset_email.html',
    #          # success_url='/login/'
    #      ),
    #      name='password_reset'),
    # path('accounts/password_reset/done/',
    #      auth_views.PasswordResetDoneView.as_view(
    #          template_name='django_registration/password_reset_done.html'
    #      ),
    #      name='password_reset_done'),
    # path('accounts/password_reset_confirm/<uidb64>/<token>/',
    #      auth_views.PasswordResetConfirmView.as_view(
    #          template_name='django_registration/password_reset_confirm.html'
    #      ),
    #      name='password_reset_confirm'),
    # path('accounts/password_reset_complete/',
    #      auth_views.PasswordResetCompleteView.as_view(
    #          template_name='django_registration/password_reset_complete.html'
    #      ),
    #      name='password_reset_complete'),
    path("accounts/", include("django.contrib.auth.urls")),
    path("accounts/", include("allauth.urls")),
    path("accounts/profile/",library_auth.views.profile, name="profile"),
    # path("accounts/register/",
    #     RegistrationView.as_view(form_class=forms.LibraryRegistrationForm),
    #     name="django_registration_register" ),
    path("accounts/register/",library.views.register,name="register"),
    path('accounts/',include('django_registration.backends.one_step.urls')),

]+staticfiles_urlpatterns()
# ]+static(settings.STATIC_URL)