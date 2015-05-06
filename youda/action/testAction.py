#!/usr/bin/env python
# -*- coding: utf-8 -*-
#用于测试
from django.shortcuts import render_to_response
from django.http.response import HttpResponse
def test1(request):
    return render_to_response('json.html');
def test2(request):
    li = {'name1':'tomcat','name2':'apache'};
    return HttpResponse(li);