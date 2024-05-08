from decimal import Decimal
import sys
from django.conf import settings
from ecommerce.apps.catalogue.models import Product
from ecommerce.apps.checkout.models import DeliveryOptions


class Basket:

    def __init__(self, request):
        self.session = request.session
        basket = self.session.get(settings.BASKET_SESSION_ID)
        if settings.BASKET_SESSION_ID not in request.session:
            basket = self.session[settings.BASKET_SESSION_ID] = {}
        self.basket = basket

    # def add(self, product, qty):
    #     product_id = str(product.id)
    #
    #     if product_id in self.basket:
    #         self.basket[product_id]["qty"] = qty
    #     else:
    #         self.basket[product_id] = {"price": str(product.regular_price), "qty": qty}
    #
    #     self.save()
    def add(self, product, qty):
        try:
            # 确保 product 参数是有效的 Product 实例
            assert isinstance(product, Product)
            assert qty >= 0  # 确保 qty 大于零

            product_id = str(product.id)

            if product_id in self.basket:
                # 如果 product_id 已经存在于购物篮中，更新数量
                self.basket[product_id]["qty"] = qty
            else:
                # 否则，创建新的条目
                self.basket[product_id] = {"price": str(product.regular_price), "qty": qty}

            self.save()

            return {"success": True}

        except AssertionError:
            # 处理错误，返回相应的错误信息
            return {"error": "Invalid product or quantity."}

    def __iter__(self):
        product_ids = self.basket.keys()
        products = Product.objects.filter(id__in=product_ids)
        basket = self.basket.copy()

        for product in products:
            basket[str(product.id)]["product"] = product

        for item in basket.values():
            item["price"] = Decimal(item["price"])
            item["total_price"] = item["price"] * item["qty"]
            yield item

    def __len__(self):
        return sum(item["qty"] for item in self.basket.values())

    def update(self, product, qty):
        product_id = str(product)
        if product_id in self.basket:
            self.basket[product_id]["qty"] = qty
        self.save()

    def get_subtotal_price(self):
        subtotal = sum(Decimal(item["price"]) * item["qty"] for item in self.basket.values())
        # print(subtotal)
        # sys.stdout.flush()
        return Decimal(subtotal)

    def get_delivery_price(self):
        newprice = 0.00

        if "purchase" in self.session:
            newprice = DeliveryOptions.objects.get(id=self.session["purchase"]["delivery_id"]).delivery_price

        return newprice

    def get_total_price(self):
        newprice = 0.00
        subtotal = sum(Decimal(item["price"]) * item["qty"] for item in self.basket.values())
        if "purchase" in self.session:
            newprice = DeliveryOptions.objects.get(id=self.session["purchase"]["delivery_id"]).delivery_price

        total = subtotal + Decimal(newprice)
        # total = subtotal
        return total

    def basket_update_delivery(self, deliveryprice=0):
        subtotal = sum(Decimal(item["price"]) * item["qty"] for item in self.basket.values())
        total = subtotal + Decimal(deliveryprice)
        # print(subtotal, deliveryprice, total)
        # sys.stdout.flush()
        return total
        # return subtotal

    def delete(self, product):
        """
        Delete item from session data
        """
        product_id = str(product)

        if product_id in self.basket:
            del self.basket[product_id]
            self.save()

    def clear(self):
        # Remove basket from session
        del self.session[settings.BASKET_SESSION_ID]
        del self.session["address"]
        del self.session["purchase"]
        self.save()

    def save(self):
        self.session.modified = True
