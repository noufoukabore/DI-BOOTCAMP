from typing import Any
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User, Group
from django import forms
from .widgets import CustomUsernameInput, CustomEmailInput, CustomPasswordInput, CustomRepeatPasswordInput

class CreateUser(UserCreationForm):
    username = forms.CharField( widget=CustomUsernameInput() )
    email = forms.EmailField( widget=CustomEmailInput() )
    password1 = forms.CharField( widget=CustomPasswordInput() )
    password2 = forms.CharField( widget=CustomRepeatPasswordInput() )

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']


class CustomUserCreationForm(UserCreationForm):
    is_admin = forms.BooleanField(required=False)
    
    class Meta(UserCreationForm.Meta):
        model = User
        fields = ['username', 'email', 'password1', 'password2']

    def save(self, commit=True):
        user = super().save(commit=False)

        if self.cleaned_data['is_admin']:
            user.is_superuser = True

        else:
            contributeurs_group = Group.objects.get(name='contributeurs')
            user.groups.add(contributeurs_group)

        if commit:
            user.save()
        return user