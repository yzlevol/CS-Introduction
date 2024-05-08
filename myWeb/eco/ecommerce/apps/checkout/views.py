import decimal
import json
import sys

from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.shortcuts import render
from ecommerce.apps.account.models import Address
from ecommerce.apps.basket.basket import Basket
from ecommerce.apps.catalogue.models import Product
from ecommerce.apps.orders.models import Order
from ecommerce.apps.account.models import Customer
from django.shortcuts import get_object_or_404


from .models import DeliveryOptions


@login_required
def deliverychoices(request):
    deliveryoptions = DeliveryOptions.objects.filter(is_active=True)
    basket = Basket(request)
    return render(
        request,
        "checkout/delivery_choices.html",
        {"deliveryoptions": deliveryoptions, "basket": basket},
    )


def testdb(request):
    d = DeliveryOptions.objects.all()
    d.delete()
    if request.method == "GET":
        tmp = DeliveryOptions(
            delivery_name="快速",
            delivery_method="快速",
            delivery_price=0.0,
            delivery_timeframe="20231215",
            delivery_window="null",
            order="0",
        )
        tmp.save()
        tmp = DeliveryOptions(
            delivery_name="正常",
            delivery_method="正常",
            delivery_price=0.0,
            delivery_timeframe="20231207",
            delivery_window="null",
            order="0",
        )
        tmp.save()
        return HttpResponse("ok")
    else:
        return HttpResponse("wrong")


# @login_required
# def basket_update_delivery(request):
#     basket = Basket(request)
#     if request.POST.get("action") == "post":
#         delivery_option = int(request.POST.get("deliveryoption"))
#         delivery_type = DeliveryOptions.objects.get(id=delivery_option)
#         updated_total_price = basket.basket_update_delivery(
#             delivery_type.delivery_price
#         )
#
#         session = request.session
#         if "purchase" not in request.session:
#             session["purchase"] = {
#                 "delivery_id": delivery_type.id,
#             }
#         else:
#             session["purchase"]["delivery_id"] = delivery_type.id
#             session.modified = True
#
#         response = JsonResponse(
#             {
#                 "total": updated_total_price,
#                 "delivery_price": delivery_type.delivery_price,
#                 "sub_total": basket.get_subtotal_price(),
#             }
#         )
#         return response
@login_required
def basket_update_delivery(request):
    basket = Basket(request)
    if request.POST.get("action") == "post":
        delivery_option_id = int(request.POST.get("deliveryoption"))
        delivery_type = get_object_or_404(DeliveryOptions, id=delivery_option_id)
        updated_total_price = basket.basket_update_delivery(delivery_type.delivery_price)

        session = request.session
        if "purchase" not in request.session:
            session["purchase"] = {
                "delivery_id": delivery_type.id,
            }
        else:
            session["purchase"]["delivery_id"] = delivery_type.id
            session.modified = True
        basket.save()

        # 返回更新后的信息
        response = JsonResponse(
            {
                "total": updated_total_price,
                "delivery_price": delivery_type.delivery_price,
                "sub_total": basket.get_subtotal_price(),
            }
        )
        return response

@login_required
def delivery_address(request):
    session = request.session
    if "purchase" not in request.session:
        messages.success(request, "请选择交易方式")
        return HttpResponseRedirect(request.META["HTTP_REFERER"])

    addresses = Address.objects.filter(customer=request.user).order_by("-default")
    deliveryoptions = DeliveryOptions.objects.filter(is_active=True)
    basket = Basket(request)

    if addresses.count() == 0:
        return render(
            request,
            "checkout/delivery_address.html",
            {
                "addresses": addresses,
                "deliveryoptions": deliveryoptions,
                "basket": basket,
            },
        )
    elif "address" not in request.session:
        session["address"] = {"address_id": str(addresses[0].id)}

    else:
        session["address"]["address_id"] = str(addresses[0].id)
        session.modified = True

    return render(
        request,
        "checkout/delivery_address.html",
        {"addresses": addresses, "deliveryoptions": deliveryoptions, "basket": basket},
    )


@login_required
def payment_selection(request):
    session = request.session
    if "address" not in request.session:
        messages.success(request, "请选择交易方式.")
        return HttpResponseRedirect(request.META["HTTP_REFERER"])

    deliveryoptions = DeliveryOptions.objects.filter(is_active=True)
    basket = Basket(request)

    return render(request, "checkout/payment_selection.html", {"basket": basket})


# 支付
from paypalcheckoutsdk.orders import OrdersGetRequest

from .paypal import PayPalClient


@login_required
def payment_complete(request):
    print(request)
    sys.stdout.flush()

    if request.method == "GET":
        user_id = request.user.id

        customer = Customer(request)
        addresses = Address.objects.filter(customer=request.user, default=True)
        address = addresses[0]
        basket = Basket(request)

        # sg = 1
        # for item in basket:
        #     if item["qty"] > item["product"].quantity:
        #         sg = 0
        #         break
        # if sg != 1:
        #     return HttpResponse("有REQ已被派出,请重试.")
        for item in basket:
            tmp = item["product"]
            tmp.quantity = tmp.quantity - item["qty"]
            tmp.save()

        for item in basket:
            order = Order.objects.create(
                user_id=user_id,
                full_name=address.full_name,
                email=customer.email,
                address1=address.address_line,
                address2=address.address_line2,
                city=address.school,
                phone=address.phone,
                country_code=110,
                total_paid=item["qty"] * item["price"],
                order_key=0,
                payment_option="paypal",
                billing_status=True,
                product=item["product"],
                quantity=item["qty"],
            )

        basket.clear()
        return render(request, "checkout/payment_successful.html", {})
    else:
        return HttpResponse("wrong")
