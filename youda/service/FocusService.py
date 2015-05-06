#!/usr/bin/env python
# -*- coding: utf-8 -*-
from apps.CommonDao import CommonDao
from apps.models import TopicFocus
from django.db import transaction
class FocusService:
    PAGE = 1; #第几页
    PAGESIZE = 10; #页面大小
    commonDao = None;
    def getMyFocus(self,user_id,page=PAGE,pagesize=PAGESIZE):
        #1我关注的人有了新的提问，2我关注的人有了新的回复，3我关注的话题有了新的问题，4我关注的话题有了新的回复,5我关注的问题有了新的回复
        commonDao = CommonDao();
        sql = "SELECT * from ( \
        SELECT u.user_id AS questioner_id,u.user_name AS questioner_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,1 AS type,u.head AS questioner_head,'' AS f1,'' AS f2,'' AS f3,'' AS f4,'' AS f5,'' AS f6,'' AS f7,'' AS f8,'' AS f9,'' AS f10,'' AS f11 ,'' AS f12,'' AS f13 from users u ,users_focus uf,questions q WHERE uf.user_id=%s AND uf.follow_uid=u.user_id AND u.user_id=q.user_id \
         UNION \
        SELECT q_u.user_id AS questioner_id,q_u.user_name AS questioner_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,2 AS type,u.user_id AS answerer_id,u.user_name AS answerer_name,a.answer_content,a.support_num,q_u.head AS questioner_head,u.head AS answerer_head,'','','','','','','','' from users_focus uf,users u,users q_u,answers a,questions q WHERE uf.user_id=%s AND uf.follow_uid=u.user_id AND a.user_id=u.user_id AND a.question_id=q.question_id AND q.user_id=q_u.user_id \
        UNION \
        SELECT u.user_id AS questioner_id,u.user_name AS question_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,3 AS type,u.academy,u.entrance_time,u.education,t.topic_id,t.topic_name,u.head AS questioner_head,'','','','','','','','' from topic_focus tf,topics t,questions q ,users u WHERE tf.user_id=%s AND tf.topic_id=t.topic_id AND q.topic_id=t.topic_id AND q.user_id=u.user_id \
        UNION \
        SELECT u.user_id AS questioner_id,u.user_name AS questioner_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,4 AS type,a_u.user_id AS answerer_id,a_u.user_name AS answerer_name,u.academy AS questioner_academy, \
        u.entrance_time AS questioner_entime,u.education AS questioner_education,t.topic_id,t.topic_name,a.answer_content,a.support_num, a_u.academy AS answerer_academy,a_u.entrance_time AS answerer_entime,a_u.education AS answerer_education,u.head AS questioner_head,a_u.head AS answerer_head from topic_focus tf,topics t,questions q,answers a,users u,users a_u WHERE tf.user_id=%s AND tf.topic_id=t.topic_id AND q.topic_id=t.topic_id AND a.question_id=q.question_id AND q.user_id=u.user_id AND a.user_id=a_u.user_id \
        UNION \
        SELECT q_u.user_id AS questioner_id,q_u.user_name AS questiner_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,5 AS type,a_u.user_id AS answerer_id,a_u.user_name AS answerer_name,a_u.academy AS annswerer_academy,a_u.entrance_time AS answer_entime,a_u.education AS answerer_educatin,a.answer_content ,q_u.head AS questioner_head,a_u.head AS answerer_head,'','','','','','' from questions_focus qf,questions q ,answers a,users q_u,users a_u WHERE qf.user_id=%s AND qf.question_id=q.question_id AND a.question_id=q.question_id AND q.user_id=q_u.user_id AND a.user_id=a_u.user_id \
        ) AS un ORDER BY un.publish_time DESC LIMIT %s,%s";
        data_length = commonDao.cursor.execute(sql,[user_id,user_id,user_id,user_id,user_id,(page-1)*pagesize,pagesize]);
        #list_obj = commonDao.dictfetchall(commonDao.cursor)
        list_obj = commonDao.cursor.fetchall();
        list_data = [];
        for d in list_obj:
            if d[7]==1:
                map_data = {'type':d[7],'data':{'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':d[6],'questioner_head':d[8]}};
            elif d[7]==2:
                map_data = {'type':d[7],'data':{'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':d[6],'answerer_id':d[8],'answerer_name':d[9],'answer_content':d[10],'support_num':d[11],'questioner_head':d[12],'answerer_head':d[13]}};
            elif d[7]==3:
                map_data = {'type':d[7],'data':{'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':d[6],'questioner_academy':d[8],'questioner_entime':d[9],'questioner_eduction':d[10],'topid_id':d[11],'topic_name':d[12],'questioner_head':d[13]}};
            elif d[7]==4:
                map_data = {'type':d[7],'data':{'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':d[6],'answerer_id':d[8],'answerer_name':d[9],'questioner_academy':d[10],'questioner_entime':d[11],'questioner_education':d[12],'topic_id':d[13],'topic_name':d[14],'answer_content':d[15],'support_num':d[16],'answerer_academy':d[17],'answerer_entime':d[18],'answerer_education':d[19],'questioner_head':d[20],'answerer_head':d[21]}};
            elif d[7]==5:
                map_data = {'type':d[7],'data':{'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':d[6],'answerer_id':d[8],'answerer_name':d[9],'answerer_academy':d[10],'answerer_entime':d[11],'answerer_education':d[12],'answer_content':d[13],'questioner_head':d[14],'answerer_head':d[15]}};
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
        