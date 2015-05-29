#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
from service.UserService import UserService
from django.http.response import HttpResponse, HttpResponseRedirect
import json
from datetime import datetime
from django.utils.datastructures import MultiValueDictKeyError

def headUpload(request):
    return render_to_response('file_upload_test.html');

def readHeadFile(request):
    pass;

def toLogin(request,op):
    if op=="1":#跳转到登陆页面
        return render_to_response('login.html');
    if op=="2":#用户进行登陆操作
        try:
            user_name = request.POST['userName'];
            user_pass = request.POST['pass'];
        except MultiValueDictKeyError:
            return HttpResponseRedirect("/home/");
        userService = UserService();
        status = userService.toLogin(user_name, user_pass);
        mapo = {};
        if status==1:
            mapo['status'] =1;
            request.session['user_name'] = user_name;
            request.session['password'] = user_pass;
            request.session['update_time'] = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        else:  
            mapo['status'] =-1;
            #return HttpResponseRedirect("/loginpage/");
        DATA = json.dumps(mapo);
        return HttpResponse(DATA,content_type="application/json"); #json格式返回数据                   
        