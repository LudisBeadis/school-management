# Generated by Django 4.1.5 on 2023-01-10 13:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('teacher', '0016_remove_teacher_my_room_teacher_my_room'),
    ]

    operations = [
        migrations.AlterField(
            model_name='teacher',
            name='view',
            field=models.BooleanField(default=True),
        ),
    ]
