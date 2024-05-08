from django.apps import AppConfig

VERBOSE_APP_NAME = 'OD List'

class BasketConfig(AppConfig):
    name = 'ecommerce.apps.basket'  
    verbose_name = VERBOSE_APP_NAME