#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.db import models
from django.db import connection
from django.core.exceptions import MultipleObjectsReturned
#===============================================================================
# 本DAO包含对数据的 增 删 更新 获取单条记录 获取多条记录和分页 共六个通用数据接口
#===============================================================================
class CommonDao(models.Manager):
    PAGE = 1; #第几页
    PAGESIZE = 5; #页面大小
    cursor = connection.cursor();
    #===========================================================================
    # 向数据库中插入一条记录
    # @oo为类名  @o 为要添加到数据库的任意对象
    #===========================================================================
    def toadd(self,oo,o):
        o.save();
    #===========================================================================
    # 从数据库中删除一条记录 
    # @o 要删除的任意对象
    #===========================================================================
    def todele(self,oo,o):
        o.delete();
    #===========================================================================
    #从数据库中获得一条记录，返回是一个对象
    # @m 为dict类型 eg：toget(Uers,user_id=1,user_name='tomcat') toget(Users,{'user_id':1,'user_name':'tomcat'})
    #===========================================================================
    def toget(self,oo,**m):
        self =  oo.common_objects;
        try:
            o = self.get(**m);
            return o;
        except MultipleObjectsReturned:#捕获返回多条记录
            return -1;
        except oo.DoesNotExist:#捕获返回0调记录
            return 0;
    #===========================================================================
    # 从数据库中返回多条记录，返回是一个list
    #===========================================================================
    def tolist(self,oo,**m):
        self =  oo.common_objects;
        return self.all().filter(**m);
    #===========================================================================
    # 更新数据中某个字段的值，注意此处的o为实例，必须为tolist()函数处理的返回值，不可用toget()函数
    #===========================================================================
    def toupdate(self,oo,o,**m):
        self =  oo.common_objects;
        return o.update(**m);
    #===========================================================================
    # 分页查询，page，pagesize为默认构造函数，page第几页，pagesize页面大小，m为查询参数
    # 返回结果为map，TOTAL为总记录数，PAGE_COUNT为页面数，LIST为满足条件记录
    #===========================================================================
    def toquerypage(self,oo,page=PAGE,pagesize=PAGESIZE,**m):
        self =  oo.common_objects;
        total_obj = self.all().filter(**m).count();
        page_count = total_obj/pagesize if total_obj%pagesize==0 else total_obj/pagesize+1;
        list_obj = self.all().filter(**m)[(page-1)*pagesize:page*pagesize];
        map_obj = {};
        map_obj['TOTAL'] = total_obj;
        map_obj['PAGE_COUNT'] = page_count;
        map_obj['LIST'] = list_obj;
        return map_obj;
    #针对自定义sql语句，返回map了类型的数据
    def dictfetchall(self,cursor):
        desc = cursor.description
        return [
                dict(zip([col[0] for col in desc], row))
                for row in cursor.fetchall()
                ]
   