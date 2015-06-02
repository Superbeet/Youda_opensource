#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
from service.UserService import UserService
from django.http.response import HttpResponse, HttpResponseRedirect
import json
from datetime import datetime
from django.utils.datastructures import MultiValueDictKeyError
from django.template import response
from apps.form import login

from PIL import Image, ImageFile
def headUpload(request):
    return render_to_response('file_upload_test.html');

#常规处理方法，现将图片保存下来，然后处理
def readHeadFile(request):
    form = login(request.POST, request.FILES);
    if form.is_valid(): 
        print 'ok'
        f = request.FILES["imagefile"]  
        # des_origin_path 为你在服务器上保存原始图片的文件物理路径         
        des_origin_f = open("img1.jpg", "ab")  
        for chunk in f.chunks():  
            des_origin_f.write(chunk)  
        des_origin_f.close()
    return render_to_response();
#未保存之前处理
def readHeadFile2(request):
    form = login(request.POST, request.FILES);
    if form.is_valid(): 
        print 'ok'
        f = request.FILES["imagefile"]
        #title = request.POST["title"];
        cd = form.cleaned_data;#获得其他是数据
        title = cd["title"];
        print title;
        parser = ImageFile.Parser()  
        for chunk in f.chunks():  
            parser.feed(chunk)   
        img = parser.close()
        i2 = img.thumbnail((100,100))
        img.save("./static/image/head/t3.jpg");
    return render_to_response("file_upload_test.html");
 
def toLogin(request,op):
    if op=="1":#跳转到登陆页面
        return render_to_response('login.html');
    if op=="2":#用户进行登陆操作
        try:
            user_name = request.POST['userName'];
            user_pass = request.POST['pass'];
            flag = request.POST['logintype'];
        except MultiValueDictKeyError:
            return HttpResponseRedirect("/home/");
        userService = UserService();
        user = userService.toLogin(user_name, user_pass,flag);
        mapo = {};
        if user:
            mapo['status'] =1;
            request.session['user_name'] = user.user_name;
            request.session['update_time'] = datetime.now().strftime("%Y-%m-%d %H:%M:%S");
        else:  
            mapo['status'] =-1;
        DATA = json.dumps(mapo);
        response = HttpResponse(DATA,content_type="application/json"); #json格式返回数据
        if user:
            response.set_cookie("USERNAME",user_name,60); #要加密储存
        return response;       
        #return HttpResponseRedirect("/loginpage/");