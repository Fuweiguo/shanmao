# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-01-21 05:23
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_order_ordergoods'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ordergoods',
            name='goods',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.app_goods'),
        ),
    ]
