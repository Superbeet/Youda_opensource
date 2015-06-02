# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('apps', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='users',
            name='question_focus',
            field=models.ManyToManyField(to='apps.Questions', null=True, through='apps.QuestionsFocus', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='users',
            name='topic_focus',
            field=models.ManyToManyField(to='apps.Topics', null=True, through='apps.TopicFocus', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='topicfocus',
            name='focus_time',
            field=models.DateTimeField(default=datetime.datetime.now, blank=True),
            preserve_default=True,
        ),
    ]
