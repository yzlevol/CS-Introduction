from django.apps import AppConfig

VERBOSE_APP_NAME = 'OD List'

class OrdersConfig(AppConfig):
    name = 'ecommerce.apps.orders'  
    verbose_name = VERBOSE_APP_NAME