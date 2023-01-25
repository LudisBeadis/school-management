# Generated by Django 4.1.4 on 2023-01-01 21:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student', '0014_remove_chat_reciever_student_view_alter_chat_sender'),
    ]

    operations = [
        migrations.CreateModel(
            name='Library',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('cover', models.ImageField(blank=True, upload_to='student/library')),
                ('file', models.FileField(upload_to='student/library')),
                ('for_all', models.BooleanField(default=False)),
                ('for_student', models.BooleanField(default=True)),
                ('for_teacher', models.BooleanField(default=False)),
            ],
        ),
    ]