# Generated by Django 4.1.5 on 2023-01-17 08:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('teacher', '0018_teacher_is_verified'),
        ('student', '0048_result_year'),
    ]

    operations = [
        migrations.CreateModel(
            name='SubjectReslut',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.IntegerField()),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='student.student')),
                ('subject', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='teacher.subject')),
            ],
        ),
    ]