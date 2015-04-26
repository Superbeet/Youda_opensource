#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
from service.FocusService import FocusService
from django.http.response import HttpResponse

focusService = None;
def index(request):
    return render_to_response('topic.html');
#添加关注话题，返回1关注成功
def focusTopic(request):
    focusService = FocusService();
    topic_id = request.POST['topic_id'];
    user_id = request.session['user_id'];
    r = focusService.addFocusTopic(user_id, topic_id);
    return HttpResponse(r); 
    
