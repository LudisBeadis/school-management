# Generated by Django 4.1.4 on 2023-01-03 16:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student', '0023_remove_course_views_course_views'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='views',
            field=models.CharField(default='0', max_length=255, null=True),
        ),
    ]
