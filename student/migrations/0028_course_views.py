# Generated by Django 4.1.4 on 2023-01-04 05:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student', '0027_remove_course_views'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='views',
            field=models.IntegerField(default=0),
        ),
    ]
