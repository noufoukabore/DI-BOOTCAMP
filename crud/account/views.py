from django.shortcuts import render, redirect
from django.urls import reverse
from .forms import CreateUser
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
import re
from django.contrib.auth.models import User




def indexViews(request):
    return render(request, 'produit/index.html')

# Creer un compte
def registerPage(request):
    if request.method == 'POST':
        form = CreateUser(request.POST)
        if form.is_valid():
            form.save()
            user = form.cleaned_data.get('username')
            messages.success(request, 'Votre compte a ete creer avec succes ' + user)
            return redirect('login')
    else :
        form = CreateUser()

    context = {
        'form' : form
    }
    return render(request, 'account/register.html', context)



# Se connecter
def loginPage(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        email = re.match(r"^\S+@\S+\.\S+$", username)
        if email:
            user = User.objects.filter(email=username)
            if user.exists():
                username = user.first().username                    # user = authenticate(request, email=username, password=password)
            print(username)
        user = authenticate(request, username=username, password=password)
           
        # Fonctin d'authentification
        if user is not None:
            login(request, user)
            # retour a la page d'acceuil
            messages.success(request, 'connexion reussie')
            return redirect('/')
        else:
            messages.warning(request, 'Informations incorrectes')
            return render(request, 'account/login.html')

    return render(request, 'account/login.html')



# Se deconnecter
def logoutUser(request):
    logout(request)
    return redirect('login')



    