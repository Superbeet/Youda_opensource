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
from action import schoolmateAction

@api_view(['GET'])
def getFocusedSchoolmate(request):
    '''
    Get User's focused schoolmates 
    
    Parameters
        page
        
        user_id
    
    Return
        length: number of return data
        
        data:
            [
                {
                    focus_id,
                    user_id,
                    schoolmate,
                    focus_time,  
                }
                ...
            ]
        
    
    '''
    
    pagesize = 10
    user_id = request.GET['user_id']
    page_num = int(request.GET['page'])

    offset = (page_num-1)*pagesize
    end = offset + pagesize
    
    print "page -> %s | user_id -> %s" %(page_num, user_id)
    print "offset -> %s | end -> %s" %(offset, end) 

    focus_user_query = models.UsersFocus.objects.filter(user_id = user_id)
    
    return_data_list = []
    schoolmate_list= []
    
    for q in focus_user_query:
        print "schoolmate_id > %s" %(q.schoolmate_id)
        schoolmate_list.append(q.schoolmate_id)
#     
#     print "schoolmate_list ->", schoolmate_list
#     
#     topic_data_list = []
#     
#     focus_topic_id_list = [focus_topic_block.topic_id for focus_topic_block in focus_topic_block_list]
#     
#     topic_data_block_list = models.Topics.objects.filter(topic_id__in = focus_topic_id_list)[offset:end]    
#     
#     for b in topic_data_block_list:
        data_dict = {
                        "user_id":  q.user_id,
                        "focus_time": q.focus_time,    
                    }

        return_data_list.append(data_dict)
        
    print 'data_list -> %s' %(return_data_list)

    result = {
                "length": len(return_data_list),
                "data": return_data_list,
             }
    
    print "result -> %s" %(result)
    
    DATA = json.dumps(return_data_list,cls=CJsonEncoder)
    return HttpResponse(DATA,content_type="application/json");#json格式返回数据

