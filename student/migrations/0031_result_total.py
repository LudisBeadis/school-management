# Generated by Django 4.1.4 on 2023-01-04 12:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('student', '0030_result_subject'),
    ]

    operations = [
        migrations.AddField(
            model_name='result',
            name='total',
            field=models.IntegerField(null=True),
        ),
    ]