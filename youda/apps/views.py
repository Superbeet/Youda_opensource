#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render, render_to_response
from django.http import HttpResponse
from apps.CommonDao import CommonDao
from apps.models import Users
# Create your views here.
commonDao = CommonDao();
