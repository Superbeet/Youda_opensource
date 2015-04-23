from django.conf.urls import patterns,include, url
from django.template.loader import get_template
from django.template import Context
import views

urlpatterns = patterns('',
    (r'^$', views.index),    
    (r'^question_pub/$',views.question_pub),
    
    (r'^topic/(\d+)/$',views.topic),
    (r'^user_detail/(\d+)/$',views.user_detail), 
    (r'^question_detail/(\d+)/$',views.question_detail),    
    
    (r'^comment_sub/$', views.comment_sub),
    (r'^question_sub/$',views.question_sub),    
    (r'^question_list/$',views.question_sub),  
    
)