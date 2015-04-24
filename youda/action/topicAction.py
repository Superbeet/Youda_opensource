#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response

def showtopic(request):
    return render_to_response('topic.html');

def index(request):
	return render_to_response('topic.html');