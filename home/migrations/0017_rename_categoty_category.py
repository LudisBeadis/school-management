# Generated by Django 4.1.4 on 2022-12-24 15:23

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0016_categoty_blog_category'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Categoty',
            new_name='Category',
        ),
    ]
