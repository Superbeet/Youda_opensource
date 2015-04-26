#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from django.contrib import admin
from action import homeAction, topicAction,schoolmateAction, testAction

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'YoudaBE.views.home', name='home'),
    url(r'^$',homeAction.index),#默认显示home页
    url(r'^home',homeAction.index),#显示home页
    url(r'^focus/$',homeAction.showMyFocus),#获得我的关注下面所有内容，返回值为list中放map，key见函数
    #url(r'^message',views.message),
    url(r'^topic/$',topicAction.index),#显示话题页
    url(r'^focustopic/$',topicAction.focusTopic),#关注话题
    url(r'^schooler/$',schoolmateAction.index),#显示校友页
    url(r'focusschoolmate',schoolmateAction.focusSchoolmate),#关注校友
    url(r'hotquestions',homeAction.showHotQuestions),
    #url(r'^message',messageAction.index),
)
#用于测试
urlpatterns +=patterns('',
    url(r'testjson',testAction.test1),
    url(r'test2',testAction.test2),
                       
)