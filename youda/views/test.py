'''
Created on Jun 12, 2015

@author: 507061
'''

from django.shortcuts import render,render_to_response
from django.http import HttpResponse, HttpResponseRedirect
from django.template.context import RequestContext
from django.contrib import auth
from django.contrib.auth.models import User

from django.contrib.contenttypes.models import ContentType
from apps import models

from rest_framework.decorators import api_view
from django.core.context_processors import csrf

import datetime
import json


def unitTest(request):
    response = render_to_response('viewTest.html')  
    response.set_cookie( 'user_id', '1' )  
    return response


def editQuestion(request):
    c = {}
    c.update(csrf(request))
    response = render_to_response('editQuestionTest.html', c)  
    response.set_cookie( 'user_id', '1' )  
    return response    