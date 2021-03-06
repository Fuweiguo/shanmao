# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-01-20 13:45
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.IntegerField(default=0)),
                ('createtime', models.DateTimeField(auto_now_add=True)),
                ('identifier', models.CharField(max_length=256)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.UserModes')),
            ],
        ),
        migrations.CreateModel(
            name='OrderGoods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.IntegerField()),
                ('goods', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.app_Carts')),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.Order')),
            ],
        ),
    ]
