import json
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
from faq.models import FAQ
from django.contrib.auth.decorators import login_required

from service.models import Service
from .models import Produit, Entreprise
from django.contrib import messages
from django.shortcuts import get_object_or_404



# Create your views here.
def index(request):
    product_total = Produit.objects.count()
    service_total = Service.objects.count()
    faq_total = FAQ.objects.count()

    context = {
        'product_total': product_total,
        'service_total': service_total,
        'faq_total': faq_total
    }
    return render(request, 'produit/index.html', context)
    

def manage_product(request):
    product = {}
    if request.method == 'GET':
        data = request.GET
        id = ''
        if 'id' in data:
            id = data['id']
        if id.isnumeric() and int(id) > 0:
            product = Produit.objects.filter(id=id).first()
            
    return render(request, 'produit/add_product.html', {'product':product})

# Liste des produits
def list_product(request, id=0):

    produit = {}
    if id:
        produit = Produit.objects.filter(id=id).first()
    product = Produit.objects.all()
    product_total = Produit.objects.count()
    context = {
        'product': product,
        'product_total': product_total,
        'produit': produit
    }

    return render(request, 'produit/products.html', context)

def save_product(request):
    resp = {'status':'failed'}
    data = request.POST
    try:
        if data['id'].isnumeric() and int(data['id'])>0:
            Produit.objects.filter(id=data['id']).update(
                name = data['name'],
                description = data['description'],
                price = data['price'],
                image = data['image'],
                mots_cles = data['mots_cles']
            )
            messages.success(request, "Produit modifie avec success")
        else:
            produit = Produit.objects.create(
                name = data['name'],
                description = data['description'],
                price = data['price'],
                image = request.FILES['image'],
                mots_cles = data['mots_cles']
            )
            produit.save()
            messages.success(request, "Produit ajoute avec success")
        resp['status']='success'
    except Exception as e:
        print(str(e))
    return HttpResponse(json.dumps(resp), content_type = 'application/json')

# Supprimer un produit
def delete_product(request, product_id):
    resp = {'status': 'failed'}
    try:
        product = get_object_or_404(Produit, id=product_id)
        product.delete()
        resp = {'status': 'success'}
        messages.success(request, "Produit supprimer avec succes")
    except Exception as e:
        print(str(e))

    return JsonResponse(resp)