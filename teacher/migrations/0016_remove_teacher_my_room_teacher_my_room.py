# Generated by Django 4.1.5 on 2023-01-10 09:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0046_alter_profile_grade'),
        ('teacher', '0015_remove_teacher_subject_teacher_subject'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='teacher',
            name='my_room',
        ),
        migrations.AddField(
            model_name='teacher',
            name='my_room',
            field=models.ManyToManyField(to='home.grade'),
        ),
    ]