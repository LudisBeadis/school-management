# Generated by Django 4.1.4 on 2023-01-01 19:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student', '0012_remove_chat_code_chat_grade'),
    ]

    operations = [
        migrations.AddField(
            model_name='student',
            name='grade',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]