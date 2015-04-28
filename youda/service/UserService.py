#!/usr/bin/env python
# -*- coding: utf-8 -*- 
from django.db import transaction
from apps.CommonDao import CommonDao
from apps.models import UsersFocus
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
        
        