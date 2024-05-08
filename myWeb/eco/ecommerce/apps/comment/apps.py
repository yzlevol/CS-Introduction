from django.apps import AppConfig

VERBOSE_APP_NAME = '评论'

class CommentConfig(AppConfig):
    name = 'ecommerce.apps.comment'  
    verbose_name = VERBOSE_APP_NAME