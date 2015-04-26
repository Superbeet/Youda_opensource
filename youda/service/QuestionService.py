#!/usr/bin/env python
# -*- coding: utf-8 -*-
from apps.CommonDao import CommonDao
from apps.models import Questions
from django.db import transaction
from time import sleep
class QuestionService:
    commonDao =  CommonDao();
    PAGE = 1; #第几页
    PAGESIZE = 10; #页面大小
    @transaction.commit_on_success
    def getAllQuestions(self):
        questions = self.commonDao.toquerypage(Questions,page=1);
        return questions;
    #school_name 学校名称，page 第几页，pagesize为页面大小 
    def getHotQuestions(self,school_name,page=PAGE,pagesize=PAGESIZE):
        sql = "select q_u.user_id as questioner_id,q_u.user_name as questioner_name,q_u.head as questioner_head ,q_u.academy as questioner_academy,q_u.entrance_time as questoner_entime,q_u.education as questioner_education ,q.publish_time as questino_time,q.anonymous as question_anonymous,q.browse_num,q.answer_num,a.answer_content,a_u.user_id as answerer_id,a_u.user_name as answerer_name,a_u.head as answerer_head,a_u.academy as answerer_academy,a_u.entrance_time as answerer_entime,a_u.education as answerer_education,a.publish_time as answer_time,a.anonymous as answer_anonymous,max(a.support_num) as support_num FROM questions q LEFT JOIN answers a  on a.question_id=q.question_id LEFT JOIN users q_u on q_u.user_id=q.user_id LEFT JOIN users a_u on a_u.user_id=a.user_id GROUP BY q.question_id ORDER BY q.browse_num+q.answer_num*10 DESC LIMIT %s,%s"
        self.commonDao.cursor.execute(sql,[(page-1)*pagesize,pagesize]);
        #data = self.commonDao.cursor.fetchall();
        data = self.commonDao.dictfetchall(self.commonDao.cursor)
        #print data;
        return data;
        
            
    