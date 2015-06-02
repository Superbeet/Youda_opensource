# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('apps', '0002_auto_20150522_1543'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='users',
            name='question_focus',
        ),
        migrations.RemoveField(
            model_name='users',
            name='school',
        ),
        migrations.RemoveField(
            model_name='users',
            name='topic_focus',
        ),
        migrations.AddField(
            model_name='usersaffiliate',
            name='question_focus',
            field=models.ManyToManyField(to='apps.Questions', null=True, through='apps.QuestionsFocus', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='usersaffiliate',
            name='school',
            field=models.ManyToManyField(to='apps.Schools', null=True, through='apps.UserSchool', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='usersaffiliate',
            name='topic_focus',
            field=models.ManyToManyField(to='apps.Topics', null=True, through='apps.TopicFocus', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='questionsfocus',
            name='user',
            field=models.ForeignKey(blank=True, to='apps.UsersAffiliate', null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='topicfocus',
            name='user',
            field=models.ForeignKey(blank=True, to='apps.UsersAffiliate', null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='users',
            name='user_name',
            field=models.CharField(max_length=10, verbose_name='\u59d3\u540d', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='userschool',
            name='user',
            field=models.ForeignKey(to='apps.UsersAffiliate'),
            preserve_default=True,
        ),
    ]
