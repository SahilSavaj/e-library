# Generated by Django 4.0.5 on 2022-07-25 23:45

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('library_auth', '0009_remove_user_is_email_verified_user_username'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='username',
        ),
    ]