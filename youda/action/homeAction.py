#!/usr/bin/env python
# -*- coding: utf-8 -*-
from service.FocusService import FocusService
import json
from django.http.response import HttpResponse
from service.QuestionService import QuestionService
# Create your views here.
questionService = QuestionService();
focusService = FocusService();

def index(request):
    return render_to_response('home.html');
#getMyFocus(user_id,page),user_id为当前用户id，page为请求第几页的数据
def showMyFocus(request):
    #page = request.GET['page'];
    #user_id = request.GET['user_id'];
    rows =  focusService.getMyFocus(1,page=1);
    DATA = json.dumps(rows);
    return HttpResponse(DATA,content_type="application/json");#已json格式返回数据
    # request.session['name']='tomcat';
    # print request.session['name'];
    # return render_to_response('home.html',{'rows':rows});
from django.shortcuts import render_to_response


