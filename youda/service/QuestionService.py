#!/usr/bin/env python
# -*- coding: utf-8 -*-
from apps.CommonDao import CommonDao
from apps.models import Questions, Answers, AnswersComments
from django.db import transaction, connection
from time import sleep
class QuestionService:
    commonDao =  None;
    PAGE = 1; #第几页
    PAGESIZE = 10; #页面大小
    cursor = None;
    @transaction.commit_on_success
    def getAllQuestions(self):
        commonDao =  CommonDao();
        cursor = connection.cursor();
        questions = commonDao.toquerypage(Questions,page=1);
        return questions;
    #school_name 学校名称，page 第几页，pagesize为页面大小 
    def getHotQuestions(self,school_name,page=PAGE,pagesize=PAGESIZE):
        commonDao =  CommonDao();
        cursor = connection.cursor();
        sql = "select q_u.user_id as questioner_id,q_u.user_name as questioner_name,q_u.head as questioner_head ,q_u.academy as questioner_academy,q_u.entrance_time as questoner_entime,q_u.education as questioner_education ,q.publish_time as question_time,q.anonymous as question_anonymous,q.browse_num,q.answer_num,a.answer_content,a_u.user_id as answerer_id,a_u.user_name as answerer_name,a_u.head as answerer_head,a_u.academy as answerer_academy,a_u.entrance_time as answerer_entime,a_u.education as answerer_education,a.publish_time as answer_time,a.anonymous as answer_anonymous,max(a.support_num) as support_num FROM questions q LEFT JOIN answers a  on a.question_id=q.question_id LEFT JOIN users q_u on q_u.user_id=q.user_id LEFT JOIN users a_u on a_u.user_id=a.user_id GROUP BY q.question_id ORDER BY q.browse_num+q.answer_num*10 DESC LIMIT %s,%s"
        data_length = cursor.execute(sql,[(page-1)*pagesize,pagesize]);
        #data = self.cursor.fetchall();
        data = commonDao.dictfetchall(cursor)
        #print data;
        map_data={'length':data_length,'data':data}
        return map_data;
    def getHelpfulQuestions(self,user_id):
        commonDao =  CommonDao();
        cursor = connection.cursor();
        sql = "select q.question_id,q.question_content,u.user_id,u.user_name,u.academy,u.entrance_time,u.education,u.head from  \
            (SELECT t.topic_id,t.topic_name,COUNT(a.answer_id) as answer_num from answers a ,questions q,topics t WHERE a.user_id=%s and a.question_id=q.question_id and q.topic_id=t.topic_id GROUP BY t.topic_id ORDER BY answer_num DESC) commands ,\
            questions q,users u where q.answer_num=0 and q.topic_id=commands.topic_id and q.user_id=u.user_id ORDER BY commands.answer_num DESC limit 0,5";
        data_length = cursor.execute(sql,user_id);
        data = commonDao.dictfetchall(cursor);
        map_obj = {'length':data_length,'data':data};
       
        return map_obj;
    def getQuestionDetail(self,question_id):
        commonDao = CommonDao();
        v = commonDao.toget(Questions,question_id=13);
        if v==-1 or v==0:#返回多条或0条记录
            return -1;
        return v;
    def getAnswersAndComments(self,question_id,page=PAGE,pagesize=PAGESIZE):
        commonDao =  CommonDao();
        answers_num = commonDao.tolist(Answers,question_id=question_id).count();
        map_answer = {};#存放问题的数量和问题的详细信息
        map_answer['answers_num'] = answers_num;
        if answers_num>0:
            answers = commonDao.tolist(Answers,question_id=question_id).order_by('-support_num')[(page-1)*pagesize:pagesize];#得到改问题的回复，按点赞数量排序
            list_obj = [];#存放所有的问题及问题的评论 
            for answer in answers:
                map_obj={};#存放该问题及该问题的评论
                map_obj["user"]={'user_id':answer.user.user_id,'user_name':answer.user.user_name,'academy':answer.user.academy,
                                 'head':answer.user.head,'entime':answer.user.entrance_time,'education':answer.user.education};
                map_obj["answer"]={'answer_id':answer.answer_id,'answer_content':answer.answer_content,'publish_time':answer.publish_time,'support_num':answer.support_num,'anonymous':answer.anonymous};
                
                map_obj["comment_num"]=answer.comment_num;#记录该问题评论的数量
                if answer.comment_num>0:#如果评论数量不等于0，则将评论存入map
                    comments = commonDao.tolist(AnswersComments,answer=answer,parent_id=0).order_by('time');#得到该问题的第一条评论，并按时间排序
                    list_comment=[];
                    
                    for comment in comments:
                        map_comment={};
                        #得到问题的第一条评论，评论分为第一条评论和对第一条评论的评论，这两种评论要分开处理
                        map_comment["first_comment"]={'user_id':comment.user.user_id,'user_name':comment.user.user_name,'head':comment.user.head,'comment_time':comment.time,'content':comment.content};
                        #得到第一条评论的评论，前端此处可以判断评论的数量，如果数量大于等于2，则说明存在对第一条评论的评论，否则不存在
                        remain_comments = commonDao.tolist(AnswersComments,parent_id=comment.comment_id);
                        list_remain_comments = [];#存放除了第一条评论的评论
                        for remain_comment in remain_comments:
                            map_remain_comment = {'user_id':remain_comment.user.user_id,'user_name':remain_comment.user.user_name,'head':remain_comment.user.head,'comment_time':remain_comment.time,'content':remain_comment.content};
                            list_remain_comments.append(map_remain_comment);
                        map_comment["remain_comments"]=list_remain_comments;
                        
                        list_comment.append(map_comment);
                        
                    map_obj["comments"]=list_comment;#得到所有的评论，包括第一条评论和第一条评论的评论
                
                list_obj.append(map_obj);#得到问题及该问题的评论
        map_answer['answers'] = list_obj;
                            
        return map_answer;
       
        
            
    