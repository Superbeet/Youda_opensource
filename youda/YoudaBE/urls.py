#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from django.contrib import admin
from action import homeAction, topicAction,schoolmateAction,messageAction

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'YoudaBE.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    #url(r'^home/$',homeAction.showAllQuestions),
    #url(r'^focus/$',homeAction.showMyFocus),#获得我的关注下面所有内容，返回值为list中放map，key见函数
    #url(r'^message',messageAction.message),
    url(r'^topic',topicAction.index),
    url(r'^schooler',schoolmateAction.index),
    url(r'^home',homeAction.index),
    url(r'^$',homeAction.index),
    url(r'^message',messageAction.index),
    
)
