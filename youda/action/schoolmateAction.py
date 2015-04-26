#!/usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render_to_response
from service.UserService import UserService
from django.http.response import HttpResponse
userService = None;
def index(request):
	return render_to_response('schooler.html');
#关注校友,返回1表示关注成功
def focusSchoolmate(request):
	userService = UserService();
	schoolmate_id = request.POST['schoolmate_id'];
	user_id = request.session['user_id'];
	r = userService.addFocusSchoolmate(user_id, schoolmate_id);
	return HttpResponse(r); 
	