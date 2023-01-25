# Generated by Django 4.1.5 on 2023-01-22 17:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('teacher', '0022_remove_subject_detail_subject_grade'),
        ('redirector', '0010_testhistory_academicyear'),
    ]

    operations = [
        migrations.CreateModel(
            name='SubjectReslutHistory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first', models.IntegerField(null=True)),
                ('f_from', models.IntegerField(null=True)),
                ('s_from', models.IntegerField(null=True)),
                ('second', models.IntegerField(null=True)),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='redirector.history')),
                ('subject', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='teacher.subject')),
                ('time', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='redirector.academicyear')),
            ],
        ),
        migrations.CreateModel(
            name='StudentStatusHistory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_total', models.IntegerField(null=True)),
                ('first_from', models.IntegerField(null=True)),
                ('first_average', models.FloatField(null=True)),
                ('second_total', models.IntegerField(null=True)),
                ('second_from', models.IntegerField(null=True)),
                ('second_average', models.FloatField(null=True)),
                ('average', models.FloatField(null=True)),
                ('first_rank', models.IntegerField(null=True)),
                ('second_rank', models.IntegerField(null=True)),
                ('rank', models.IntegerField(null=True)),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='redirector.history')),
                ('time', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='redirector.academicyear')),
            ],
        ),
    ]
