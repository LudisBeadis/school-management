# Generated by Django 4.1.4 on 2023-01-02 18:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('teacher', '0010_alter_teacher_subject_alter_teacher_subscribers'),
    ]

    operations = [
        migrations.AddField(
            model_name='teacher',
            name='view',
            field=models.BooleanField(default=False),
        ),
    ]
