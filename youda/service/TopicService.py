#!/usr/bin/env python
# -*- coding: utf-8 -*-
from apps.CommonDao import CommonDao
class TopicService():
    commonDao =  None;
    def getRecommendTopic(self):
        commonDao = CommonDao();
        sql = "SELECT c.* from \
            (SELECT c2.category_id,c2.title FROM topic_focus tf,topics t,category c1,category c2 WHERE tf.user_id=1 and tf.topic_id=t.topic_id and t.category_id = c1.category_id and c1.parent_id = c2.category_id \
            UNION \
            SELECT c1.category_id,c1.title FROM topic_focus tf,topics t,category c1  WHERE tf.user_id=1 and tf.topic_id=t.topic_id and t.category_id = c1.category_id and c1.parent_id=0) a_l,category c where c.parent_id=a_l.category_id";
        commonDao.cursor.execute(sql);
        