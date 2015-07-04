#!/usr/bin/env python
# -*- coding: utf-8 -*-
from service.FocusService import FocusService
import json
from django.http.response import HttpResponse
from service.QuestionService import QuestionService
from django.shortcuts import render_to_response
from util.CJsonEncoder import CJsonEncoder
from util.default_class import default_class
from django.core.context_processors import request
# Create your views here.
questionService = None;
focusService = None;

def index(request):
    USER = {};
    if 'userName' in request.session:
        USER['user_name'] = request.session['userName'];
    else:
        USER['user_name']="游客";
    if 'schoolName' in request.session:
        USER['school_name'] = request.session['schoolName'];
    print USER;
    return render_to_response('home.html',{'USER':USER});

def answer_detail(request):
    return render_to_response('answer_detail.html');
#显示我的关注下的所有内容
def showMyFocus(request):
    #print request.session['update_time'];
    focusService = FocusService();
    #page = request.GET['page'];
    #del request.session['user_id'];
    if 'userId' in request.session:
        user_id = request.session['userId'];
        print 'session_user_id=>%s'%user_id;
    else:
        print 'connot find userId in session';
    defaultO = default_class();
    defaultO.getSession();
    school_id = request.session['schoolId'];
  
    #uName = request.COOKIES['USERNAME'];
    #print request.POST['pass'];
    #print "用户名"+uName;
    rows =  focusService.getMyFocus(user_id,page=1,school_id=school_id);#getMyFocus(user_id,page),user_id为当前用户id，page为请求第几页的数据
    DATA = json.dumps(rows,cls=CJsonEncoder);
    return HttpResponse(DATA,content_type="application/json");#json格式返回数据
    # request.session['name']='tomcat';
    # print request.session['name'];
    # return render_to_response('home.html',{'rows':rows});
#显示本校热门问答
def showHotQuestions(request):
    questionService = QuestionService();
    #school_name = request.session['school_name'];
    rows = questionService.getHotQuestions(1,1);#
    DATA = json.dumps(rows,cls=CJsonEncoder);
    return HttpResponse(DATA,content_type="application/json");#json格式返回数据

#他在求助 
def showHelpfulQuestions(request):
    #user_id = request.GET['user_id'];
    questionService = QuestionService();
    rows = questionService.getHelpfulQuestions(1)#传入user_id
    DATA = json.dumps(rows,cls=CJsonEncoder);
    return HttpResponse(DATA,content_type="application/json");#json格式返回数据
    
