from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import get_object_or_404, redirect, render
from django.urls import reverse

from ecommerce.apps.orders.models import Order

from .forms import CommentForm
from .models import Comment  # Import your Comment model or adjust as needed
# from .models import CommentUser


@login_required
def post_comment(request, order_id):
    order = get_object_or_404(Order, id=order_id)
    try:
        m=order.comments
        messages.success(request, "你已经评价过了!")
        return HttpResponseRedirect(request.META["HTTP_REFERER"])
    except:
        if request.method == 'POST':
            comment_form = CommentForm(request.POST)
            if comment_form.is_valid():
                new_comment = comment_form.save(commit=False)
                new_comment.order = order
                new_comment.save()
                return redirect(reverse("account:user_orders"))
            else:
                return HttpResponse("Error!请重试.")

        elif request.method == 'GET':
            return render(request, 'comment/post_comment.html')
        else:
            return HttpResponse("请使用POST 或 GET。")


from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from .forms import CommentForm
from .models import Comment

# @login_required
# def post_comment_anyone(request): #任何人都可以评论
#     if request.method == 'POST':
#         comment_form = CommentForm(request.POST)
#         product_id = request.POST.get('product_id')
#
#         print(product_id)
#         if comment_form.is_valid():
#             comment_body = comment_form.cleaned_data['body']
#
#             new_comment = Comment(body=comment_body,product_id=product_id)
#             new_comment.save()
#             return redirect(reverse("account:user_orders"))
#         else:
#             return HttpResponse("Error! 请重试。")
#     else:
#         return HttpResponse("请使用 POST 方法。")

@login_required
def post_comment_anyone(request, product_id):
    if request.method == 'POST':
        comment_form = CommentForm(request.POST)

        if comment_form.is_valid():
            comment_body = comment_form.cleaned_data['body']
            # 从请求中获取当前用户
            user_id = request.user.id
            new_comment = Comment(body=comment_body, product_id=product_id,user_id=user_id)
            new_comment.save()
            return redirect(f'http://127.0.0.1:8000/{product_id}')
        else:
            return HttpResponse("Error! 请重试。")
    else:
        return HttpResponse("请前往商品页进行评论~")