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
questionService = None;
#问题详情
def showQuestionDetail(request,question_id):
    questionService = QuestionService();
    #question_id = request.GET['question_id'];
    question_id = question_id;
    o = questionService.getQuestionDetail(question_id);
    if o!=-1:
        return render_to_response('home_test.html',{'QUESTION':o});
    return render_to_response('home_test.html');
#问题的回复及评论
def showAnswersAndComments(request,question_id):
    questionService = QuestionService();
    question_id = question_id;
    data = questionService.getAnswersAndComments(13);
    DATA = json.dumps(data,cls=CJsonEncoder);
    return HttpResponse(DATA,content_type="application/json"); #json格式返回数据
    
        
        