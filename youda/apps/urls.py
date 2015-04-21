from django.conf.urls import patterns

import views

urlpatterns = patterns('',
    (r'^$', views.index),      
    (r'^question_detail/(\d+)/$',views.question_detail),   
    (r'^user_detail/(\d+)/$',views.user_detail),
    (r'^question_detail/(\d+)/$',views.question_detail),
    (r'^topic/(\d+)/$',views.topic),
          
    (r'^comment_sub/$', views.comment_sub),
    (r'^question_sub/$',views.question_sub),
    (r'^question_list/$',views.question_list),    
)
