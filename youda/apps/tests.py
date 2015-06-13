#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.test import TestCase
import django
from apps.CommonDao import CommonDao
from apps.models import Users, Questions, Topics, UsersFocus, Schools,\
    UsersAffiliate, UserSchool, TopicFocus, QuestionsFocus, AnswersComments,\
    Answers
from datetime import datetime
from django.utils import timezone
from django.db import transaction, connection

#commonDao测试

# Create your tests here.
#===============================================================================
# 测试用例
#user1 = Users(user_name='apache', password=123, gender=1, power=1, email='1724241758@qq.com', verify_email=1, first_login=1, 
#                 cur_state=1, head='1',rem_name= 0,auto_login= 0, introduction='南京有点大学',message= 10, fans_num=10, visit_num=10, agree_num=40, thanks_num=10, integral=200, affiliate_flag=0, school_name='njupt', academy='计算机学院', entrance_time=datetime.now().strftime("%Y-%m-%d %H:%M:%S"), education=2);
#topic = Topics(topic_name='应聘深造',parent_id=-1);
#Questions(user=user2,question_content='how to learn python',question_detail='which books should i to read?',
#                         topic=topic1,active_time=datetime.now(),browse_num=100,answer_num=20,want_answer_num=20,attention_num=20,invation_num=5,has_attach=1)
#===============================================================================
django.setup()
commonDao = CommonDao();
def addObjects():
    school = Schools(school_name="南京邮电大学",region="南京");
    user1 = Users(user_name='JBoss', password=123, gender=1, power=1, email='1724241758@qq.com', verify_email=1, first_login=1, 
                  cur_state=1, head='1',rem_name= 0,auto_login= 0, introduction='南京有点大学',message_num= 10, fans_num=10, visit_num=10, agree_num=40, thanks_num=10, integral=200, affiliate_flag=0);
    #user2 = commonDao.toget(Users,user_id=19)
    #topic1 = commonDao.toget(Topics,topic_id=1)
    #question = Questions(user=user2,question_content='how to learn python',question_detail='which books should i to read?',
    #                  topic=topic1,active_time=datetime.now(),browse_num=100,answer_num=20,want_answer_num=20,attention_num=20,invation_num=5,has_attach=1);#IntegrityError
    #commonDao.toadd(Questions, question);
    
    commonDao.toadd(Users,user1);
    
    #commonDao.toadd(Schools, school);
    #UserSchool(user)
    #commonDao.toadd(Topics, topic);
def addSchool():
    user = commonDao.toget(UsersAffiliate,user_id=1);
    school = commonDao.toget(Schools,school_id=1)
    #UsersAffiliate(user=user).save();
    userSchool = UserSchool(user=user,school=school,education=1);
    commonDao.toadd(userSchool, userSchool);
    #print o;
def getObject():
    user = commonDao.toget(UsersAffiliate,user_id=1);
    #question = commonDao.toget(Questions,question_id=15);
    #print question.user;
    #user = Users.objects.get(user_id=19);
    #print user.questions_set.all();
    #print user.all_questions.all()#一对多，反向获取数据，查看一个用户提了多少问题,all_questions为自定义的名称
    #print user.school.all();
    print user;
def listObjects():
    list = commonDao.tolist(Questions).order_by('browse_num');
    print list;
def delObjects():
    users = commonDao.tolist(Users);
    questions = commonDao.tolist(Questions);
    commonDao.todele(Questions, questions);
    commonDao.todele(Users, users);
def updateObjects():
    objects = commonDao.tolist(Users,user_name='q');
    print commonDao.toupdate(Users,objects,user_name='tomcat')
def queryPagesObjects():
    users = commonDao.toquerypage(Users);
    print users;
    

#自定义的sql语句execute后，一般会返回影响的记录集数目
def executeSql():
    #commonDao.cursor.execute("SELECT * FROM users where user_id=%s and user_name = %s",[2,'tomcat']);#整数也要用%s 不然报错
    sql = "SELECT * FROM users where user_id=%s";
    cursor = connection.cursor();
    cursor.execute(sql,[ "';delete from users where 'a'='a" ]);#建议用这种方式
    #row = commonDao.cursor.fetchone();
    #row = commonDao.cursor.fetchall();
    row = commonDao.dictfetchall(cursor)
    if(len(row)>0):
        print row;
    #transaction.commit_unless_managed()#django 1.5和之前会要这个
def executesql_delte():
    sql = 'delete from users where user_id=%s';
    commonDao.cursor.execute(sql,22);
def executesql_update():
    sql = 'update users set user_name=%s where user_id=%s';
    print  commonDao.cursor.execute(sql,['tomcat',22]);
def demo():
    question = commonDao.toget(Questions,question_id=13);
    commonDao.todele(Questions, question);
def test():
#     for i in range(10):
#         question = Questions(user_id=2,question_content='how to learn python'+str(55+i),question_detail='which books should i to read?',
#                              active_time=datetime.now(),browse_num=10,answer_num=10,want_answer_num=5,attention_num=2,invation_num=50,has_attach=1);
#         commonDao.toadd(Questions, question);
#     topic = commonDao.toget(Topics,topic_id=9);
#     for x in range(5):
#         question = commonDao.toget(Questions,question_id=10+x);
#         QuestionsFocus(question=question,user_id=1).save();
    #for i in range(10):
        #comment = AnswersComments(content='Test'+str(i),answer_id=1+i,user_id=2,comment_num=1+i,parent_id=0);
        #answer = Answers(answer_content='Test'+str(10+i),support_num=10+i,anonymous=1,has_attach=0,comment_num=2+i,question_id=1+i,user_id=1);
        tf = TopicFocus(user_id=2,topic_id=9)
        commonDao.toadd(TopicFocus,tf);
def getManyToMany():
        user = commonDao.toget(UsersAffiliate,user_id=6);
        s = user.school.all()[0]; 
        print s.school_name;
if __name__=='__main__':
    getManyToMany();