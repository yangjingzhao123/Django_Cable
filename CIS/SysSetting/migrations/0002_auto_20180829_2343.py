# Generated by Django 2.1 on 2018-08-29 15:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('SysSetting', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='basicmodel',
            options={'verbose_name': '1.系统模型', 'verbose_name_plural': '1.系统模型'},
        ),
        migrations.AlterModelOptions(
            name='objectcode',
            options={'verbose_name': '3.系统编码', 'verbose_name_plural': '3.系统编码'},
        ),
        migrations.AlterField(
            model_name='objectcode',
            name='specification',
            field=models.CharField(blank=True, max_length=30, null=True, verbose_name='规格'),
        ),
        migrations.AlterField(
            model_name='objectcode',
            name='unit',
            field=models.CharField(blank=True, max_length=30, null=True, verbose_name='单位'),
        ),
    ]
