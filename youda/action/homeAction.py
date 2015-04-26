#!/usr/bin/env python
# -*- coding: utf-8 -*-
from service.FocusService import FocusService
import json
from django.http.response import HttpResponse
from service.QuestionService import QuestionService
from django.shortcuts import render_to_response
from util.CJsonEncoder import CJsonEncoder
# Create your views here.
questionService = None;
focusService = None;

def index(request):
    return render_to_response('home.html');
#显示我的关注下的所有内容
def showMyFocus(request):
    focusService = FocusService();
    #page = request.GET['page'];
    #user_id = request.GET['user_id'];
    rows =  focusService.getMyFocus(1,page=1);#getMyFocus(user_id,page),user_id为当前用户id，page为请求第几页的数据
    DATA = json.dumps(rows,cls=CJsonEncoder);
    return HttpResponse(DATA,content_type="application/json");#json格式返回数据
    # request.session['name']='tomcat';
    # print request.session['name'];
    # return render_to_response('home.html',{'rows':rows});
#显示热门问答
def showHotQuestions(request):
    questionService = QuestionService();
    #school_name = request.session['school_name'];
    rows = questionService.getHotQuestions('nupt',1);#
    DATA = json.dumps(rows,cls=CJsonEncoder);
    return HttpResponse(DATA,content_type="application/json");#json格式返回数据



