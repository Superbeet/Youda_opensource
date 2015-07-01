#!/usr/bin/env python
# -*- coding: utf-8 -*-
from apps.CommonDao import CommonDao
from apps.models import TopicFocus, Questions, Users, Answers, Topics,\
    UserSchool
from django.db import transaction, connection

class FocusService:
    PAGE = 1; #第几页
    PAGESIZE = 100; #页面大小
    commonDao = None;
    def getMyFocus(self,user_id,page=PAGE,pagesize=PAGESIZE,school_id=1):
        #1我关注的人有了新的提问，2我关注的人有了新的回复，3我关注的话题有了新的问题，4我关注的话题有了新的回复,5我关注的问题有了新的回复
        commonDao = CommonDao();
        cursor = connection.cursor();
        sql = "SELECT * from ( \
                SELECT 1 AS type,u.user_id AS questioner_id,q.question_id,q.publish_time,'' AS f1,'' AS f2,'' AS f3 from users u ,users_focus uf,questions q,user_school us  WHERE uf.user_id=%s AND uf.schoolmate_id=u.user_id AND uf.schoolmate_id=q.user_id AND uf.schoolmate_id=us.user_id AND us.school_id=%s\
                UNION \
                SELECT 2 AS type,questioner.user_id AS questioner_id,q.question_id,a.publish_time,answerer.user_id AS answerer_id,a.answer_id,'' FROM users_focus uf,users answerer,users questioner,answers a,questions q,user_school us WHERE uf.user_id=%s AND uf.schoolmate_id=answerer.user_id AND a.user_id=answerer.user_id AND a.question_id=q.question_id AND q.user_id=questioner.user_id AND uf.schoolmate_id=us.user_id AND us.school_id=%s\
                UNION \
                SELECT 3 AS type,u.user_id AS questioner_id,q.question_id,q.publish_time,t.topic_id,'','' FROM topic_focus tf,topics t,questions q,questions_topic qt,users u WHERE tf.user_id=%s AND tf.topic_id=t.topic_id AND t.topic_id=qt.topics_id AND qt.questions_id=q.question_id AND q.user_id=u.user_id AND t.school_id=%s\
                UNION \
                SELECT 4 as type,questioner.user_id AS questioner_id,answerer.user_id AS answerer_id,q.publish_time,q.question_id,t.topic_id,a.answer_id FROM topic_focus tf,topics t,questions q,questions_topic qt,users answerer,users questioner,answers a WHERE tf.user_id=%s AND tf.topic_id=t.topic_id AND t.topic_id=qt.topics_id AND qt.questions_id=q.question_id AND q.user_id=questioner.user_id AND a.question_id=q.question_id AND a.answer_id=answerer.user_id AND t.school_id=%s\
                UNION \
                SELECT 5 as type,questioner.user_id AS questioner_id,answerer.user_id AS answerer_id,a.publish_time,q.question_id,a.answer_id,'' FROM questions_focus qf,questions q,answers a,users questioner,users answerer,user_school us WHERE qf.user_id=%s AND qf.question_id=q.question_id AND a.question_id=q.question_id AND q.user_id=questioner.user_id AND a.user_id=answerer.user_id AND q.user_id=us.user_id and us.school_id=%s\
                ) AS un ORDER BY un.publish_time DESC LIMIT %s,%s";
        data_length = cursor.execute(sql,[user_id,school_id,user_id,school_id,user_id,school_id,user_id,school_id,user_id,school_id,(page-1)*pagesize,pagesize]);
        #list_obj = commonDao.dictfetchall(commonDao.cursor)
        list_obj = cursor.fetchall();
        list_data = [];
        map_data = {};
        #print 'user_id=>%s'%user_id
        for d in list_obj:
            if d[0]==1:
                user = commonDao.toget(Users,user_id=d[1]);
                question = commonDao.toget(Questions,question_id=d[2]);             
                map_data = {'type':d[0],'data':{'questioner_id':user.user_id,'questioner_name':user.user_name,'question_id':question.question_id,'question_content':question.question_content,'browse_num':question.browse_num,'answer_num':question.answer_num,'publish_time':question.publish_time,'questioner_head':user.head}};
            elif d[0]==2:
                questioner = commonDao.toget(Users,user_id=d[1]);
                question = commonDao.toget(Questions,question_id=d[2]);
                answerer = commonDao.toget(Users,user_id=d[4]);
                answer = commonDao.toget(Answers,answer_id=d[5]);
                map_data = {'type':d[0],'data':{'questioner_id':questioner.user_id,'questioner_name':questioner.user_name,'question_id':question.question_id,'question_content':question.question_content,'browse_num':question.browse_num,'answer_num':question.answer_num,'publish_time':question.publish_time,'answerer_id':answerer.user_id,'answerer_name':answerer.user_name,'answer_content':answer.answer_content,'support_num':answer.support_num,'questioner_head':questioner.head,'answerer_head':answerer.head,'answer_publish_time':answer.publish_time}};
            elif d[0]==3:
                questioner = commonDao.toget(Users,user_id=d[1]);
                question = commonDao.toget(Questions,question_id=d[2]);
                topic = commonDao.toget(Topics,topic_id=d[4]);
                user_school = commonDao.toget(UserSchool,user_id=d[1],school_id=school_id);
                map_data = {'type':d[0],'data':{'questioner_id':questioner.user_id,'questioner_name':questioner.user_name,'question_id':question.question_id,'question_content':question.question_content,'browse_num':question.browse_num,'answer_num':question.answer_num,'publish_time':question.publish_time,'questioner_academy':user_school.academy,'questioner_entime':user_school.entrance_time,'questioner_eduction':user_school.education,'topid_id':topic.topic_id,'topic_name':topic.topic_name,'questioner_head':questioner.head}};
            elif d[0]==4:
                questioner = commonDao.toget(Users,user_id=d[1]);
                answerer = commonDao.toget(Users,user_id=d[2]);
              
                question = commonDao.toget(Questions,question_id=d[4]);
                topic = commonDao.toget(Topics,topic_id=d[5]);
                questioner_school = commonDao.toget(UserSchool,user_id=d[1],school_id=school_id);
                answerer_school = commonDao.toget(UserSchool,user_id=d[2],school_id=school_id)
                #print "questioner_school=>%s,answerer_school=>%s"%(questioner_school,answerer_school);
                #print "user_id=>%s,school_id=>%s"%(d[2],school_id)
                answer = commonDao.toget(Answers,answer_id=d[6]);
                map_data = {'type':d[0],'data':{'questioner_id':questioner.user_id,'questioner_name':questioner.user_name,'question_id':question.question_id,'question_content':question.question_content,'browse_num':question.browse_num,'answer_num':question.answer_num,'publish_time':question.publish_time,'answerer_id':answerer.user_id,'answerer_name':answerer.user_name,'questioner_academy':questioner_school.academy,'questioner_entime':questioner_school.entrance_time,'questioner_education':questioner_school.education,'topic_id':topic.topic_id,'topic_name':topic.topic_name,'answer_content':answer.answer_content,'support_num':answer.support_num,'answerer_academy':answerer_school.academy,'answerer_entime':answerer_school.entrance_time,'answerer_education':answerer_school.education,'questioner_head':questioner.head,'answerer_head':answerer.head,'answer_publish_time':answer.publish_time}};
            elif d[0]==5:
                questioner = commonDao.toget(Users,user_id=d[1]);
                answerer = commonDao.toget(Users,user_id=d[2]);
                question = commonDao.toget(Questions,question_id=d[4]);
                answer = commonDao.toget(Answers,answer_id=d[5]);
                questioner_school = commonDao.toget(UserSchool,user_id=d[1],school_id=school_id);
                answerer_school = commonDao.toget(UserSchool,user_id=d[2],school_id=school_id);
                map_data = {'type':d[0],'data':{'questioner_id':questioner.user_id,'questioner_name':questioner.user_name,'question_id':question.question_id,'question_content':question.question_content,'browse_num':question.browse_num,'answer_num':question.answer_num,'publish_time':question.publish_time,'answerer_id':answerer.user_id,'answerer_name':answerer.user_name,'answerer_academy':questioner_school.academy,'answerer_entime':questioner_school.entrance_time,'answerer_education':answerer_school.education,'answer_content':answer.answer_content,'questioner_head':questioner.head,'answerer_head':answerer.head,'answer_publish_time':answer.publish_time}};
            list_data.append(map_data);
        map_obj={'length':data_length,'data':list_data};
        return map_obj;
    #添加关注话题
    @transaction.commit_on_success
    def addFocusTopic(self,user_id,topic_id):
        commonDao = CommonDao();
        topic_foucs = TopicFocus(topic_id=topic_id,user_id=user_id);
        focus = commonDao.tolist(TopicFocus,topic_id=topic_id,user_id=user_id)
        if len(focus)>0:
            return -1;
        commonDao.toadd(TopicFocus,topic_foucs);
        #raise ValueError;
        return 1;
    
    
    
         
#         sql = "SELECT * from ( \
#         SELECT u.user_id AS questioner_id,u.user_name AS questioner_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,1 AS type,u.head AS questioner_head,'' AS f1,'' AS f2,'' AS f3,'' AS f4,'' AS f5,'' AS f6,'' AS f7,'' AS f8,'' AS f9,'' AS f10,'' AS f11 ,'' AS f12,'' AS f13 ,'' AS f14 from users u ,users_focus uf,questions q WHERE uf.user_id=%s AND uf.user_id=u.user_id AND u.user_id=q.user_id \
#          UNION \
#         SELECT q_u.user_id AS questioner_id,q_u.user_name AS questioner_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,2 AS type,u.user_id AS answerer_id,u.user_name AS answerer_name,a.answer_content,a.support_num,q_u.head AS questioner_head,u.head AS answerer_head,a.publish_time as answer_publish_time,'','','','','','','','' from users_focus uf,users u,users q_u,answers a,questions q WHERE uf.user_id=%s AND uf.user_id=u.user_id AND a.user_id=u.user_id AND a.question_id=q.question_id AND q.user_id=q_u.user_id \
#         UNION \
#         SELECT u.user_id AS questioner_id,u.user_name AS question_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,3 AS type,u.academy,u.entrance_time,u.education,t.topic_id,t.topic_name,u.head AS questioner_head,'','','','','','','','','' from topic_focus tf,topics t,questions q ,users u WHERE tf.user_id=%s AND tf.topic_id=t.topic_id AND q.topic_id=t.topic_id AND q.user_id=u.user_id \
#         UNION \
#         SELECT u.user_id AS questioner_id,u.user_name AS questioner_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,4 AS type,a_u.user_id AS answerer_id,a_u.user_name AS answerer_name,u.academy AS questioner_academy, \
#         u.entrance_time AS questioner_entime,u.education AS questioner_education,t.topic_id,t.topic_name,a.answer_content,a.support_num, a_u.academy AS answerer_academy,a_u.entrance_time AS answerer_entime,a_u.education AS answerer_education,u.head AS questioner_head,a_u.head AS answerer_head ,a.publish_time as answer_publish_time from topic_focus tf,topics t,questions q,answers a,users u,users a_u WHERE tf.user_id=%s AND tf.topic_id=t.topic_id AND q.topic_id=t.topic_id AND a.question_id=q.question_id AND q.user_id=u.user_id AND a.user_id=a_u.user_id \
#         UNION \
#         SELECT q_u.user_id AS questioner_id,q_u.user_name AS questiner_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,5 AS type,a_u.user_id AS answerer_id,a_u.user_name AS answerer_name,a_u.academy AS annswerer_academy,a_u.entrance_time AS answer_entime,a_u.education AS answerer_educatin,a.answer_content ,q_u.head AS questioner_head,a_u.head AS answerer_head,a.publish_time as answer_publish_time,'','','','','','' from questions_focus qf,questions q ,answers a,users q_u,users a_u WHERE qf.user_id=%s AND qf.question_id=q.question_id AND a.question_id=q.question_id AND q.user_id=q_u.user_id AND a.user_id=a_u.user_id \
#         ) AS un ORDER BY un.publish_time DESC LIMIT %s,%s";