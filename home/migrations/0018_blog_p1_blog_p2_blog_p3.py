# Generated by Django 4.1.4 on 2022-12-24 18:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0017_rename_categoty_category'),
    ]

    operations = [
        migrations.AddField(
            model_name='blog',
            name='p1',
            field=models.TextField(blank=True, max_length=5000, null=True),
        ),
        migrations.AddField(
            model_name='blog',
            name='p2',
            field=models.TextField(blank=True, max_length=5000, null=True),
        ),
        migrations.AddField(
            model_name='blog',
            name='p3',
            field=models.TextField(blank=True, max_length=5000, null=True),
        ),
    ]
