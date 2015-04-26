#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.test import TestCase
import django
from apps.CommonDao import CommonDao
from apps.models import Users, Questions, Topics, TopicFocus
from datetime import datetime
from django.utils import timezone
from django.db import transaction
from service.FocusService import FocusService
# 业务测试
django.setup()
commonDao = CommonDao();
def myfocus_test():
    fs = FocusService();
    list1 = fs.getMyFocus(1);
    # list[0][7];
    list_data = [];
    for d in list1:
        if d[7]==1:
            map_data = {'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':str(d[6]),'type':d[7]};
        elif d[7]==2:
            map_data = {'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':str(d[6]),'type':d[7],'answerer_id':d[8],'answerer_name':d[9],'answer_content':d[10],'support':d[11]};
        elif d[7]==3:
            map_data = {'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':str(d[6]),'type':d[7],'questioner_academy':d[8],'questioner_entime':d[9],'questioner_eduction':d[10],'topid_id':d[11],'topic_name':d[12]};
        elif d[7]==4:
            map_data = {'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':str(d[6]),'type':d[7],'answerer_id':d[8],'answerer_name':d[9],'questioner_academy':d[10],'questioner_entime':str(d[11]),'questionner_education':d[12],'topic_id':d[13],'topic_name':d[14],'answer_content':d[15],'support_num':d[16],'answerer_academy':d[17],'answerer_entime':str(d[18]),'answerer_education':d[19]};
        elif d[7]==5:
            map_data = {'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':str(d[6]),'type':d[7],'answerer_id':d[8],'answerer_name':d[9],'answerer_academy':d[10],'answerer_entime':str(d[11]),'answerer_education':d[12],'answer_content':d[13]};
        list_data.append(map_data);
    print list_data;
def myfocus1():
    fs = FocusService();
    list = fs.getMyFocus(1);
    for d in list:
        print type(str(d['publish_time']));
def testaddfocusyopic():
    #fs = FocusService();
    #print fs.addFocusTopic(1,100);
    o = commonDao.tolist(TopicFocus,user_id=1,topic_id=100);
    print o
if __name__=='__main__':
    testaddfocusyopic();

    
    