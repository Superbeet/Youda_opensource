#!/usr/bin/env python
# -*- coding: utf-8 -*-
from apps.CommonDao import CommonDao
from apps.models import Questions
from service.QuestionService import QuestionService
from django.shortcuts import render_to_response
questionService = None;
#问题详情
def showQuestionDetail(request):
    questionService = QuestionService();
    question_id = request.GET['question_id'];
    o = questionService.getQuestionDetail(question_id);
    if o!=-1:
        return render_to_response('home_test.html',{'QUESTION':o});
    return render_to_response('home_test.html');
        