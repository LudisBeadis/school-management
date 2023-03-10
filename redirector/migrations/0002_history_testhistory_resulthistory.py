# Generated by Django 4.1.4 on 2023-01-05 11:55

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('teacher', '0012_teacher_facebook'),
        ('redirector', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='History',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=255, null=True)),
                ('last_name', models.CharField(max_length=255, null=True)),
                ('username', models.CharField(max_length=255, null=True)),
                ('password', models.CharField(max_length=255, null=True)),
                ('nationality', models.CharField(blank=True, max_length=255, null=True)),
                ('city', models.CharField(blank=True, max_length=255, null=True)),
                ('phone', models.CharField(max_length=255, null=True)),
                ('sex', models.CharField(max_length=255, null=True)),
                ('level', models.CharField(max_length=255, null=True)),
                ('grade', models.CharField(max_length=255, null=True)),
                ('is_manager', models.BooleanField(default=False, null=True)),
                ('is_teacher', models.BooleanField(default=False, null=True)),
                ('is_student', models.BooleanField(default=True, null=True)),
                ('is_staff', models.BooleanField(default=False, null=True)),
                ('is_verified', models.BooleanField(default=False, null=True)),
                ('birth', models.DateField(blank=True, null=True)),
                ('instagram', models.CharField(blank=True, max_length=5255, null=True)),
                ('telegram', models.CharField(blank=True, max_length=5255, null=True)),
                ('academicYear', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='redirector.academicyear')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='TestHistory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('capacity', models.IntegerField()),
                ('history', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='redirector.history')),
            ],
        ),
        migrations.CreateModel(
            name='ResultHistory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.IntegerField()),
                ('date', models.DateTimeField(auto_now_add=True, null=True)),
                ('history', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='redirector.history')),
                ('name', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='redirector.testhistory')),
                ('subjects', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='teacher.subject')),
            ],
        ),
    ]
