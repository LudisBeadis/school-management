# Generated by Django 4.1.5 on 2023-01-11 08:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('teacher', '0017_alter_teacher_view'),
    ]

    operations = [
        migrations.AddField(
            model_name='teacher',
            name='is_verified',
            field=models.BooleanField(default=False),
        ),
    ]
