#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from action import homeAction, topicAction,schoolmateAction, testAction,messageAction,\
    questionAction

import views

urlpatterns = patterns('',
    url(r'testjson',testAction.test1),
    url(r'test2',testAction.test2),
    url(r'showQuestionDetail',questionAction.showQuestionDetail),
    
#     url(r'^test/getFocusTopic/$', views.test_getFocusTopic),
#     url(r'^test/getSchoolTopic/$', views.test_getSchoolTopic),
#     url(r'^test/getTopicQuestion/$', views.test_getTopicQuestion),
    url(r'^test/view/$', views.topic.unitTest),
    url(r'^test/editQuestion/$', views.question.editQuestion),    
        
)