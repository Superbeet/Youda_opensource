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
    
    Successful Return
    
        {
            "stat":"ok",   
             
            "data": {
                        length: number of return data
                        
                        data:
                            [
                                {
                                    "topic_id": topic id,
                                    "topic_name": topic name,
                                    "parent_id": parent id,
                                    "add_time": added time,
                                    "discuss_num": discuss number,
                                    "topic_pic": topic picture,
                                    "focus_num": focus number,      
                                }
                                ...
                            ]
                    }
        }
        
    '''
    try:
        user_id = request.GET['user_id']
        page_num = int(request.GET['page'])
        
        if 'page_size' in request.GET:
            page_size = int(request.GET['page_size'])
        else:
            page_size = 10
    
        offset = (page_num-1)*page_size
        end = offset + page_size
        
        print "page -> %s | user_id -> %s" %(page_num, user_id)
        print "offset -> %s | end -> %s" %(offset, end) 
        
        focus_topic_id_list = models.TopicFocus.objects.filter(user_id = user_id).values_list('topic_id', flat = True)
        
        print "focus_topic_id_list -> %s" %(focus_topic_id_list)
        
        topic_data_block_list = models.Topics.objects.filter(topic_id__in = focus_topic_id_list)[offset:end]    

        topic_data_list = []
        
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
            "data":result
        }
        
        DATA = json.dumps(success_response,cls=CJsonEncoder)
        return HttpResponse(DATA,content_type="application/json")
    
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
    
    Successful Return
    
        {
            "school_num": school number,
            
            "topic_num": total topic numbers under all schools,
            
            "data":[  
                    {
                        "school_id":   school id,
                        
                        "school_name"：    school name,
                        
                        "topic_data":  [
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
                                        
                    },
                    ...
                     
                ]            
        }
    
    '''
    try:
        page_size = 10
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
        
        user_info = models.UsersAffiliate.objects.get(user_id = user_id)
        
        school_list = user_info.school.all().values_list('school_id','school_name')

        print "school_list -> %s" %(school_list)
        
        school_num = len(school_list)
        subpage_size = page_size/school_num
        sub_offset = (page_num-1)*subpage_size
        sub_end = sub_offset + subpage_size
        
        print "sub_offset -> %s | sub_end -> %s" %(sub_offset, sub_end) 
        
        topic_num = 0
        
        data_list = []
        
        for school_id,school_name in school_list:
            
            topic_data_block_list = models.Topics.objects.filter( topic_school__school_id = school_id )[sub_offset:sub_end]
        
            topic_data_list = []
            
            
            for block in topic_data_block_list:
                topic_data_dict = {
                                "topic_id": block.topic_id,
                                "topic_name": block.topic_name,
                                "parent_id": block.parent_id,
                                "add_time": block.add_time,
                                "discuss_num": block.discuss_num,
                                "topic_pic": block.topic_pic,
                                "focus_num": block.focus_num     
                            }
         
                topic_data_list.append(topic_data_dict)
        
            school_data_dict = {
                            "school_id": school_id,  
                            "school_name": school_name,
                            "topic_data": topic_data_list,
                        }
            
            data_list.append(school_data_dict)
        
        topic_num += len(topic_data_dict)
        
        result = {
                    "school_num": school_num,
                    "topic_num": topic_num,
                    "length": len(topic_data_list),
                    "data": data_list,
                 }
        
        print "result -> %s" %(result)

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
            "data":result
        }
        
        DATA = json.dumps(success_response,cls=CJsonEncoder)
        return HttpResponse(DATA,content_type="application/json")


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
            "stat":"ok",   
             
            "data": {
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
        }
    
    '''
    try:
        page_size = 10
    
        topic_id = request.GET['topic_id']
        page_num = int(request.GET['page'])
    
        if 'page_size' in request.GET:
            page_size = int(request.GET['page_size'])
        else:
            page_size = 10
    
        offset = (page_num-1)*page_size
        end = offset + page_size
        
        print "page_num -> %s | topic_id -> %s" %(page_num, topic_id) 
        print "offset -> %s | end -> %s" %(offset, end) 
            
        question_query = models.Topics.objects.get(topic_id = topic_id).all_questions.all()[offset:end]
        
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
            "data":result
        }
        
        DATA = json.dumps(success_response,cls=CJsonEncoder)
        return HttpResponse(DATA,content_type="application/json")
    
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
    result = topicAction.focusTopic(request)
    return result
    