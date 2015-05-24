#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
from service.FocusService import FocusService
from django.http.response import HttpResponse
from django.db import transaction
import json
from django.core.context_processors import request

focusService = None;
def index(request):
    return render_to_response('topic.html');
#添加关注话题，返回1关注成功
def focusTopic(request):
    focusService = FocusService();
    topic_id = request.GET['topic_id'];
    #user_id = request.session['user_id'];
    r = focusService.addFocusTopic(1, topic_id);
    data = {'status':r}
    DATA = json.dumps(data);
    return HttpResponse(DATA,content_type="application/json"); #json格式返回数据
#话题推荐.有点问题？？？？
def recommendTopic(request):
    pass;
