# Generated by Django 4.0.5 on 2022-07-26 14:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('library', '0004_alter_uploadpdf_pdf'),
    ]

    operations = [
        migrations.AlterField(
            model_name='uploadpdf',
            name='pdf',
            field=models.FileField(upload_to='static/library/media/pdfs/'),
        ),
    ]
