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
from django.utils.text import phone2numeric

def test_getFocusTopic(request):
    return render_to_response('focusTopicTest.html')
    
def test_getSchoolTopic(request):
    return render_to_response('schoolTopicTest.html')

@api_view(['GET'])
def getFocusTopic(request):
    '''
    Get User's focused topics 
    
    Parameters
        page
        
        user_id
    
    
    Return
        [
            [
                topic_id,
                topic_name,
                parent_id,
                add_time,
                discuss_num,
                topic_pic,
                focus_num     
            ]
        ]
    
    
    '''
    
    page = request.GET['page']
    user_id = request.GET['user_id']
    
    print "page -> %s | user_id -> %s" %(page, user_id)
    
    focus_topic_block_list = models.TopicFocus.objects.filter(user_id = user_id)
    
    print "focus_topic_block_list -> %s" %(focus_topic_block_list)
    
    topic_data_list = []
#     topic_data_fail_list = []
    
    focus_topic_id_list = [focus_topic_block.topic_id for focus_topic_block in focus_topic_block_list]
    
    topic_data_block_list = models.Topics.objects.filter(topic_id__in = focus_topic_id_list)     
    
    for block in topic_data_block_list:
        topic_data_series = [
                                block.topic_id,
                                block.topic_name,
                                block.parent_id,
                                block.add_time,
                                block.discuss_num,
                                block.topic_pic,
                                block.focus_num     
                            ]
 
        print 'topic_data_series -> %s' %topic_data_series
     
        topic_data_list.append(topic_data_series)
        
    print 'topic_data_list -> %s' %topic_data_list
#     print 'topic_data_fail_list -> %s' %topic_data_fail_list
    
    DATA = json.dumps(topic_data_list,cls=CJsonEncoder)
    return HttpResponse(DATA,content_type="application/json");#json格式返回数据
    
    #getMyFocus(user_id,page), user_id为当前用户id，page为请求第几页的数据    
#     rows =  focusService.getMyFocus(1, page=1);
    
    
@api_view(['GET'])
def getSchoolTopic(request):
    '''
    Get topics of all user's graduated and enrolling schools
    
    Parameters
        page
        
        user_id
    
    
    Return
        [
            [
                topic_id,
                topic_name,
                parent_id,
                add_time,
                discuss_num,
                topic_pic,
                focus_num     
            ]
        ]
    
    
    '''
    
    user_id = request.GET['user_id']
    page = request.GET['page']
    
    print "page -> %s | user_id -> %s" %(page, user_id)
    
    user_info = models.UsersAffiliate.objects.get(user_id = user_id)
    
    user_school_query = user_info.school.all()

    school_id_list = [str(school_block.school_id) for school_block in user_school_query]
    
    print "school_id_list -> %s" %(school_id_list)

    topic_data_block_list = models.Topics.objects.filter(topic_school__school_id__in = school_id_list)

    
    topic_data_list = []
    
    for block in topic_data_block_list:
        topic_data_series = [
                                block.topic_id,
                                block.topic_name,
                                block.parent_id,
                                block.add_time,
                                block.discuss_num,
                                block.topic_pic,
                                block.focus_num     
                            ]
 
        print 'topic_data_series -> %s' %topic_data_series
     
        topic_data_list.append(topic_data_series)
        
    print 'topic_data_list -> %s' %topic_data_list
    

    DATA = json.dumps(topic_data_list, cls=CJsonEncoder)
    return HttpResponse(DATA, content_type="application/json");#json格式返回数据

#     user_info_list = [
# #         user_info.user,
#         user_info.email_state,
#         user_info.qq,
#         user_info.qq_state,
#         user_info.phone,
#         user_info.phone_state,
#         user_info.website,
#         user_info.website_state,
#         user_info.reg_time,
#         user_info.last_ip,
#         user_info.last_time,
#         user_info.question_num,
#         user_info.answer_num,
#         user_info.attention_topic_num,
#         user_info.community_flag,
#         user_info.community_setting,
#         user_info.school,
#         user_info.question_focus,
#         user_info.topic_focus 
#     ]
#     
#     print user_info_list

#     print "user_info -> [%s] %s" %(type(user_info), user_info)
    
#     print 'topic_data_list -> %s' %topic_data_list
# #     print 'topic_data_fail_list -> %s' %topic_data_fail_list
#     
#     DATA = json.dumps(topic_data_list,cls=CJsonEncoder)
#     return HttpResponse(DATA,content_type="application/json");#json格式返回数据

@api_view(['POST'])
def setFocusTopic(request):
    pass


# commonDao = CommonDao();