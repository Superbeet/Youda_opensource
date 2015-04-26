#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json
from datetime import datetime, date
#解决datetime.datetime is not JSON serializable 这个问题，既数据库中时间类型不可转化为json格式
class CJsonEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            return obj.strftime('%Y-%m-%d %H:%M:%S')
        elif isinstance(obj, date):
            return obj.strftime('%Y-%m-%d')
        else:
            return json.JSONEncoder.default(self, obj)