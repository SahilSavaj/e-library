from .models import Snippet, UploadPDF
from django import forms
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model


class SnippetForms(forms.ModelForm):
    class Meta:
        model = Snippet
        fields = ('name','Email','Category','Details')

    def __init__(self, *args, **kwargs):
        super(SnippetForms, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.add_input(Submit("submit", "Submit"))

class UploadFiles(forms.ModelForm):
    class Meta:
        model = UploadPDF
        fields = '__all__'

    def __init__(self, *args, **kwargs):
        super(UploadFiles, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.add_input(Submit("submit", "Submit"))


class UserRegistrationForm(UserCreationForm):
    email = forms.EmailField(help_text='A valid email address, please.', required=True)

    class Meta:
        model = get_user_model()
        fields = ['first_name', 'last_name', 'email', 'password1', 'password2','exam','social_media']

    def save(self, commit=True):
        user = super(UserRegistrationForm, self).save(commit=False)
        user.email = self.cleaned_data['email']
        if commit:
            user.save()
        return user