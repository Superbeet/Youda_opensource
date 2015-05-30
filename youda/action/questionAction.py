#!/usr/bin/env python
# -*- coding: utf-8 -*-
from apps.CommonDao import CommonDao
from apps.models import Questions
from service.QuestionService import QuestionService
from django.shortcuts import render_to_response
from django.core.context_processors import request
import json
from django.http.response import HttpResponse
from util.CJsonEncoder import CJsonEncoder
from django.views.decorators.cache import cache_page
questionService = None;
#问题详情
@cache_page(1*60)
def showQuestionDetail(request,question_id):
    questionService = QuestionService();
    #question_id = request.GET['question_id'];
    question_id = question_id;
    o = questionService.getQuestionDetail(question_id);
    if o!=-1:
        return render_to_response('home_test.html',{'QUESTION':o});
    return render_to_response('home_test.html');
#问题的回复及评论,question_id 问题id，page 第几页
def showAnswersAndComments(request,question_id,page):
    questionService = QuestionService();
    question_id = question_id;
    data = questionService.getAnswersAndComments(13,1);
    DATA = json.dumps(data,cls=CJsonEncoder);
    return HttpResponse(DATA,content_type="application/json"); #json格式返回数据
    
        
        