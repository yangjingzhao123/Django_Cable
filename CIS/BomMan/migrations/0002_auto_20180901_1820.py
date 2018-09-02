# Generated by Django 2.1 on 2018-09-01 10:20

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('BomMan', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bom',
            name='customer',
            field=models.ForeignKey(limit_choices_to={'object_name__contains': '客户'}, on_delete=django.db.models.deletion.CASCADE, related_name='cus_bom', to='SysSetting.ObjectCode', verbose_name='客户分类'),
        ),
    ]
