#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from action import homeAction, topicAction,schoolmateAction, testAction,messageAction,\
    questionAction

import views

urlpatterns = patterns('',
    # Zhang,Pan Test Urls
    url(r'testjson',testAction.test1),
    url(r'test2',testAction.test2),
    url(r'showQuestionDetail',questionAction.showQuestionDetail),
    
    # Ye,Cong Test Urls
    url(r'^test/view/$', views.topic.unitTest),
    url(r'^test/edit/question/$', views.question.editQuestion),    
        
)