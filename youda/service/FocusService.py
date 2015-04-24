#!/usr/bin/env python
# -*- coding: utf-8 -*-
from apps.CommonDao import CommonDao
class FocusService:
    PAGE = 1; #第几页
    PAGESIZE = 10; #页面大小
    commonDao = CommonDao();
    def getMyFocus(self,user_id,page=PAGE,pagesize=PAGESIZE):
        #1我关注的人有了新的提问，2我关注的人有了新的回复，3我关注的话题有了新的问题，4我关注的话题有了新的回复,5我关注的问题有了新的回复
        sql = "select * from ( \
        select u.user_id as questioner_id,u.user_name as questioner_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,1 as type,u.head as questioner_head,'' as f1,'' as f2,'' as f3,'' as f4,'' as f5,'' as f6,'' as f7,'' as f8,'' as f9,'' as f10,'' as f11 ,'' as f12,'' as f13 from users u ,users_focus uf,questions q where uf.user_id=%s and uf.follow_uid=u.user_id and u.user_id=q.user_id \
         UNION \
        select q_u.user_id as questioner_id,q_u.user_name as questioner_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,2 as type,u.user_id as answerer_id,u.user_name as answerer_name,a.answer_content,a.support_num,q_u.head as questioner_head,u.head as answerer_head,'','','','','','','','' from users_focus uf,users u,users q_u,answers a,questions q where uf.user_id=%s and uf.follow_uid=u.user_id and a.user_id=u.user_id and a.question_id=q.question_id and q.user_id=q_u.user_id \
        UNION \
        select u.user_id as questioner_id,u.user_name as question_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,3 as type,u.academy,u.entrance_time,u.education,t.topic_id,t.topic_name,u.head as questioner_head,'','','','','','','','' from topic_focus tf,topics t,questions q ,users u where tf.user_id=%s and tf.topic_id=t.topic_id and q.topic_id=t.topic_id and q.user_id=u.user_id \
        UNION \
        SELECT u.user_id as questioner_id,u.user_name as questioner_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,4 as type,a_u.user_id as answerer_id,a_u.user_name as answerer_name,u.academy as questioner_academy, \
        u.entrance_time as questioner_entime,u.education as questioner_education,t.topic_id,t.topic_name,a.answer_content,a.support_num, a_u.academy as answerer_academy,a_u.entrance_time as answerer_entime,a_u.education as answerer_education,u.head as questioner_head,a_u.head as answerer_head from topic_focus tf,topics t,questions q,answers a,users u,users a_u where tf.user_id=%s and tf.topic_id=t.topic_id and q.topic_id=t.topic_id and a.question_id=q.question_id and q.user_id=u.user_id and a.user_id=a_u.user_id \
        UNION \
        select q_u.user_id as questioner_id,q_u.user_name as questiner_name,q.question_id,q.question_content,q.browse_num,q.answer_num,q.publish_time,5 as type,a_u.user_id as answerer_id,a_u.user_name as answerer_name,a_u.academy as annswerer_academy,a_u.entrance_time as answer_entime,a_u.education as answerer_educatin,a.answer_content ,q_u.head as questioner_head,a_u.head as answerer_head,'','','','','','' from questions_focus qf,questions q ,answers a,users q_u,users a_u where qf.user_id=%s and qf.question_id=q.question_id and a.question_id=q.question_id and q.user_id=q_u.user_id and a.user_id=a_u.user_id \
        ) as un ORDER BY un.publish_time DESC LIMIT %s,%s";
        self.commonDao.cursor.execute(sql,[user_id,user_id,user_id,user_id,user_id,(page-1)*pagesize,pagesize]);
        #list_obj = self.commonDao.dictfetchall(self.commonDao.cursor)
        list_obj = self.commonDao.cursor.fetchall();
        list_data = [];
        for d in list_obj:
            if d[7]==1:
                map_data = {'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':str(d[6]),'type':d[7],'questioner_head':d[8]};
            elif d[7]==2:
                map_data = {'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':str(d[6]),'type':d[7],'answerer_id':d[8],'answerer_name':d[9],'answer_content':d[10],'support':d[11],'questioner_head':d[12],'answerer_head':d[13]};
            elif d[7]==3:
                map_data = {'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':str(d[6]),'type':d[7],'questioner_academy':d[8],'questioner_entime':d[9],'questioner_eduction':d[10],'topid_id':d[11],'topic_name':d[12],'questioner_head':d[13]};
            elif d[7]==4:
                map_data = {'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':str(d[6]),'type':d[7],'answerer_id':d[8],'answerer_name':d[9],'questioner_academy':d[10],'questioner_entime':str(d[11]),'questionner_education':d[12],'topic_id':d[13],'topic_name':d[14],'answer_content':d[15],'support_num':d[16],'answerer_academy':d[17],'answerer_entime':str(d[18]),'answerer_education':d[19],'questioner_head':d[20],'answerer_head':d[21]};
            elif d[7]==5:
                map_data = {'questioner_id':d[0],'questioner_name':d[1],'question_id':d[2],'question_content':d[3],'browse_num':d[4],'answer_num':d[5],'publish_time':str(d[6]),'type':d[7],'answerer_id':d[8],'answerer_name':d[9],'answerer_academy':d[10],'answerer_entime':str(d[11]),'answerer_education':d[12],'answer_content':d[13],'questioner_head':d[14],'answerer_head':d[15]};
            list_data.append(map_data);
        return list_data;