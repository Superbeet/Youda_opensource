#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render, render_to_response
from django.http import HttpResponse
# from apps.models import *
import models

from django.template.loader import get_template
from django.template import Context

# commonDao = CommonDao();

#--------------- Page API ---------------
def index(request):
    """ Index page
    """
    return HttpResponse("Hello world!")


def topic(request):
    """ Topic page
    """
    pass

def user_detail(request):
    """ API to fetch user's detail information
    """
    pass

def question_detail(request):
    """ API to fetch question detail
    """
    pass

def question_pub(request):
    """ page to publish a question
    """
    pass

# --------------- Rest API ----------------
def comment_sub(request):
    """ API to submit a comment
    """
    pass

def question_sub(request):
    """ API to submit a question
    """
    pass

def question_list(request):
    """ API to request a paginated list of questions
    """
    pass
