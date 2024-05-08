from django.apps import AppConfig

VERBOSE_APP_NAME = '交易方式'

class CheckoutConfig(AppConfig):
    name = 'ecommerce.apps.checkout'  
    verbose_name = VERBOSE_APP_NAME