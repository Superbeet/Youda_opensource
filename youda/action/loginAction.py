#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response

def headUpload(request):
    return render_to_response('file_upload_test.html');

def readHeadFile(request):
    pass;