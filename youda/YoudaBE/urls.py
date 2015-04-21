from django.conf.urls import patterns, include, url
from django.contrib import admin
from action import homeAction, topicAction

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'YoudaBE.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^home/$',homeAction.showAllQuestions),
    #url(r'^message',views.message),
    url(r'^topic',topicAction.showtopic),
    #url(r'^schooler',views.schooler),
    
)
