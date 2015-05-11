#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from django.contrib import admin
from action import homeAction, topicAction, schoolmateAction, messageAction,\
    questionAction
        
from apps import views

import urls_test

urlpatterns = patterns('',
    url(r'', include(urls_test)),
    # Examples:
    # url(r'^$', 'YoudaBE.views.home', name='home'),
    url(r'^$',homeAction.index),#默认显示home页
    url(r'^home',homeAction.index),#显示home页
    url(r'^message',messageAction.index),#显示message页
    url(r'^answer_detail',homeAction.answer_detail),
    url(r'^focus/$',homeAction.showMyFocus),#获得我的关注下面所有内容，返回值为list中放map，key见函数
    #url(r'^message',views.message),
    url(r'^topic/$',topicAction.index),#显示话题页
    url(r'^focustopic/$',topicAction.focusTopic),#关注话题
    url(r'^schooler/$',schoolmateAction.index),#显示校友页
    url(r'focusschoolmate/$',schoolmateAction.focusSchoolmate),#关注校友
    url(r'hotquestions/$',homeAction.showHotQuestions),#本校热门问答
    url(r'helpquestions/$',homeAction.showHelpfulQuestions),#TA在求助
    url(r'questiondetail/question/(\d+)/$',questionAction.showQuestionDetail),#问题详情的问题
    url(r'questiondetail/answer/(\d+)/(\d+)$',questionAction.showAnswersAndComments),#问题详情的问题回复
    #url(r'^message',messageAction.index),
)

urlpatterns += patterns('',
    url(r'^getFocusTopic/',views.getFocusTopic),#默认显示home页
#     url(r'^home',homeAction.index),#显示home页
#     url(r'^message',messageAction.index),#显示message页    
)
