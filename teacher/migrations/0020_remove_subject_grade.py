# Generated by Django 4.1.5 on 2023-01-22 06:27

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('teacher', '0019_remove_subject_grade_subject_grade'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='subject',
            name='grade',
        ),
    ]