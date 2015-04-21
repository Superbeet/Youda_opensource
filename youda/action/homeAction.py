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
from YoudaBE import settings
# Create your views here.
questionService = QuestionService();

def showAllQuestions(request):
    questions = questionService.getAllQuestions();
#     t =  get_template("index.html")
#     html = t.render(Context({
#         "template_dir":settings.TEMPLATE_DIRS[0],
#         "title":"Home",
#         "static_dir":settings.STATIC_URL}))
#     return HttpResponse(html)
    return render_to_response('home.html',{'questions':questions['LIST']})