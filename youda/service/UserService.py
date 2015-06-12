#!/usr/bin/env python
# -*- coding: utf-8 -*- 
from django.db import transaction
from apps.CommonDao import CommonDao
from apps.models import UsersFocus, Users, UsersAffiliate, UserSchool, Schools,\
    UserJobs
import base64
import os
from YoudaBE import settings
from multiprocessing.process import Process
import time
from PIL import Image

class UserService():
    @transaction.commit_on_success
    def addFocusSchoolmate(self,user_id,schoolmate_id):
        commonDao =  CommonDao();
        user_focus = UsersFocus(user_id=user_id,schoolmate_id=schoolmate_id);
        focus = commonDao.tolist(UsersFocus,schoolmate_id=schoolmate_id);
        if len(focus)>0:
            return -1;
        commonDao.toadd(UsersFocus,user_focus);
        return 1;
    def toLogin(self,user_name,user_pass,flag):
        commonDao = CommonDao();
        user = commonDao.tolist(Users,user_name=user_name,password=user_pass);
        if user:
            if flag=="1":#自动登陆
                commonDao.toupdate(Users,user,auto_login=1,rem_name=0);
            if flag=="0":#记住用户名
                commonDao.toupdate(Users,user,auto_login=0,rem_name=1);
            return user[0];#存在该用户
        else:
            return 0;#不存在该用户
        
        
    def toRegister(self,post):
        '''
        变量说明：
        dict_state：用户在校还用户毕业
        dict_sex：用户性别
        es:学校信息
        '''
        dict_state = {
                      'in_school':1,
                      'not_in_school':2
                      };
        dict_sex={
                  'man':0,
                  'female':1 
                  }
#         for key in post:
#             print key,post.getlist(key);
        education = post['educate'];
        work = post['work'];

        user = Users(user_name=post['real_name'],gender=dict_sex[post['sex']],cur_state=dict_state[post['stage']],first_login=0,verify_email=0,power=0,rem_name=0,auto_login=0);
        commonDao = CommonDao();
        commonDao.toadd(Users, user);
        useraffiliatte = UsersAffiliate(user_id=user.user_id);
        commonDao.toadd(UsersAffiliate,useraffiliatte);
        #
        #将用户的教育经历插入数据，无论是毕业学生还是在校学生都有教育经历
        edus = education.split("#");
        edus = edus[0:len(edus)-1];#去掉分割造成的最后一个为空的元素
        for edu in edus:
            if edu != None and len(edu)!=0:
                es = edu.strip().split(" ");#去掉字符串前后的空格，然后进行分割
                print es;
                if es!=None and len(str(es[0]))!=0:#es=>[u'']
                    school = commonDao.toget(Schools,school_id=es[0]);#es[0]为学校id
                    if school!=0 and school!=-1:
                        user_school = UserSchool(user=useraffiliatte,school=school,academy=es[1],entrance_time=es[2],education=es[3]);
                        commonDao.toadd(UserSchool,user_school);
        #
        #毕业用户有工作经历
        if dict_state[post['stage']]==2:
            works = work.split("#");
            works = works[0:len(edus)-1];#去掉分割造成的最后一个为空的元素
            for work in works:
                if work != None:
                    w = work.strip().split(" ");#去掉字符串前后的空格，然后进行分割
                    if  w!=None and len(str(w[0]))!=0:
                        user_job = UserJobs(user=useraffiliatte,company_name=w[0],position=w[1],entrance_time=w[2],leave_time=w[3]);
                        commonDao.toadd(UserJobs, user_job);
                                                 
        #self.toSaveHead(post['img']);
        
        #开辟一个新的进程来保存用户的头像
        p = Process(target=self.toSaveHead(post['img']));
        p.start();
    def toSaveHead(self,pic):
        '''
             函数说明：
                            处理用户的头像上传;
                            分别生成200*200,70*70,60*60,50*50的头像
           变量说明：
           pic为64位加密的头像数据 
        '''
        if pic!=None:
            try:
                pic =  pic.split(",")[1];
                imgdata = base64.b64decode(pic);
                base_path = os.path.join(settings.BASE_DIR,'uploads\\avatar\\').replace('\\','/');
                file_path_1 = base_path+'01/';
                time_str = str(int(time.time()));
                file_path_2 =file_path_1+'200_200'+time_str+'.jpg';
                to_pic = open(file_path_2,'wb');
                to_pic.write(imgdata);
                to_pic.close(); 
            except IndexError:
                return ;
            im = Image.open(file_path_2);
            im.thumbnail((70,70),Image.ANTIALIAS);
            print im.save(file_path_1+'70_70'+time_str+'.jpg');
            im.thumbnail((60,60),Image.ANTIALIAS);
            print im.save(file_path_1+'60_60'+time_str+'.jpg');
            im.thumbnail((50,50),Image.ANTIALIAS);
            print im.save(file_path_1+'50_50'+time_str+'.jpg');
        