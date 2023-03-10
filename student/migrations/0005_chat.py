# Generated by Django 4.1.4 on 2023-01-01 07:47

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('student', '0004_remove_student_template'),
    ]

    operations = [
        migrations.CreateModel(
            name='Chat',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('message', models.TextField(max_length=1000000, null=True)),
                ('date', models.DateTimeField(auto_now_add=True, null=True)),
                ('reciever', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='recieve', to=settings.AUTH_USER_MODEL)),
                ('sender', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='send', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
