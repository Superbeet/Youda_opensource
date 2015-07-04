#!/usr/bin/env python
# -*- coding: utf-8 -*-
import MySQLdb
from django.contrib.sessions.models import Session

class default_class:
    #对用户传递参数进行转义，没有找到其他的相关函数
    def Sql_Injection(self,content):
        #return  django.db.backend.quote_name(content);
        i=0;
        if isinstance(content, list):
            for c in content:
                content[i]=MySQLdb.escape_string(c);
                i+=1;
            return content;
        else:        
            return MySQLdb.escape_string(content);
        
    def getSession(self):
        sess = Session.objects.all();
        for s in sess:
            print s.session_key,s.session_data,s.get_decoded();
        