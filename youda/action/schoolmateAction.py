#!/usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render_to_response
from service.UserService import UserService
from django.http.response import HttpResponse
from django.db import transaction
import json
userService = None;
def index(request):
	return render_to_response('schooler.html');
#关注校友,返回1表示关注成功,-1失败
def focusSchoolmate(request):
	userService = UserService();
	schoolmate_id = request.GET['schoolmate_id'];
	#user_id = request.session['user_id'];
	r = userService.addFocusSchoolmate(1,schoolmate_id);
	data = {'status':r}
	DATA = json.dumps(data);
	return HttpResponse(DATA,content_type="application/json"); #json格式返回数据
	