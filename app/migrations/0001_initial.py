# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-01-20 06:58
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='app_Carts',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.IntegerField()),
                ('isselect', models.BooleanField(default=True)),
            ],
        ),
        migrations.CreateModel(
            name='app_goods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('goodsname', models.CharField(max_length=100)),
                ('name', models.CharField(max_length=100)),
                ('price', models.CharField(max_length=10)),
                ('prices', models.CharField(max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='UserModes',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=100)),
                ('email', models.CharField(max_length=40)),
                ('password', models.CharField(max_length=40)),
                ('token', models.CharField(max_length=256)),
            ],
        ),
        migrations.AddField(
            model_name='app_carts',
            name='goods',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.app_goods'),
        ),
        migrations.AddField(
            model_name='app_carts',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.UserModes'),
        ),
    ]
