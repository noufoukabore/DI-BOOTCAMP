from django.urls import path
from . import views


urlpatterns = [
    path('', views.index, name='index'),
    path('faq/', views.list_faq, name='faq'),
    path('save_faq/', views.save_faq, name='save_faq'),
    path('manage_faq/', views.manage_faq, name='manage_faq'),
    path('delete_faq/<int:faq_id>/', views.delete_faq, name='delete_faq')
]
