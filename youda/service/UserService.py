#!/usr/bin/env python
# -*- coding: utf-8 -*- 
from django.db import transaction
from apps.CommonDao import CommonDao
from apps.models import UsersFocus
class UserService():
    commonDao =  CommonDao();
    @transaction.commit_on_success
    def addFocusSchoolmate(self,user_id,schoolmate_id):
        focus = UsersFocus(user_id=user_id,schoolmate_id=schoolmate_id);
        self.commonDao.toadd(UsersFocus,focus);
        return 1;
        
        