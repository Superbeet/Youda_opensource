#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render, render_to_response
from django.http import HttpResponse
from apps.CommonDao import CommonDao
from apps.models import Users
from django.core.context_processors import request
from service.QuestionService import QuestionService
from django.template.loader import get_template
from django.template.context import Context

from service.FocusService import FocusService
import json
# Create your views here.
questionService = QuestionService();
focusService = FocusService();

def showAllQuestions(request):
    questions = questionService.getAllQuestions();
    return render_to_response('home.html',{'questions':questions['LIST']})

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
