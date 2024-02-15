from django.urls import path
from . import views


urlpatterns = [
    path('', views.index, name='index'),
    path('entreprise/', views.entreprise_info, name='entreprise')
    #path('profils/', views.profils_info, name='profils')
]
