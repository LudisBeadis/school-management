# Generated by Django 4.1.4 on 2023-01-02 15:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0045_level_grade_alter_profile_grade_alter_profile_level'),
        ('teacher', '0009_alter_teacher_subscribers'),
    ]

    operations = [
        migrations.AlterField(
            model_name='teacher',
            name='subject',
            field=models.ManyToManyField(blank=True, related_name='teacher_subjects', to='teacher.subject'),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='subscribers',
            field=models.ManyToManyField(blank=True, related_name='teacher_Subscribers', to='home.profile'),
        ),
    ]
