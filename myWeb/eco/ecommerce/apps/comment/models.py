from django.db import models
from django.urls import reverse
from ecommerce.apps.orders.models import Order
from ecommerce.apps.catalogue.models import Product
from django.contrib.auth.models import User
from django.conf import settings  # 确保添加这一行导入


class Comment(models.Model):

    order = models.OneToOneField(
        Order,
        related_name='comments',
        on_delete=models.CASCADE,
        blank=True,
        null=True,
    )
    body = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    product = models.ForeignKey(Product, related_name='comments', on_delete=models.CASCADE)

    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='username',on_delete=models.CASCADE)


    class Meta:
        ordering = ('created',)
        verbose_name = "评论"
        verbose_name_plural = "评论"


    def __str__(self):
        return self.body[:20]

    def get_absolute_url(self):
        return reverse("comment:post_comment_anyone")
