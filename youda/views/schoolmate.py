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
    Get activity data of focused classmates for a certain user 
    
    Parameters
        page (necessary)
            page number
 
        user_id (necessary)
            user id
        
        page_size (optional)
            page size (default = 10)
        
        activity_max_num (optional)
            the maximum number of return activities for each classmate
    
    Successful Return
    
        {
            "stat":"ok",
            
            "data":{ 
                        "user_id": user_id,
                    
                        "length": length,
                    
                        "schoolmate_data": [
                                    {
                                        "school_id": school id,
                                        "schoolmate_id": schoolmate id,
                                        "question_data": [
                                            {
                                                "question_id": question id,
                                                "question_content": question content,
                                            }
                                            ....
                                            ....
                                        ]
                                    }
                                    ....
                                    {
                                        "school_id": school id,
                                        "schoolmate_id": schoolmate id,
                                        "question_data": [
                                            {
                                                "question_id": question id,
                                                "question_content": question content,
                                            }
                                            ....
                                            ....
                                        ]
                                    }
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
        
        if 'activity_max_num' in request.GET:
            activity_max_num = request.GET['activity_max_num']
        else:
            activity_max_num = 5
        
        
        offset = (page_num-1)*page_size
        end = offset + page_size
        
        print "page -> %s | user_id -> %s" %(page_num, user_id)
        print "offset -> %s | end -> %s" %(offset, end) 
    
        focus_user_id_list = models.UsersFocus.objects.filter(user_id = user_id).values_list('schoolmate_id', flat = True)[offset:end]
        
#         schoolmate_list= []
        
        data = []
        
        for schoolmate_id in focus_user_id_list:
            
    #         print "schoolmate_id > %s" %(schoolmate_id)
    
#             schoolmate_list.append(schoolmate_id)
            
            question_query = models.Questions.objects.filter(user_id = schoolmate_id)[0:activity_max_num]

            question_data_list = []
            
            for q in question_query:
                question_data = {
                    "question_id": q.question_id,
                    "question_content": q.question_content,
                    "publish_time": q.publish_time,
                    "active_time": q.active_time,
                }
                
                question_data_list.append(question_data)
            
            schoolmate_data = {
                "schoolmate_id": schoolmate_id,
                "question_data": question_data_list,
            }
            
            data.append(schoolmate_data)
        
        result = {
            "user_id": user_id,
            "length": str(len(data)),
            "schoolmate_data": data  
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
def getPopularSchoolmateData(request):
    '''
    Get activity data of popular/hot classmates for a certain user 
    
    Parameters
        page (necessary)
            page number
 
        user_id (necessary)
            user id
        
        page_size (optional)
            page size (default = 10)
        
        activity_max_num (optional)
            the maximum number of return activities for each classmate
            
    Successful Return
    
        {
            "stat":"ok",
            
            "data":   
            {
            
                "user_id": user_id,
            
                "length": length,
            
                "schoolmate_data": [
                            {
                                "school_id": school id,
                                "schoolmate_id": schoolmate id,
                                "question_data": [
                                    {
                                        "question_id": question id,
                                        "question_content": question content,
                                    }
                                    ....
                                    ....
                                ]
                            }
                            ....
                            {
                                "school_id": school id,
                                "schoolmate_id": popular user id,
                                "question_data": [
                                    {
                                        "question_id":question id,
                                        "question_content": question content,
                                    }
                                    ....
                                    ....
                                ]
                            }
                        ]
            
            }
        
    '''
    
    try:
        def getSchoolPopularUserInfo(school_id, amount = 10):
            print "school_id -> ", school_id
            
            user_affiliate_list = models.UsersAffiliate.objects.values_list('user_id', flat = True).filter(school__school_id = school_id).order_by('question_num', 'answer_num')[0:amount]
            
            popular_user_list = [(user_id, school_id) for user_id in user_affiliate_list]
            
            print "popular_user_list ->", popular_user_list
            
            return popular_user_list
            
        user_id = request.GET['user_id']
        page_num = int(request.GET['page'])
        
        if 'page_size' in request.GET:
            page_size = int(request.GET['page_size'])
        else:
            page_size = 10
        
        if 'activity_max_num' in request.GET:
            activity_max_num = request.GET['activity_max_num']
        else:
            activity_max_num = 5
    
        offset = (page_num-1)*page_size
        end = offset + page_size
        
        print "page -> %s | user_id -> %s" %(page_num, user_id)
        print "offset -> %s | end -> %s" %(offset, end) 
        
        
        # Get a list of all classmate data in user's same school
        school_id_list = models.UserSchool.objects.filter(user_id = user_id).values_list('school_id', flat = True)[offset:end]
        
        popular_user_info = []
        
#         print "school_id_list -> ", school_id_list

        for school_id in school_id_list:
             
            popular_user_info += getSchoolPopularUserInfo(school_id)
            
        data = []
        
        for schoolmate_id, school_id in popular_user_info:
    
            question_query = models.Questions.objects.filter(user_id = schoolmate_id).order_by('publish_time')[0:activity_max_num]
            
            question_data_list = []
            
            for q in question_query:
                question_data = {
                            "question_id": q.question_id,
                            "question_content": q.question_content,
                            "publish_time": q.publish_time,
                            "active_time": q.active_time,
                }
                
                question_data_list.append(question_data)
            
            schoolmate_data = {
                "school_id": school_id,
                "schoolmate_id": schoolmate_id,
                "question_data": question_data_list,
            }
            
            data.append(schoolmate_data)
        
        result = {
            "user_id": user_id,
            "length": str(len(data)),
            "schoolmate_data": data, 
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
    
    