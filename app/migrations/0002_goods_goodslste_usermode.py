# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-01-10 09:46
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='goods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('goodsname', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='goodslste',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('goodsname', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Usermode',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=100)),
                ('email', models.CharField(max_length=40)),
                ('password', models.CharField(max_length=40)),
            ],
        ),
    ]