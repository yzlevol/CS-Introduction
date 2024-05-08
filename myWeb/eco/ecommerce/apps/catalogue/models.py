from django.conf import settings
from django.db import models
from django.urls import reverse
from django.utils.translation import gettext_lazy as _
from mptt.models import MPTTModel, TreeForeignKey
from django.core.validators import MaxValueValidator, MinValueValidator


class Category(MPTTModel):
    """
    Category Table implimented with MPTT.
    """

    name = models.CharField(
        verbose_name=_("类别名"),
        help_text=_("Required and unique"),
        max_length=255,
        unique=True,
    )
    brief = models.CharField(
        verbose_name=_("类别简介"),
        max_length=1000,
        null=True,
    )
    slug = models.SlugField(
        verbose_name=_("安全URL"),
        max_length=255,
        help_text=_("在网页中定位到商品的唯一英文字符"),
        unique=True,
    )
    parent = TreeForeignKey(
        "self", on_delete=models.CASCADE, null=True, blank=True, related_name="children"
    )
    is_active = models.BooleanField(default=True)

    class MPTTMeta:
        order_insertion_by = ["name"]

    class Meta:
        verbose_name = _("类别")
        verbose_name_plural = _("类别")

    def get_absolute_url(self):
        return reverse("catalogue:category_list", args=[self.slug])

    def __str__(self):
        return self.name


class Product(models.Model):
    """
    The Product table contining all product items.
    """

    category = models.ForeignKey(
        Category, verbose_name=_("类别"), on_delete=models.RESTRICT
    )
    title = models.CharField(
        verbose_name=_("名称"),
        help_text=_("Required"),
        max_length=255,
    )
    quantity = models.IntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(9999)],
        default=1,
        verbose_name=_("数量"),
        help_text=_("若REQ与数量有关,则填写(默认为1)"),
        error_messages={
            "name": {
                "max_length": _("数量必须在 0 和 99 之间"),
            },
        },
    )
    description = models.TextField(
        verbose_name=_("描述"), help_text=_("添加REQ描述（选填）"), blank=True
    )
    regular_price = models.DecimalField(
        verbose_name=_("悬赏金额"),
        help_text=_("最多 9999.99 元"),
        error_messages={
            "name": {
                "max_length": _("悬赏必须在 0 和 999.99 之间"),
            },
        },
        max_digits=5,
        decimal_places=2,
        validators=[MinValueValidator(0)],
    )
    # discount_price = models.DecimalField(
    #     default=regular_price,
    #     max_digits=5,
    #     decimal_places=2,
    #     validators=[MinValueValidator(0)],
    # )
    is_active = models.BooleanField(
        verbose_name=_("REQ是否可见："),
        default=True,
    )
    created_at = models.DateTimeField(
        _("Created at"), auto_now_add=True, editable=False
    )
    updated_at = models.DateTimeField(_("Updated at"), auto_now=True)
    users_wishlist = models.ManyToManyField(
        settings.AUTH_USER_MODEL, related_name="user_wishlist", blank=True
    )
    # new feature: seller
    seller = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.RESTRICT,
        related_name="selling_product",
    )

    class Meta:
        ordering = ("-created_at",)
        verbose_name = _("REQ")
        verbose_name_plural = _("REQ")

    def get_absolute_url(self):
        return reverse("catalogue:product_detail", args=[self.pk])

    def __str__(self):
        return self.title


class ProductImage(models.Model):
    """
    The Product Image table.
    """

    product = models.ForeignKey(
        Product, on_delete=models.CASCADE, related_name="product_image"
    )
    image = models.ImageField(
        verbose_name=_("图片"),
        upload_to="images/",
        default="images/default.png",
    )
    alt_text = models.CharField(
        verbose_name=_("描述信息"),
        help_text=_("请添加图片的描述信息"),
        max_length=255,
        null=True,
        blank=True,
    )
    is_feature = models.BooleanField(
        default=False,
        verbose_name=_("是否展示"),
    )
    created_at = models.DateTimeField(auto_now_add=True, editable=False)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = _("REQ的图片")
        verbose_name_plural = _("REQ的图片")


class ProductType:
    pass


class ProductSpecificationValue:
    pass
