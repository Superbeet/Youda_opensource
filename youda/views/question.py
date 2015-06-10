#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render,render_to_response
from django.http import HttpResponse, HttpResponseRedirect
from django.template.context import RequestContext
from django.contrib import auth
from django.contrib.auth.models import User

from django.contrib.contenttypes.models import ContentType
from django.template.defaulttags import csrf_token

from apps import models

from rest_framework.decorators import api_view

import datetime
import json

from util.CJsonEncoder import CJsonEncoder

def editQuestion(request):
    response = render_to_response('editQuestionTest.html')  
    response.set_cookie( 'user_id', '1' )  
    return response    

# @csrf_token 
def submitQuestion(request):
    user_id = request.COOKIES.get('user_id')
    topic_id = str(request.POST.get('topic_id'))

    question_obj = models.Questions.objects.create(
#         title = request.POST.get('title'),
#         category = models.Category.objects.get(name = bbs_category),
#         content = request.POST.get('content'),
#         author = models.BBS_user.objects.get(user_username = 'root'),
#         modify_date = datetime.datetime.now()
        
        user = models.Users.objects.get(user_id = user_id),
        question_content = request.POST.get('question_content'),
        question_detail = request.POST.get('question_detail'),
#         topic = models.Topics.objects.get(topic_id = topic_id),
        publish_time = datetime.datetime.now(),
        active_time = datetime.datetime.now(),
        
#         browse_num = request.POST.get('browse_num'),
#         answer_num = request.POST.get('answer_num'),
#         want_answer_num = request.POST.get('want_answer_num'),
#         attention_num = request.POST.get('attention_num'),
#         invation_num = request.POST.get('invation_num'),
#         anonymous = request.POST.get('anonymous'),

#         has_attach = request.POST.get('has_attach'),
    )
    
    question_obj.save()
    
#     topic_obj = models.Topics.objects.create(topic_id = topic_id)    # add a topic
#     question_obj.topic.add(models.Topics.objects.get(topic_id = topic_id))
    
    
    return HttpResponse('Your article has been submitted!')

