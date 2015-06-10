#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render,render_to_response
from django.http import HttpResponse, HttpResponseRedirect
from django.template.context import RequestContext
from django.contrib import auth
from django.contrib.auth.models import User

from django.contrib.contenttypes.models import ContentType
from django.template.defaulttags import csrf_token
from django.core.context_processors import csrf

from apps import models

from rest_framework.decorators import api_view

import datetime
import json

from util.CJsonEncoder import CJsonEncoder

def editQuestion(request):
    c = {}
    c.update(csrf(request))
    response = render_to_response('editQuestionTest.html', c)  
    response.set_cookie( 'user_id', '1' )  
    return response    

@api_view(['POST'])
def submitQuestion(request):
    try:
        user_id = request.COOKIES.get('user_id')
        topic_id = str(request.POST.get('topic_id'))
            
        anonymous_flag = 1 if request.POST.get('anonymous') == 'on' else 0
        attachment_flag = 1 if request.POST.get('has_attach') == 'on' else 0
        
        print "anonymous_flag -> %s" %(anonymous_flag)
        print "attachment_flag -> %s" %(attachment_flag)
        
        question_obj = models.Questions(
            user = models.Users.objects.get(user_id = user_id),
            question_content = request.POST.get('question_content'),
            question_detail = request.POST.get('question_detail'),
            publish_time = datetime.datetime.now(),
            active_time = datetime.datetime.now(),
            anonymous = anonymous_flag,
            has_attach = attachment_flag,
        )
        
        question_obj.save()
        
        # Add value to ManytoMany field "topic"
        topic_obj = models.Topics.objects.get(topic_id = topic_id)
        
        question_obj.topic.add(topic_obj)
        
        
    except Exception, ex:
        error_response = {
            "stat":"failed",
            "code":81,
            "message":str(ex)
        }

        DATA = json.dumps(error_response,cls=CJsonEncoder)
        return HttpResponse(DATA,content_type="application/json")
    
    else:
        success_response = {
            "stat":"ok",
            "data":{
                "success":"true"
            }
        }
        
        DATA = json.dumps(success_response,cls=CJsonEncoder)
        return HttpResponse(DATA,content_type="application/json")

