from django.db import models
import uuid
import SysSetting
class BOM(models.Model):
    bom_id=models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    product=models.ForeignKey('SysSetting.ObjectCode',verbose_name=u'产品类型',on_delete=models.CASCADE,related_name='pro_bom', limit_choices_to={'object_name__contains':'光缆型号'})
    customer=models.CharField(max_length=30,verbose_name=u'客户类型',  choices=(('ZY',u'自营'),('DX',u'电信'),('YD',u'移动'),('LT',u'联通')))
    cable_structure= models.ForeignKey('SysSetting.ObjectCode',verbose_name=u'光缆结构',on_delete=models.CASCADE,related_name='cs_bom', limit_choices_to={'object_name__contains':'光缆结构'})


    steel_wire=models.ForeignKey('SysSetting.ObjectCode',verbose_name=u'钢丝型号',on_delete=models.CASCADE,related_name='sw_bom',limit_choices_to={'object_name__contains':'钢丝'},null=True,blank=True)
    aluminum_band=models.ForeignKey('SysSetting.ObjectCode',verbose_name=u'铝带型号',on_delete=models.CASCADE,related_name='ab_bom',limit_choices_to={'object_name__contains':'铝带'},null=True,blank=True)
    steel_band=models.ForeignKey('SysSetting.ObjectCode',verbose_name=u'钢带型号',on_delete=models.CASCADE,related_name='sb_bom',limit_choices_to={'object_name__contains':'钢带'},null=True,blank=True)

    steel_wire_weight=models.DecimalField(verbose_name=u'钢丝重量_kg', max_digits=18, decimal_places=3,null=True,blank=True)
    consume_coefficient_sw=models.DecimalField(verbose_name=u'钢丝消耗系数',default=1.000, max_digits=18, decimal_places=3)

    aluminum_band_weight=models.DecimalField(verbose_name=u'铝带重量_kg', max_digits=18, decimal_places=3,null=True,blank=True)
    consume_coefficient_ab = models.DecimalField(verbose_name=u'铝带消耗系数', default=1.000, max_digits=18, decimal_places=3)

    steel_band_weight=models.DecimalField(verbose_name=u'钢带重量_kg', max_digits=18, decimal_places=3,null=True,blank=True)
    consume_coefficient_sb = models.DecimalField(verbose_name=u'钢带消耗系数', default=1.000, max_digits=18, decimal_places=3)

    aluminum_band_width=models.DecimalField(verbose_name=u'铝带宽度_mm', max_digits=18, decimal_places=3,null=True,blank=True)

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)

    @property
    def full_name(self):
        "Returns the person's full name."
        return '%s %s %s %s' % (self.customer,self.product, self.steel_wire,self.cable_structure)

    def __str__(self):
        return self.full_name
    class Meta:
        verbose_name = u"BOM管理"
        verbose_name_plural = u"BOM管理"



class BOMExtend(models.Model):
    extend_id = models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    extend_value=models.CharField(max_length=30)

    bom=models.ForeignKey(BOM,on_delete=models.CASCADE)
    basic_model_extend=models.ForeignKey('SysSetting.BasicModelExtend',related_name='modelextend_bomextend',on_delete=models.CASCADE,
                                            limit_choices_to={'model_extend_value__istartswith':'BOM'})

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)

    @property
    def full_name(self):
        "Returns the person's full name."
        return '%s %s' % (self.bom, self.basic_model_extend_no)

    def __str__(self):
        return self.full_name
    class Meta:
        verbose_name = u"BOM属性扩展"
        verbose_name_plural = u"BOM属性扩展"







