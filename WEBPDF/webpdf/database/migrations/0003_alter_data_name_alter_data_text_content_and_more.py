# Generated by Django 5.1.2 on 2025-01-02 03:39

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('database', '0002_alter_dieukientai_data'),
    ]

    operations = [
        migrations.AlterField(
            model_name='data',
            name='name',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='data',
            name='text_content',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='data',
            name='type',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name='data',
            name='van_ban',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='data', to='database.vanban'),
        ),
        migrations.AlterField(
            model_name='vanban',
            name='do_khan',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name='vanban',
            name='do_mat',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name='vanban',
            name='don_vi_soan_thao',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='vanban',
            name='id_api',
            field=models.IntegerField(blank=True, null=True, unique=True),
        ),
        migrations.AlterField(
            model_name='vanban',
            name='loai_van_ban',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='vanban',
            name='ngay_ban_hanh',
            field=models.BigIntegerField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='vanban',
            name='nguoi_ky',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='vanban',
            name='nguoi_tao',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='vanban',
            name='so_ky_hieu',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='vanban',
            name='so_van_ban',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='vanban',
            name='trich_yeu',
            field=models.TextField(blank=True, null=True),
        ),
    ]