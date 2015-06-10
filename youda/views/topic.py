#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render,render_to_response
from django.http import HttpResponse, HttpResponseRedirect
from django.template.context import RequestContext
from django.contrib import auth
from django.contrib.auth.models import User

from django.contrib.contenttypes.models import ContentType
from apps import models

from rest_framework.decorators import api_view

import datetime
import json

from util.CJsonEncoder import CJsonEncoder
from action import topicAction

def unitTest(request):
    response = render_to_response('viewTest.html')  
    response.set_cookie( 'user_id', '1' )  
    return response
    
@api_view(['GET'])
def getFocusTopic(request):
    '''
    Get data of user's focused topics 
    
    Parameters

        page (necessary)
            page number
 
        user_id (necessary)
            user id
        
        page_size (optional)
            page size (default = 10)
    
    Return
    
        {
            length: number of return data
            
            data:
                [
                    {
                        "topic_id": topic_id,
                        "topic_name": topic_name,
                        "parent_id": parent_id,
                        "add_time": add_time,
                        "discuss_num": discuss_num,
                        "topic_pic": topic_pic,
                        "focus_num": focus_num,      
                    }
                    ...
                ]
        }
    
    '''
    user_id = request.GET['user_id']
    page_num = int(request.GET['page'])
    
    if 'page_size' in request.GET:
        page_size = request.GET['page_size']
    else:
        page_size = 10

    offset = (page_num-1)*page_size
    end = offset + page_size
    
    print "page -> %s | user_id -> %s" %(page_num, user_id)
    print "offset -> %s | end -> %s" %(offset, end) 
    
    focus_topic_block_list = models.TopicFocus.objects.filter(user_id = user_id)
    
    print "focus_topic_block_list -> %s" %(focus_topic_block_list)
    
    topic_data_list = []
    
    focus_topic_id_list = [focus_topic_block.topic_id for focus_topic_block in focus_topic_block_list]
    
    topic_data_block_list = models.Topics.objects.filter(topic_id__in = focus_topic_id_list)[offset:end]    
    
    for block in topic_data_block_list:
        data_dict = {
                        "topic_id": block.topic_id,
                        "topic_name": block.topic_name,
                        "parent_id": block.parent_id,
                        "add_time": block.add_time,
                        "discuss_num": block.discuss_num,
                        "topic_pic": block.topic_pic,
                        "focus_num": block.focus_num,     
                    }
        
        topic_data_list.append(data_dict)

    result = {
                "length": len(topic_data_list),
                "data": topic_data_list,
             }
    
    print "result -> %s" %(result)
    
    DATA = json.dumps(topic_data_list,cls=CJsonEncoder)
    return HttpResponse(DATA,content_type="application/json");#json格式返回数据
    
@api_view(['GET'])
def getSchoolTopic(request):
    '''
    Get topics of all user's graduated and enrolling schools
    
    Parameters

        page (necessary)
            page number
 
        user_id (necessary)
            user id
        
        page_size (optional)
            page size (default = 10)
    
    Return Value
    
        {
            length: number of return data
            
            data:[
                    {
                        "topic_id": topic id,
                        "topic_name": topic name,
                        "parent_id": parent id,
                        "add_time": add time,
                        "discuss_num": discuss number,
                        "topic_pic": topic picture,
                        "focus_num": focus number       
                    },
                    ...
                ]
        }
        
    
    '''
    
    page_size = 10
    user_id = request.GET['user_id']
    page_num = int(request.GET['page'])

    offset = (page_num-1)*page_size
    end = offset + page_size
    
    print "page -> %s | user_id -> %s" %(page_num, user_id)
    print "offset -> %s | end -> %s" %(offset, end) 
    
    user_info = models.UsersAffiliate.objects.get(user_id = user_id)
    
    user_school_query = user_info.school.all()

    school_id_list = [str(school_block.school_id) for school_block in user_school_query]
    
    print "school_id_list -> %s" %(school_id_list)

    topic_data_block_list = models.Topics.objects.filter(topic_school__school_id__in = school_id_list)[offset:end]

    
    topic_data_list = []
    
    for block in topic_data_block_list:
        data_dict = {
                        "topic_id": block.topic_id,
                        "topic_name": block.topic_name,
                        "parent_id": block.parent_id,
                        "add_time": block.add_time,
                        "discuss_num": block.discuss_num,
                        "topic_pic": block.topic_pic,
                        "focus_num": block.focus_num     
                    }
 
        topic_data_list.append(data_dict)

    result = {
                "length": len(topic_data_list),
                "data": topic_data_list
             }
    
    print "result -> %s" %(result)

    DATA = json.dumps(result, cls=CJsonEncoder)
    return HttpResponse(DATA, content_type="application/json");#json格式返回数据


@api_view(['GET'])
def getTopicQuestion(request):
    '''
    Get questions' brief information under a certain topic

    Parameters

        page_num (necessary)
            page number
 
        topic_id (necessary)
            topic id
        
        page_size (optional)
            page size (default = 10)
    
    return
    
        {
            length: number of return data
            
            data:[
                    {
                        "question_id":  question id,
                        "question_content": question content,
                        "browse_num":   browse number,
                        "answer_num":   answer number,
                        "want_answer_num":  want answer number,
                        "attention_num":    attention number,
                        "invitation_num":   invation number,
                        "user_id":  user id,
                        "user_name": user name,
                    },
                    ...
                ]
        }
        
    
    '''
    page_size = 10

    topic_id = request.GET['topic_id']
    page_num = int(request.GET['page'])

    if 'page_size' in request.GET:
        page_size = request.GET['page_size']
    else:
        page_size = 10

    offset = (page_num-1)*page_size
    end = offset + page_size
    
    print "page_num -> %s | topic_id -> %s" %(page_num, topic_id) 
    print "offset -> %s | end -> %s" %(offset, end) 
        
    question_query = models.Topics.objects.get(topic_id = topic_id).questions_set.all()[offset:end]
    
    question_data_list = []
    
    for q in question_query:
        data_dict = {
                    "question_id":  q.question_id,
                    "question_content": q.question_content,
                    "browse_num":   q.browse_num,
                    "answer_num":   q.answer_num,
                    "want_answer_num":  q.want_answer_num,
                    "attention_num":    q.attention_num,
                    "invitation_num":   q.invation_num,
                    "user_id":  q.user.user_id,
                    "user_name": q.user.user_name,
                }
        
        question_data_list.append(data_dict)
    
    result = {
                "length": len(question_data_list),
                "data": question_data_list
             }
    
    print "result -> %s" %(result)
    
    DATA = json.dumps(result, cls=CJsonEncoder)
    return HttpResponse(DATA, content_type="application/json"); # json格式返回数据

@api_view(['POST'])
def setFocusTopic(request):
    '''
    Follow a topic
    ( Duplicate implementation, call the original function in topicAction.py )
    
    Parameters

        page_num (necessary)
            page number
 
        topic_id (necessary)
            topic id
    
    '''
    topicAction.focusTopic(request)
    
    