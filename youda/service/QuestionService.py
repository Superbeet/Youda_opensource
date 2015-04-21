#!/usr/bin/env python
# -*- coding: utf-8 -*-
from apps.CommonDao import CommonDao
from apps.models import Questions
from django.db import transaction
class QuestionService:
    commonDao =  CommonDao();
    @transaction.commit_on_success
    def getAllQuestions(self):
        questions = self.commonDao.toquerypage(Questions,page=1);
        return questions;
        
    