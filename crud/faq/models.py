from django.db import models
from entreprise.models import Entreprise

# Create your models here.
# Classe pour les questions frequentes
class FAQ(models.Model):
    entreprise = models.ForeignKey(Entreprise, on_delete = models.CASCADE, related_name='faq', default=1)
    question = models.TextField()
    reponse = models.TextField()
    mots_cles = models.CharField(max_length=300, blank=True, null=True)

    def __str__(self):
        return self.question[:100]

