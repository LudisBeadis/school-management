# Generated by Django 4.1.5 on 2023-01-09 10:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student', '0037_alter_student_year'),
    ]

    operations = [
        migrations.AddField(
            model_name='student',
            name='date',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
    ]
