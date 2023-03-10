# Generated by Django 4.1.4 on 2023-01-05 13:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('redirector', '0005_delete_resulthistory'),
        ('teacher', '0012_teacher_facebook'),
        ('student', '0034_student_year'),
    ]

    operations = [
        migrations.CreateModel(
            name='ResultHistory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.IntegerField()),
                ('date', models.DateTimeField(auto_now_add=True, null=True)),
                ('history', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='redirector.history')),
                ('name', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='redirector.testhistory')),
                ('student', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='student.student')),
                ('subjects', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='teacher.subject')),
            ],
        ),
    ]
