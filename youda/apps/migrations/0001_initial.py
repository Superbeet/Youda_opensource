# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Answers',
            fields=[
                ('answer_id', models.IntegerField(serialize=False, primary_key=True)),
                ('answer_content', models.TextField(blank=True)),
                ('publish_time', models.DateTimeField(default=datetime.datetime.now, null=True, blank=True)),
                ('support_num', models.IntegerField(null=True, blank=True)),
                ('anonymous', models.IntegerField(null=True, blank=True)),
                ('has_attach', models.IntegerField(null=True, blank=True)),
                ('comment_num', models.IntegerField(null=True, blank=True)),
            ],
            options={
                'db_table': 'answers',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='AnswersComments',
            fields=[
                ('comment_id', models.IntegerField(serialize=False, primary_key=True)),
                ('content', models.TextField(blank=True)),
                ('time', models.DateTimeField(default=datetime.datetime.now, null=True, blank=True)),
                ('comment_num', models.IntegerField(null=True, blank=True)),
                ('parent_id', models.IntegerField(null=True, blank=True)),
                ('answer', models.ForeignKey(to='apps.Answers')),
            ],
            options={
                'db_table': 'answers_comments',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Articles',
            fields=[
                ('article_id', models.IntegerField(serialize=False, primary_key=True)),
                ('article_title', models.CharField(max_length=255, blank=True)),
                ('article_detail', models.TextField(blank=True)),
                ('publish_time', models.DateTimeField(null=True, blank=True)),
                ('active_time', models.DateTimeField(null=True, blank=True)),
                ('browse_num', models.IntegerField(null=True, blank=True)),
                ('comment_num', models.IntegerField(null=True, blank=True)),
                ('attention_num', models.IntegerField(null=True, blank=True)),
            ],
            options={
                'db_table': 'articles',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Associations',
            fields=[
                ('ass_id', models.IntegerField(serialize=False, primary_key=True)),
                ('ass_name', models.CharField(max_length=100)),
                ('position', models.CharField(max_length=100, blank=True)),
                ('entrance_time', models.DateTimeField(null=True, blank=True)),
                ('leave_time', models.DateTimeField(null=True, blank=True)),
            ],
            options={
                'db_table': 'associations',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='InvitationUsers',
            fields=[
                ('invitation_id', models.IntegerField(serialize=False, primary_key=True)),
                ('send_user_name', models.CharField(max_length=10, blank=True)),
                ('receive_user_name', models.CharField(max_length=10, blank=True)),
            ],
            options={
                'db_table': 'invitation_users',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Logs',
            fields=[
                ('log_id', models.IntegerField(serialize=False, primary_key=True)),
                ('ip', models.CharField(max_length=20, blank=True)),
                ('operate_time', models.DateTimeField(default=datetime.datetime.now, null=True, blank=True)),
                ('operate_command', models.CharField(max_length=20, blank=True)),
                ('from_field', models.IntegerField(null=True, db_column='from', blank=True)),
                ('url', models.CharField(max_length=255, blank=True)),
            ],
            options={
                'db_table': 'logs',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Messages',
            fields=[
                ('message_id', models.IntegerField(serialize=False, primary_key=True)),
                ('content', models.CharField(max_length=255, blank=True)),
            ],
            options={
                'db_table': 'messages',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='PrivateLetters',
            fields=[
                ('letter_id', models.IntegerField(serialize=False, primary_key=True)),
                ('send_user_name', models.CharField(max_length=10, blank=True)),
                ('receive_user_name', models.CharField(max_length=10, blank=True)),
                ('content', models.CharField(max_length=255, blank=True)),
            ],
            options={
                'db_table': 'private_letters',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Questions',
            fields=[
                ('question_id', models.IntegerField(serialize=False, primary_key=True)),
                ('question_content', models.CharField(max_length=255, blank=True)),
                ('question_detail', models.TextField(blank=True)),
                ('publish_time', models.DateTimeField(default=datetime.datetime.now, null=True, blank=True)),
                ('active_time', models.DateTimeField(null=True, blank=True)),
                ('browse_num', models.IntegerField(null=True, blank=True)),
                ('answer_num', models.IntegerField(null=True, blank=True)),
                ('want_answer_num', models.IntegerField(null=True, blank=True)),
                ('attention_num', models.IntegerField(null=True, blank=True)),
                ('invation_num', models.IntegerField(null=True, blank=True)),
                ('anonymous', models.IntegerField(null=True, blank=True)),
                ('has_attach', models.IntegerField(null=True, blank=True)),
            ],
            options={
                'db_table': 'questions',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='QuestionsFocus',
            fields=[
                ('focus_id', models.IntegerField(serialize=False, primary_key=True)),
                ('focus_time', models.DateTimeField(default=datetime.datetime.now, auto_now_add=True)),
                ('question', models.ForeignKey(blank=True, to='apps.Questions', null=True)),
            ],
            options={
                'db_table': 'questions_focus',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Schools',
            fields=[
                ('school_id', models.IntegerField(serialize=False, primary_key=True)),
                ('school_name', models.CharField(max_length=128, null=True, blank=True)),
                ('region', models.CharField(max_length=128, null=True, blank=True)),
                ('school_category', models.CharField(max_length=128, null=True, blank=True)),
            ],
            options={
                'db_table': 'school',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='TopicFocus',
            fields=[
                ('focus_id', models.IntegerField(serialize=False, primary_key=True)),
                ('focus_time', models.DateTimeField(default=datetime.datetime.now, auto_now_add=True)),
            ],
            options={
                'db_table': 'topic_focus',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Topics',
            fields=[
                ('topic_id', models.IntegerField(serialize=False, primary_key=True)),
                ('topic_name', models.CharField(max_length=50, blank=True)),
                ('parent_id', models.IntegerField(null=True, blank=True)),
                ('add_time', models.DateTimeField(null=True, blank=True)),
                ('discuss_num', models.IntegerField(null=True, blank=True)),
                ('topic_pic', models.CharField(max_length=255, blank=True)),
                ('focus_num', models.IntegerField(null=True, blank=True)),
                ('topic_school', models.ForeignKey(to='apps.Schools')),
            ],
            options={
                'db_table': 'topics',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='UserJobs',
            fields=[
                ('job_id', models.IntegerField(serialize=False, primary_key=True)),
                ('position', models.CharField(max_length=200, blank=True)),
                ('city', models.CharField(max_length=100, blank=True)),
                ('entrance_time', models.DateTimeField(null=True, blank=True)),
                ('leave_time', models.DateTimeField(null=True, blank=True)),
                ('experience', models.TextField(blank=True)),
            ],
            options={
                'db_table': 'user_jobs',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Users',
            fields=[
                ('user_id', models.IntegerField(serialize=False, primary_key=True)),
                ('user_name', models.CharField(max_length=10, blank=True)),
                ('password', models.CharField(max_length=20)),
                ('gender', models.IntegerField(null=True, blank=True)),
                ('power', models.IntegerField(null=True, blank=True)),
                ('email', models.CharField(max_length=20, blank=True)),
                ('verify_email', models.IntegerField(null=True, blank=True)),
                ('first_login', models.IntegerField(null=True, blank=True)),
                ('cur_state', models.IntegerField(null=True, blank=True)),
                ('head', models.CharField(max_length=100, blank=True)),
                ('rem_name', models.IntegerField(null=True, blank=True)),
                ('auto_login', models.IntegerField(null=True, blank=True)),
                ('introduction', models.CharField(max_length=255, blank=True)),
                ('message_num', models.IntegerField(null=True, blank=True)),
                ('fans_num', models.IntegerField(null=True, blank=True)),
                ('visit_num', models.IntegerField(null=True, blank=True)),
                ('agree_num', models.IntegerField(null=True, blank=True)),
                ('thanks_num', models.IntegerField(null=True, blank=True)),
                ('integral', models.IntegerField(null=True, blank=True)),
                ('affiliate_flag', models.IntegerField(null=True, blank=True)),
            ],
            options={
                'db_table': 'users',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='UsersAffiliate',
            fields=[
                ('user', models.ForeignKey(primary_key=True, serialize=False, to='apps.Users')),
                ('email_state', models.IntegerField(null=True, blank=True)),
                ('qq', models.CharField(max_length=15, blank=True)),
                ('qq_state', models.IntegerField(null=True, blank=True)),
                ('phone', models.CharField(max_length=20, blank=True)),
                ('phone_state', models.IntegerField(null=True, blank=True)),
                ('website', models.CharField(max_length=100, blank=True)),
                ('website_state', models.IntegerField(null=True, blank=True)),
                ('reg_time', models.DateTimeField(default=datetime.datetime.now, null=True, blank=True)),
                ('last_ip', models.CharField(max_length=20, blank=True)),
                ('last_time', models.DateTimeField(null=True, blank=True)),
                ('question_num', models.IntegerField(null=True, blank=True)),
                ('answer_num', models.IntegerField(null=True, blank=True)),
                ('attention_topic_num', models.IntegerField(null=True, blank=True)),
                ('community_flag', models.IntegerField(null=True, blank=True)),
                ('community_setting', models.CharField(max_length=255, blank=True)),
            ],
            options={
                'db_table': 'users_affiliate',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='UserSchool',
            fields=[
                ('primary_id', models.IntegerField(serialize=False, primary_key=True)),
                ('academy', models.CharField(max_length=100, blank=True)),
                ('entrance_time', models.DateTimeField(null=True, blank=True)),
                ('education', models.IntegerField(null=True, blank=True)),
                ('school', models.ForeignKey(blank=True, to='apps.Schools', null=True)),
                ('user', models.ForeignKey(blank=True, to='apps.Users', null=True)),
            ],
            options={
                'db_table': 'user_school',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='UsersFocus',
            fields=[
                ('focus_id', models.IntegerField(serialize=False, primary_key=True)),
                ('focus_time', models.DateTimeField(default=datetime.datetime.now, blank=True)),
                ('schoolmate', models.ForeignKey(related_name='all_focus_users', blank=True, to='apps.Users', null=True)),
                ('user', models.ForeignKey(related_name='all_users', blank=True, to='apps.Users', null=True)),
            ],
            options={
                'db_table': 'users_focus',
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='users',
            name='school',
            field=models.ManyToManyField(to='apps.Schools', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='userjobs',
            name='user',
            field=models.ForeignKey(to='apps.UsersAffiliate'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='topicfocus',
            name='topic',
            field=models.ForeignKey(blank=True, to='apps.Topics', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='topicfocus',
            name='user',
            field=models.ForeignKey(blank=True, to='apps.Users', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='questionsfocus',
            name='user',
            field=models.ForeignKey(blank=True, to='apps.Users', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='questions',
            name='topic',
            field=models.ManyToManyField(to='apps.Topics', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='questions',
            name='user',
            field=models.ForeignKey(related_name='all_questions', to='apps.Users'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='privateletters',
            name='receive_user',
            field=models.ForeignKey(related_name='all_receiverletter_users', to='apps.Users'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='privateletters',
            name='send_user',
            field=models.ForeignKey(related_name='all_sendletter_users', to='apps.Users'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='messages',
            name='message_user',
            field=models.ForeignKey(to='apps.Users'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='logs',
            name='user',
            field=models.ForeignKey(blank=True, to='apps.Users', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='invitationusers',
            name='question',
            field=models.ForeignKey(to='apps.Questions'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='invitationusers',
            name='receive_user',
            field=models.ForeignKey(related_name='all_receive_users', to='apps.Users'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='invitationusers',
            name='send_user',
            field=models.ForeignKey(related_name='all_send_users', blank=True, to='apps.Users', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='associations',
            name='user',
            field=models.ForeignKey(to='apps.UsersAffiliate'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='articles',
            name='topic',
            field=models.ForeignKey(blank=True, to='apps.Topics', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='articles',
            name='user',
            field=models.ForeignKey(to='apps.Users'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='answerscomments',
            name='user',
            field=models.ForeignKey(to='apps.Users'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='answers',
            name='question',
            field=models.ForeignKey(to='apps.Questions'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='answers',
            name='user',
            field=models.ForeignKey(to='apps.Users'),
            preserve_default=True,
        ),
    ]
