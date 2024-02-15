from django.shortcuts import render
from django.http import HttpResponse
from .models import Entreprise

# Index de la page d'acceuil
def index(request):
    return render(request, 'produit/index.html')


# Infos entreprise
def entreprise_info(request, id=0):
    entreprise = {}
    if id:
        entreprise = Entreprise.objects.filter(id=id).first()
    entreprises = Entreprise.objects.all()
    context = {
        'entreprise': entreprise,
        'entreprises': entreprises

    }

    return render(request, 'entreprise/entreprise.html', context)




#