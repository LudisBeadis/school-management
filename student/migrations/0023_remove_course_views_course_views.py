# Generated by Django 4.1.4 on 2023-01-03 16:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student', '0022_library_posted_by'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='course',
            name='views',
        ),
        migrations.AddField(
            model_name='course',
            name='views',
            field=models.CharField(max_length=255, null=True),
        ),
    ]
