# Generated by Django 4.1.4 on 2023-01-02 15:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student', '0018_course'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='cover',
            field=models.ImageField(blank=True, upload_to='student/course'),
        ),
    ]
