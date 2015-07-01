#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
import json
from django.http.response import HttpResponseRedirect, HttpResponse
import base64
from service.UserService import UserService



userService=None;
def toLogin(request):
    return render_to_response('login.html')

def register(request):
    '''
            用户注册模块
    '''
    if len(request.POST)==0:
        return render_to_response('register.html')
    else:
        userService = UserService();
        flag = userService.toRegister(request.POST);
        map_flag = {};
        map_flag["status"] = flag;
        DATA = json.dumps(map_flag);
        response = HttpResponse(DATA,content_type="application/json"); #json格式返回数据
        return response;
