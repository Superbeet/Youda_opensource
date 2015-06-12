#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
import json
from django.http.response import HttpResponseRedirect
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
        userService.toRegister(request.POST);
        return HttpResponseRedirect("/home/");
