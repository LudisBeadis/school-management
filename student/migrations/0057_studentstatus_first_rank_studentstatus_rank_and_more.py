# Generated by Django 4.1.5 on 2023-01-19 15:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student', '0056_remove_studentstatus_first_rank_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='studentstatus',
            name='first_rank',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='studentstatus',
            name='rank',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='studentstatus',
            name='second_rank',
            field=models.IntegerField(null=True),
        ),
    ]