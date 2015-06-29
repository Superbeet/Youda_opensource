#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from apps.CommonDao import CommonDao
from datetime import datetime
from django.db.models.fields import AutoField

class Answers(models.Model):
    answer_id = models.AutoField(primary_key=True)
    question = models.ForeignKey('Questions')
    user = models.ForeignKey('Users')
    answer_content = models.TextField(blank=True)
    publish_time = models.DateTimeField(blank=True, null=True,default=datetime.now)
    support_num = models.IntegerField(blank=True, null=True)
    anonymous = models.IntegerField(blank=True, null=True)
    has_attach = models.IntegerField(blank=True, null=True)
    comment_num = models.IntegerField(blank=True, null=True)

    class Meta:
        db_table = 'answers'
    def __unicode__(self):
        return u'%s %s %s %s' % (self.answer_id, self.question,self.user,self.answer_content) 
    objects = models.Manager()
    common_objects = CommonDao();

class AnswersComments(models.Model):
    comment_id = models.AutoField(primary_key=True)
    answer = models.ForeignKey('Answers')
    user = models.ForeignKey('Users')
    content = models.TextField(blank=True)
    time = models.DateTimeField(blank=True, null=True,default=datetime.now)
    comment_num = models.IntegerField(blank=True, null=True)
    parent_id = models.IntegerField(blank=True, null=True)

    class Meta:
        db_table = 'answers_comments'
    def __unicode__(self):
        return  u'%s %s %s %s' % (self.comment_id, self.answer,self.user,self.content) 
    objects = models.Manager()
    common_objects = CommonDao();

class Articles(models.Model):
    article_id = models.AutoField(primary_key=True)

    user = models.ForeignKey('Users')
    article_title = models.CharField(max_length=255, blank=True)
    article_detail = models.TextField(blank=True)
    topic = models.ForeignKey('Topics', blank=True, null=True)
    publish_time = models.DateTimeField(blank=True, null=True)
    active_time = models.DateTimeField(blank=True, null=True)
    browse_num = models.IntegerField(blank=True, null=True)
    comment_num = models.IntegerField(blank=True, null=True)
    attention_num = models.IntegerField(blank=True, null=True)

    class Meta:
        db_table = 'articles'
    def __unicode__(self):
        return u'%s %s %s %s' % (self.article_id, self.user_id,self.article_title,self.topic_id) 
    objects = models.Manager()
    common_objects = CommonDao();

class Associations(models.Model):
    ass_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('UsersAffiliate')
    ass_name = models.CharField(max_length=100)
    position = models.CharField(max_length=100, blank=True)
    entrance_time = models.DateTimeField(blank=True, null=True)
    leave_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = 'associations'
    def __unicode__(self):
        return u'%s %s %s %s' % (self.ass_id, self.user,self.ass_name,self.position)
    objects = models.Manager()
    common_objects = CommonDao();

class InvitationUsers(models.Model):
    invitation_id = models.AutoField(primary_key=True)
    question = models.ForeignKey('Questions',)#
    send_user = models.ForeignKey('Users',related_name='all_send_users', blank=True, null=True)
    send_user_name = models.CharField(max_length=10, blank=True)
    receive_user = models.ForeignKey('Users',related_name='all_receive_users')
    receive_user_name = models.CharField(max_length=10, blank=True)

    class Meta:
        db_table = 'invitation_users'
    def __unicode__(self):
        return u'%s %s %s %s' % (self.invitation_id, self.question,self.send_user,self.send_user_name)
    objects = models.Manager()
    common_objects = CommonDao();

class UserJobs(models.Model):
    job_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('UsersAffiliate')
    company_name = models.CharField(max_length=50, blank=True)
    position = models.CharField(max_length=200, blank=True)
    city = models.CharField(max_length=100, blank=True)
    entrance_time = models.CharField(max_length=20, blank=True)
    leave_time = models.CharField(max_length=20, blank=True)
    experience = models.TextField(blank=True)
    
    class Meta:
        db_table = 'user_jobs'
    def __unicode__(self):
        return u'%s %s %s %s' % (self.job_id, self.user,self.position,self.city)
    objects = models.Manager()
    common_objects = CommonDao();

class Logs(models.Model):
    log_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('Users', blank=True, null=True)
    ip = models.CharField(max_length=20, blank=True)
    operate_time = models.DateTimeField(blank=True, null=True,default=datetime.now)
    operate_command = models.CharField(max_length=20, blank=True)
    from_field = models.IntegerField(db_column='from', blank=True, null=True)  # Field renamed because it was a Python reserved word.
    url = models.CharField(max_length=255, blank=True)

    class Meta:
        db_table = 'logs'
    def __unicode__(self):
        return u'%s %s %s %s' % (self.log_id, self.user,self.ip,self.operate_time)
    objects = models.Manager()
    common_objects = CommonDao();

class Messages(models.Model):
    message_id = models.AutoField(primary_key=True)
    message_user = models.ForeignKey('Users')
    content = models.CharField(max_length=255, blank=True)

    class Meta:
        db_table = 'messages'
    def __unicode__(self):
        return u'%s %s %s' % (self.message_id, self.user,self.content)
    objects = models.Manager()
    common_objects = CommonDao();

class PrivateLetters(models.Model):
    letter_id = models.AutoField(primary_key=True)
    send_user = models.ForeignKey('Users',related_name='all_sendletter_users')#related_name='aa'
    send_user_name = models.CharField(max_length=10, blank=True)
    receive_user = models.ForeignKey('Users',related_name='all_receiverletter_users')
    receive_user_name = models.CharField(max_length=10, blank=True)
    content = models.CharField(max_length=255, blank=True)

    class Meta:
        db_table = 'private_letters'
    def __unicode__(self):
        return u'%s %s %s %s' % (self.letter_id, self.send_user,self.send_user_name,self.receive_user)
    objects = models.Manager()
    common_objects = CommonDao();

class Questions(models.Model):
    question_id = models.AutoField(primary_key=True)
    #related_name用于反向获取数据，如果查询一个用户user提了多少问题，那么user.questions_set.all()
    #可以获取，加了relate_name='all_questions'就可以这样user.all_questions.all()
    user = models.ForeignKey('Users',related_name='all_questions')
    question_content = models.CharField(max_length=255, blank=True)
    question_detail = models.TextField(blank=True)
    topic = models.ManyToManyField('Topics', related_name="all_questions", through='QuestionsTopic')
    publish_time = models.DateTimeField(blank=True, null=True,default=datetime.now)
    active_time = models.DateTimeField(blank=True, null=True)
    browse_num = models.IntegerField(blank=True, null=True)
    answer_num = models.IntegerField(blank=True, null=True)
    want_answer_num = models.IntegerField(blank=True, null=True)
    attention_num = models.IntegerField(blank=True, null=True)
    invation_num = models.IntegerField(blank=True, null=True)
    anonymous = models.IntegerField(blank=True, null=True)
    has_attach = models.IntegerField(blank=True, null=True)
    school = models.ManyToManyField('Schools', related_name="all_questions", through='QuestionSchool')    # add School
    
    class Meta:
        db_table = 'questions'
    def __unicode__(self):
        return u"[question_id: "+str(self.question_id)+"|question_content: "+self.question_content+"]"
    objects = models.Manager()
    common_objects = CommonDao();
    
class QuestionsFocus(models.Model):
    focus_id = models.AutoField(primary_key=True)
    question = models.ForeignKey('Questions', blank=True, null=True)
    user = models.ForeignKey('UsersAffiliate', blank=True, null=True)   # UsersAffiliate->Users
    focus_time = models.DateTimeField(blank=True, default=datetime.now)
    
    class Meta:
        db_table = 'questions_focus'
    def __unicode__(self):
        return "[focus_id: "+str(self.focus_id)+"|question_id: "+str(self.question_id)+"|user_id: "+str(self.user_id)+"]"
    objects = models.Manager()
    common_objects = CommonDao();

class QuestionsTopic(models.Model):
    id = models.AutoField(primary_key=True)
    question = models.ForeignKey('Questions', blank=True, null=True)
    topic = models.ForeignKey('Topics', blank=True, null=True)
    
    class Meta:
        db_table = 'questions_topic'
    def __unicode__(self):
        return "[focus_id: "+str(self.focus_id)+"|question_id: "+str(self.question_id)+"|topic_id: "+str(self.topic_id)+"]"
    objects = models.Manager()
    common_objects = CommonDao();    
    
class QuestionSchool(models.Model):
    id = models.AutoField(primary_key=True)
    question = models.ForeignKey('Questions', blank=True, null=True)
    school = models.ForeignKey('Schools', blank=True, null=True)
    
    class Meta:
        db_table = 'question_school'
    def __unicode__(self):
        return "[focus_id: "+str(self.focus_id)+"|question_id: "+str(self.question_id)+"|school_id: "+str(self.school_id)+"]"
    objects = models.Manager()
    common_objects = CommonDao();
    
# New Schools class, store all candidate school data
# 新Schools类，存储所以候选学校信息
class Schools(models.Model):    
    school_id = models.AutoField(primary_key=True)
    school_name = models.CharField(max_length=128, blank=True, null=True)
    region = models.CharField(max_length=128, blank=True, null=True)
    school_category = models.CharField(max_length=128, blank=True, null=True)

    class Meta:
        db_table = 'schools'
    def __unicode__(self):
        return u"[school_id: "+str(self.school_id)+"|school_name: "+str(self.school_name)+"|region: "+str(self.region)+"]"
    
    objects = models.Manager()
    common_objects = CommonDao();
# Former School class, store user's school relative information
# 前Schools类，存储用户相关的学校信息
class UserSchool(models.Model):
    primary_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('UsersAffiliate')  # UsersAffiliate->Users
    school = models.ForeignKey('Schools')
    academy = models.CharField(max_length=100, blank=True)
    entrance_time = models.CharField(max_length=20, blank=True);
    education = models.IntegerField(blank=True, null=True)
    class Meta:
        db_table = 'user_school'
    def __unicode__(self):
        return u'%s %s %s %s' % (self.school, self.user,self.academy,self.education)
    objects = models.Manager()
    common_objects = CommonDao();

class Topics(models.Model):
    topic_id = models.AutoField(primary_key=True)
    topic_name = models.CharField(max_length=50, blank=True)
    parent_id = models.IntegerField(blank=True, null=True)
    add_time = models.DateTimeField(blank=True, null=True)
    discuss_num = models.IntegerField(blank=True, null=True)
    topic_pic = models.CharField(max_length=255, blank=True,null=True)
    focus_num = models.IntegerField(blank=True, null=True)
    topic_school = models.ForeignKey('Schools',db_column='school_id')
    
    class Meta:
        db_table = 'topics'

    def __unicode__(self):
        return u"[topic_id:"+str(self.topic_id)+",topic_name:"+self.topic_name+",category_id:"+str(self.parent_id)+"]"
    objects = models.Manager()
    common_objects = CommonDao();
    
class TopicFocus(models.Model):
    focus_id = models.AutoField(primary_key=True)
    topic = models.ForeignKey('Topics', blank=True, null=True)
    user = models.ForeignKey('UsersAffiliate', blank=True, null=True)
    focus_time = models.DateTimeField(blank=True, default=datetime.now)

    class Meta:
        db_table = 'topic_focus'
    def __unicode__(self):
        return u"[focus_id:"+str(self.topic_id)+",topic_id:"+str(self.topic_id)+",user_id:"+str(self.user_id)+"]"
    objects = models.Manager()
    common_objects = CommonDao();  

class Users(models.Model):
    user_id = models.AutoField(primary_key=True)
    user_name = models.CharField(max_length=10, blank=True,verbose_name='姓名')
    password = models.CharField(max_length=20)
    gender = models.IntegerField(blank=True, null=True)
    power = models.IntegerField(blank=True, null=True)
    email = models.CharField(max_length=20, blank=True)
    verify_email = models.IntegerField(blank=True, null=True)
    first_login = models.IntegerField(blank=True, null=True)
    cur_state = models.IntegerField(blank=True, null=True)
    head = models.CharField(max_length=100, blank=True)
    rem_name = models.IntegerField(blank=True, null=True)
    auto_login = models.IntegerField(blank=True, null=True)
    introduction = models.CharField(max_length=255, blank=True)
    message_num = models.IntegerField(blank=True, null=True)
    fans_num = models.IntegerField(blank=True, null=True)
    visit_num = models.IntegerField(blank=True, null=True)
    agree_num = models.IntegerField(blank=True, null=True)
    thanks_num = models.IntegerField(blank=True, null=True)
    integral = models.IntegerField(blank=True, null=True)
    affiliate_flag = models.IntegerField(blank=True, null=True)

    # Remove, one user can have more than one school. Move relative information to class UserSchool 
    # 删除，同一个用户会有多个学校，移入UserSchool中
    # school_name = models.CharField(max_length=100, blank=True) 
    #以下信息全部放到用户学校表中
#     academy = models.CharField(max_length=100, blank=True)
#     entrance_time = models.DateTimeField(blank=True, null=True)
#     education = models.IntegerField(blank=True, null=True)
    class Meta:
        db_table = 'users'
    def __unicode__(self):
        return u'%s %s %s %s'% (self.user_id, self.user_name,self.password,self.introduction) 
#       return "[user_id:"+str(self.user_id)+",user_name:"+self.user_name+"]"
    objects = models.Manager()
    common_objects = CommonDao();
    
class UsersFocus(models.Model):
    focus_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('Users', blank=True, null=True,related_name="all_users")
    schoolmate = models.ForeignKey('Users', blank=True, null=True,related_name="all_focus_users")
    focus_time = models.DateTimeField(blank=True,default=datetime.now)
    class Meta:
        db_table = 'users_focus'  
    def __unicode__(self):
        return u'%s %s %s'% (self.focus_id, self.user_id,self.follow_uid) 
    objects = models.Manager()
    common_objects = CommonDao()
    
class UsersAffiliate(models.Model):
    user = models.ForeignKey(Users, primary_key=True)
    email_state = models.IntegerField(blank=True, null=True)
    qq = models.CharField(max_length=15, blank=True,null=True)
    qq_state = models.IntegerField(blank=True, null=True)
    phone = models.CharField(max_length=20, blank=True,null=True)
    phone_state = models.IntegerField(blank=True, null=True)
    website = models.CharField(max_length=100, blank=True,null=True)
    website_state = models.IntegerField(blank=True, null=True)
    reg_time = models.DateTimeField(blank=True, null=True,default=datetime.now)
    last_ip = models.CharField(max_length=20, blank=True,null=True)
    last_time = models.DateTimeField(blank=True, null=True)
    question_num = models.IntegerField(blank=True, null=True)
    answer_num = models.IntegerField(blank=True, null=True)
    attention_topic_num = models.IntegerField(blank=True, null=True)
    community_flag = models.IntegerField(blank=True, null=True)
    community_setting = models.CharField(max_length=255, blank=True,null=True)
    
    school = models.ManyToManyField('Schools',blank=True, null=True,through='UserSchool')
    question_focus = models.ManyToManyField('Questions', blank=True, null=True,through='QuestionsFocus')
    topic_focus = models.ManyToManyField('Topics', blank=True, null=True,through='TopicFocus')

#     school = models.ManyToManyField('UserSchool',blank=True, null=True,through='UserSchool')
#     question_focus = models.ManyToManyField('QuestionsFocus', blank=True, null=True,through='QuestionsFocus')
#     topic_focus = models.ManyToManyField('TopicFocus', blank=True, null=True,through='TopicFocus')

    class Meta:
        db_table = 'users_affiliate'
    def __unicode__(self):
        return u'%s %s %s %s'% (self.user, self.email_state,self.qq,self.qq_state) 
    objects = models.Manager()
    common_objects = CommonDao();