#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.conf.urls import patterns, include, url
from action import homeAction, topicAction,schoolmateAction, testAction,messageAction,\
    questionAction

from apps import views

urlpatterns = patterns('',
    url(r'testjson',testAction.test1),
    url(r'test2',testAction.test2),
    url(r'showQuestionDetail',questionAction.showQuestionDetail),
    
    url(r'^topicTest/$', views.topicTest),
)