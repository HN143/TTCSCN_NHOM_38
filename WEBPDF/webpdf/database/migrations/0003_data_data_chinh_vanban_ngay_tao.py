# Generated by Django 5.1.2 on 2024-11-27 06:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('database', '0002_alter_data_original_file'),
    ]

    operations = [
        migrations.AddField(
            model_name='data',
            name='data_chinh',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='vanban',
            name='ngay_tao',
            field=models.BigIntegerField(blank=True, null=True),
        ),
    ]