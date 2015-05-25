#!/usr/bin/env python
# -*- coding: utf-8 -*- 
from django.db import transaction
from apps.CommonDao import CommonDao
from apps.models import UsersFocus, Users
class UserService():
    commonDao = None;
    @transaction.commit_on_success
    def addFocusSchoolmate(self,user_id,schoolmate_id):
        commonDao =  CommonDao();
        user_focus = UsersFocus(user_id=user_id,schoolmate_id=schoolmate_id);
        focus = commonDao.tolist(UsersFocus,schoolmate_id=schoolmate_id);
        if len(focus)>0:
            return -1;
        commonDao.toadd(UsersFocus,user_focus);
        return 1;
    def toLogin(self,user_name,user_pass):
        commonDao = CommonDao();
        users = commonDao.tolist(Users,user_name=user_name,password=user_pass);
        if len(users)==1:
            return 1;#存在该用户
        else:
            return 0;#不存在该用户
        
        