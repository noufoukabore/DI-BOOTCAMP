from django.db import models
from entreprise.models import Entreprise


# Classe pour les produits de l'entreprise
class Produit(models.Model):
    entreprise = models.ForeignKey(Entreprise, on_delete = models.CASCADE, related_name='produit', default=1)
    name = models.CharField(max_length=200)
    description = models.TextField()
    price = models.FloatField()
    image = models.ImageField(upload_to="images/produit")
    mots_cles = models.CharField(max_length=300, blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name