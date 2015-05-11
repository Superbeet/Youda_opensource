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

def topicTest(request):
    return render_to_response('topicTest.html')
    
    
@api_view(['GET'])
def getFocusTopic(request):
    print "getFocusTopic <-"
    
    page = request.GET['page']
    user_id = request.GET['user_id']
    
    print "page -> %s | user_id -> %s" %(page, user_id)
    
    focus_topic_block_list = models.TopicFocus.objects.filter(user_id = user_id)
    
    print "focus_topic_block_list -> %s" %(focus_topic_block_list)
    
    topic_data_list = []
    topic_data_fail_list = []
    
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

#     for topic_block in focus_topic_block_list:
#         print "-------------------------"
#         print "topic_block", topic_block
#         
#         topic_data_block = models.Topics.objects.get(topic_id = topic_block.topic_id)
#         
#         if topic_data_block:
#             topic_data_series = [
#                                 topic_data_block.topic_id,
#                                 topic_data_block.topic_name,
#                                 topic_data_block.parent_id,
#                                 topic_data_block.add_time,
#                                 topic_data_block.discuss_num,
#                                 topic_data_block.topic_pic,
#                                 topic_data_block.focus_num ]
#         
#             print 'topic_data_series -> %s' %topic_data_series
#             
#             topic_data_list.append(topic_data_series)
#         
#         else:
#             topic_data_fail_list.append(topic_block.topic_id)
        
    print 'topic_data_list -> %s' %topic_data_list
    print 'topic_data_fail_list -> %s' %topic_data_fail_list
    
    DATA = json.dumps(topic_data_list,cls=CJsonEncoder)
    return HttpResponse(DATA,content_type="application/json");#json格式返回数据
    
    #getMyFocus(user_id,page), user_id为当前用户id，page为请求第几页的数据    
#     rows =  focusService.getMyFocus(1, page=1);
    
    
@api_view(['GET'])
def getSchoolTopic(request):
    pass

@api_view(['POST'])
def setFocusTopic(request):
    pass


# commonDao = CommonDao();

#--------------- Page API ---------------
def index(request):
    """ Index page
    """
    return HttpResponse("Hello world!")


def topic(request):
    """ Topic page
    """
    pass

def user_detail(request):
    """ API to fetch user's detail information
    """
    pass

def question_detail(request):
    """ API to fetch question detail
    """
    pass

def question_pub(request):
    """ page to publish a question
    """
    pass

# --------------- Rest API ----------------
def comment_sub(request):
    """ API to submit a comment
    """
    pass

def question_sub(request):
    """ API to submit a question
    """
    pass

def question_list(request):
    """ API to request a paginated list of questions
    """
    pass
