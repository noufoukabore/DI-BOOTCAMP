from django.urls import path
from . import views


urlpatterns = [
    path('', views.index, name='index'),
    path('service/', views.list_service, name='service'),
    path("save_service/", views.save_service, name="save_service"),
    path('manage_service', views.manage_service, name='manage_service'),
    path('delete_service/<int:service_id>/', views.delete_service, name='delete_service')
]
