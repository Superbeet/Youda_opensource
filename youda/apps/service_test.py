#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.test import TestCase
import django
from apps.CommonDao import CommonDao
from apps.models import Users, Questions, Topics, TopicFocus
from datetime import datetime
from django.utils import timezone
from django.db import transaction
from service.QuestionService import QuestionService
from util.default_class import default_class
from service.FocusService import FocusService
# 业务测试
django.setup()
commonDao = CommonDao();
def myfocus_test():
    fs = FocusService();
    list1 = fs.getMyFocus(1);
    # list[0][7];
#     list_data = [];
#     for d in list1:
#         if d[7]==1:
#             list_data = {'type':d[7],'data':{'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':d[6],'questioner_head':d[8]}};
#         elif d[7]==2:
#             list_data = {'type':d[7],'data':{'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':d[6],'answerer_id':d[8],'answerer_name':d[9],'answer_content':d[10],'support_num':d[11],'questioner_head':d[12],'answerer_head':d[13],'answer_publish_time':d[14]}};
#         elif d[7]==3:
#             list_data = {'type':d[7],'data':{'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':d[6],'questioner_academy':d[8],'questioner_entime':d[9],'questioner_eduction':d[10],'topid_id':d[11],'topic_name':d[12],'questioner_head':d[13]}};
#         elif d[7]==4:
#             list_data = {'type':d[7],'data':{'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':d[6],'answerer_id':d[8],'answerer_name':d[9],'questioner_academy':d[10],'questioner_entime':d[11],'questioner_education':d[12],'topic_id':d[13],'topic_name':d[14],'answer_content':d[15],'support_num':d[16],'answerer_academy':d[17],'answerer_entime':d[18],'answerer_education':d[19],'questioner_head':d[20],'answerer_head':d[21],'answer_publish_time':d[22]}};
#         elif d[7]==5:
#             list_data = {'type':d[7],'data':{'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':d[6],'answerer_id':d[8],'answerer_name':d[9],'answerer_academy':d[10],'answerer_entime':d[11],'answerer_education':d[12],'answer_content':d[13],'questioner_head':d[14],'answerer_head':d[15],'answer_publish_time':d[16]}};
#     commonDao.cursor.close();
#     list1 = fs.getMyFocus(1);
    print list1;
def myfocus1():
    fs = FocusService();
    list = fs.getMyFocus(-1);
    for d in list:
        print d;
def testaddfocusyopic():
    fs = FocusService();
    print fs.addFocusTopic(1,96);
    #o = commonDao.tolist(TopicFocus,user_id=1,topic_id=99);
    #print o
def testGetQuestionDetail():
    questionService = QuestionService();
    o = questionService.getQuestionDetail(1);
   
    print o;
def testGetAnswersAndComments():
    questionService = QuestionService();
    questionService.getAnswersAndComments(13);
def testshowHelpfulQuestions():
    questionService = QuestionService();
    map = questionService.getHelpfulQuestions(1);
    print map;
def sqltest():
    demo = default_class();
    list = ['or','and',"''",'delete'];
    print demo.Sql_Injection(list);
def test1():
    user = commonDao.tolist(Users,user_name='1');
    print user;
    if user:
        commonDao.toupdate(Users,user,auto_login=0,rem_name=0);
        print 1;
if __name__=='__main__':
    test1();

    
    
    