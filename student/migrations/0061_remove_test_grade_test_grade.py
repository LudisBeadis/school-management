# Generated by Django 4.1.5 on 2023-01-22 13:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0050_alter_profile_level'),
        ('student', '0060_subjectreslut_s_from'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='test',
            name='grade',
        ),
        migrations.AddField(
            model_name='test',
            name='grade',
            field=models.ManyToManyField(to='home.grade'),
        ),
    ]
