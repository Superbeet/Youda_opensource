# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('apps', '0003_auto_20150522_1627'),
    ]

    operations = [
        migrations.AlterField(
            model_name='topics',
            name='topic_school',
            field=models.ForeignKey(to='apps.Schools', db_column='school_id'),
            preserve_default=True,
        ),
    ]
