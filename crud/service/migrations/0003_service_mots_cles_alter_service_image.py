# Generated by Django 4.2.6 on 2023-12-20 11:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('service', '0002_service_entreprise_alter_service_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='service',
            name='mots_cles',
            field=models.CharField(blank=True, max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='service',
            name='image',
            field=models.ImageField(upload_to='images/service'),
        ),
    ]