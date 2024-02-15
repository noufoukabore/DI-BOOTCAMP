import json
from django.shortcuts import get_object_or_404, render, redirect
from django.http import HttpResponse, JsonResponse

from produit.models import Produit
from service.models import Service
from .models import FAQ
from django.contrib import messages

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

# Liste des FAQ
def list_faq(request, id=0):
    
    faq = {}
    if id:
        faq = FAQ.objects.filter(id=id).first()
    faqs = FAQ.objects.all()
    faqs_total = FAQ.objects.count()
    context = {
        'faqs': faqs,
        'faqs_total': faqs_total,
        'faq': faq
    }

    return render(request, 'faq/faq.html', context)



### Manager les faqs
def manage_faq(request):
    faq = {}
    if request.method == 'GET':
        data = request.GET
        id = ''
        if 'id' in data:
            id = data['id']
        if id.isnumeric() and int(id) > 0:
            faq = FAQ.objects.filter(id=id).first()
    
    return render(request, 'faq/add_faq.html', {'faq': faq})


# Ajouter une FAQ
def save_faq(request):
    resp = {'status': 'failed'}
    data = request.POST
    try:
        if data['id'].isnumeric() and int(data['id'])>0:
            FAQ.objects.filter(id=data['id']).update(
                question = data['question'],
                reponse = data['reponse'],
                mots_cles = data['mots_cles']
            )
            messages.success(request, "FAQ modifie avec success")
        else:
            faq = FAQ.objects.create(
                question = data['question'],
                reponse = data['reponse'],
                mots_cles = data['mots_cles']
            )
            faq.save()
            messages.success(request, "FAQ ajoute avec success")
        resp['status'] = 'success'
    except Exception as e:
        print(str(e))
    return HttpResponse(json.dumps(resp), content_type = 'application/json')


# Supprimer un FAQ
def delete_faq(request, faq_id):
    resp = {'status': 'failed'}
    try:
        faq = get_object_or_404(FAQ, id=faq_id)
        faq.delete()
        resp = {'status': 'success'}
        messages.success(request, "FAQ supprimer avec succes")
    except Exception as e:
        print(str(e))

    return JsonResponse(resp)