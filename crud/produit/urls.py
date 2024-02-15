from django.urls import path
from . import views


urlpatterns = [
    path('', views.index, name='index'),
    path('product/', views.list_product, name='product'),
    path("save_product/", views.save_product, name="save_product"),
    path('manage_product', views.manage_product, name='manage_product'),
    path('delete_product/<int:product_id>/', views.delete_product, name='delete_product')
]
