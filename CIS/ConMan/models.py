from django.db import models
import uuid
import SysSetting
import ConMan
import BomMan
class Order(models.Model):
    order_id = models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    order_name=models.CharField(verbose_name=u'订单编号',max_length=30,null=True,blank=True)
    order_value=models.CharField(max_length=30,null=True,blank=True)
    bom=models.ForeignKey('BomMan.BOM',verbose_name='BOM',related_name='bom_order',on_delete=models.CASCADE)
    quantity = models.DecimalField(verbose_name=u'合同长度_km', max_digits=18, decimal_places=3)


    steel_wire_weight = models.DecimalField(verbose_name=u'钢丝重量_kg', max_digits=18, decimal_places=3, null=True,
                                            blank=True)
    aluminum_band_weight=models.DecimalField(verbose_name=u'铝带重量_kg', max_digits=18, decimal_places=3,null=True,
                                             blank=True)
    steel_band_weight = models.DecimalField(verbose_name=u'钢带重量_kg', max_digits=18, decimal_places=3, null=True,
                                            blank=True)
    aluminum_band_width = models.DecimalField(verbose_name=u'铝带宽度_mm', max_digits=18, decimal_places=3, null=True,
                                              blank=True)

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)

    @property
    def full_name(self):
        "Returns the person's full name."
        return '%s %s' % (self.order_name, self.order_value)

    def __str__(self):
        return self.full_name

    class Meta:
        verbose_name = u"订单管理"
        verbose_name_plural = u"订单管理"

