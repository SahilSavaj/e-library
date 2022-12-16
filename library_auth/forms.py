from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit
from django import forms
from django_registration.forms import RegistrationForm
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model

from .models import User

# class UserRegistrationExtraFieldsForm(forms.ModelForm):
#     class Meta:
#         model = UserRegistrationExtraFields
#         fields = '__all__'

# RegistrationFormTermsOfService.base_fields.update(UserRegistrationExtraFieldsForm.base_fields)

# class LibraryRegistrationForm(RegistrationForm):
#     class Meta(RegistrationForm.Meta):
#         model = User
#         fields = ('first_name','last_name','email','exam','social_media')

#     # form_class = UserRegistrationExtraFieldsForm

#     # def register(self, request, **cleaned_data):
#     #     new_user = super(UserRegistrationExtraFieldsForm, self).register(request, **cleaned_data)
#     #     # here create your new UserProfile object
#     #     return new_user

#     def __init__(self, *args, **kwargs):
#         super(LibraryRegistrationForm, self).__init__(*args, **kwargs)
#         self.helper = FormHelper()
#         self.helper.add_input(Submit("submit", "Register"))

#     # def save(self, profile_callback=None):
#     #     super(LibraryRegistrationForm, self).save(profile_callback=None)
#     #     UserRegistrationExtraFieldsForm.objects.get_or_create(first_name=self.cleaned_data['first_name'],last_name=self.cleaned_data['last_name'],exam=self.cleaned_data['exam'],social_media=self.cleaned_data['social_media'])

class UserRegistrationForm(UserCreationForm):
    email = forms.EmailField(help_text='A valid email address, please.', required=True)

    class Meta:
        model = get_user_model()
        fields = ['first_name', 'last_name', 'email', 'password1', 'password2','exam','social_media']

    def save(self, commit=True):
        user = super(UserRegisterForm, self).save(commit=False)
        user.email = self.cleaned_data['email']
        if commit:
            user.save()
        return user