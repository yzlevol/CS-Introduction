from django.urls import path
from . import views
from .views import post_comment
from .views import post_comment_anyone

app_name = 'comment'

urlpatterns = [
    # 发表评论
    # path('post-comment/', views.post_comment, name='post_comment'),
    #path('post_comment_anyone/', post_comment_anyone, name='post_comment_anyone'),
    path('<int:product_id>/', post_comment_anyone, name='post_comment_anyone'),
    #path('comment/', post_comment_anyone, name='post_comment_anyone'),
    #path('comment/<int:product_id>/', post_comment_anyone, name='post_comment_anyone_with_product_id'),


]

