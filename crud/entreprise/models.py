from django.db import models

# Classe pour l'entreprise 
class Entreprise(models.Model):
    name = models.CharField(max_length=250)
    description = models.TextField()
    address = models.CharField(max_length=200)
    phone = models.CharField(max_length=20)
    email = models.EmailField()
    vision = models.CharField(max_length=200, null=True)
    domaine = models.CharField(max_length=200, null=True)

    def __str__(self):
        return self.name
    
    
# Classe pour les contacts de l'entreprise
class Contact(models.Model):
    entreprise = models.ForeignKey(Entreprise, on_delete = models.CASCADE, related_name='contact', default=1)
    name = models.CharField(max_length=100)
    email = models.EmailField()
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add = True )

    def __str__(self):
        return self.name