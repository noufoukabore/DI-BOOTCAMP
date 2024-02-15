import json
from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from faq.models import FAQ

from produit.models import Produit
from .models import Service
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

def manage_service(request):
    service = {}
    if request.method == 'GET':
        data = request.GET
        id = ''
        if 'id' in data:
            id = data['id']
        if id.isnumeric() and int(id) > 0:
            service = Service.objects.filter(id=id).first()
            
    return render(request, 'service/add_service.html', {'service': service})


# Liste des services
def list_service(request, id=0):
    
    services = {}
    if id:
        services = Service.objects.filter(id=id).first()
    service = Service.objects.all()
    service_total = Service.objects.count()
    context = {
        'service': service,
        'service_total': service_total,
        'services': services
    }

    return render(request, 'service/services.html', context)


### Service ajouter
def save_service(request):
    resp = {'status':'failed'}
    data = request.POST
    try:
        if data['id'].isnumeric() and int(data['id'])>0:
            Service.objects.filter(id=data['id']).update(
                name = data['name'],
                description = data['description'],
                price = data['price'],
                image = data['image'],
                mots_cles = data['mots_cles']
            )
            messages.success(request, "Service modifie avec success")
        else:
            services = Service.objects.create(
                name = data['name'],
                description = data['description'],
                price = data['price'],
                image = request.FILES['image'],
                mots_cles = data['mots_cles']
            )
            services.save()
            messages.success(request, "Service ajoute avec success")
        resp['status']='success'
    except Exception as e:
        print(str(e))
    return HttpResponse(json.dumps(resp), content_type = 'application/json')

# Supprimer un service
def delete_service(request, service_id):
    resp = {'status': 'failed'}
    try:
        service = get_object_or_404(Service, id=service_id)
        service.delete()
        resp = {'status': 'success'}
        messages.success(request, "Service supprimer avec succes")
    except Exception as e:
        print(str(e))

    return JsonResponse(resp)