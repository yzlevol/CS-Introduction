from django.db import models
from django.utils.translation import gettext_lazy as _


class DeliveryOptions(models.Model):
    DELIVERY_CHOICES = [
        ("IS", "自取"),
        ("HD", "上门"),
        ("DD", "电子方式"),
    ]

    delivery_name = models.CharField(
        verbose_name=_("交易方式"),
        help_text=_("必需"),
        max_length=255,
    )

    delivery_method = models.CharField(
        choices=DELIVERY_CHOICES,
        verbose_name=_("delivery_method"),
        help_text=_("必需"),
        max_length=255,
    )
    delivery_timeframe = models.CharField(
        verbose_name=_("delivery timeframe"),
        help_text=_("必需"),
        max_length=255,
    )
    delivery_window = models.CharField(
        verbose_name=_("delivery window"),
        help_text=_("必需"),
        max_length=255,
    )
    delivery_price = models.DecimalField(
        verbose_name=_("delivery price"),
        help_text=_("交付价格"),
        max_digits=3,
        decimal_places=1,
        null=True,
        blank=True,
    )
    order = models.IntegerField(verbose_name=_("list order"), help_text=_("必需"), default=0)
    is_active = models.BooleanField(default=True)

    class Meta:
        verbose_name = _("选项")
        verbose_name_plural = _("选项")

    def __str__(self):
        return self.delivery_name


class PaymentSelections(models.Model):
    name = models.CharField(
        verbose_name=_("name"),
        help_text=_("必需"),
        max_length=255,
    )

    is_active = models.BooleanField(default=True)

    class Meta:
        verbose_name = _("支付选项")
        verbose_name_plural = _("支付选项")

    def __str__(self):
        return self.name
