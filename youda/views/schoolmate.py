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
def getFocusedSchoolmateData(request):
    '''
    Get User's focused schoolmates 
    
    Parameters
        page
        
        user_id
    
    Return
        {
        
            "user_id": user_id,
        
            "length": length,
        
            "data": [
                        {
                            "schoolmate_id": schoolmate_id,
                            "question_data": [
                                {
                                    "question_id":question_id,
                                    "question_content": question_content,
                                }
                                ....
                                ....
                            ]
                        }
                        ....
                        {
                            "schoolmate_id": schoolmate_id,
                            "question_data": [
                                {
                                    "question_id":question_id,
                                    "question_content": question_content,
                                }
                                ....
                                ....
                            ]
                        }
                    ]
        
        }
        
    '''
    
    pagesize = 10
    user_id = request.GET['user_id']
    page_num = int(request.GET['page'])

    offset = (page_num-1)*pagesize
    end = offset + pagesize
    
    print "page -> %s | user_id -> %s" %(page_num, user_id)
    print "offset -> %s | end -> %s" %(offset, end) 

    focus_user_query = models.UsersFocus.objects.filter(user_id = user_id)
    
    schoolmate_list= []
    
    data = []
    
    for f in focus_user_query:
        
        schoolmate_id = str(f.schoolmate_id)
#         print "schoolmate_id > %s" %(schoolmate_id)
        schoolmate_list.append(schoolmate_id)
        
        question_query = models.Questions.objects.filter(user_id = schoolmate_id)
        
        question_data_list = []
        
        for q in question_query:
            question_data = {
                        "question_id": q.question_id,
                        "question_content": q.question_content,
            }
            
            question_data_list.append(question_data)
        
        schoolmate_data = {
            "schoolmate_id": schoolmate_id,
            "question_data": question_data_list
        }
        
        data.append(schoolmate_data)
    
    result = {
        "user_id": user_id,
        "length": str(len(data)),
        "data": data  
    }
    
    print "result -> %s" %(result)
    
    DATA = json.dumps(result,cls=CJsonEncoder)
    return HttpResponse(DATA,content_type="application/json");  # json格式返回数据

