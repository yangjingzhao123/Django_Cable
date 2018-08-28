
from django.db import models

class CableBOM(models.Model):
    no=models.CharField(verbose_name='光缆编码',max_length=30,unique=True)
    type=models.CharField(verbose_name='光缆类型',max_length=30,
                        choices=(('GYTA','GYTA'),('GYTS','GYTS'),('GYTA53','GYTA53'),('GYTS53','GYTS53'),
                        ('GYDTA', 'GYDTA'),('GYTS','GYTS'),('GYSXTW','GYDXTW')))
    core_num=models.CharField(verbose_name='光缆芯数',max_length=30,null=True, choices=(('2-12','2-12'),('14-30','14-30'),('32-36','32-36'),('38-60','38-60'),
                        ('62-72', '62-72'),('74-96','74-96'),('98-120','98-120'),('122-144','122-144'),('196-216','196-216')))

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.no


class ProcessBOM(models.Model):
    no = models.CharField(verbose_name='工艺BOM编码',max_length=30, unique=True)
    customer_name = models.CharField(verbose_name='客户名称',max_length=30,
                                     choices=(('ZYBZ','自营标准'),('DXBZ','电信标准'),('YDBZ','移动标准'),('LTBZ','联通标准') ))
    cable_structure = models.CharField(verbose_name='光缆结构', max_length=30,
                                       choices=(('1.6*5','1.6*5'),('1.6*6','1.6*6'),
                                                ('1.8*5','1.8*5'),('1.8*6','1.8*6'),
                                                ('1.9*6', '1.9*6'), ('2.0*5', '2.0*5'),
                                                ('2.0*6', '2.0*6'), ('2.0*8', '2.0*8'),
                                                ('2.0*10', '2.0*10'), ('2.0*12', '2.0*12'),
                                                ('2.0*18', '2.0*18'), ('2.4*6', '2.4*6'),
                                                ('2.5*5', '2.5*5'),   ('2.5*6', '2.5*6'),
                                                ('2.5*8', '2.5*8'),  ('2.5*12', '2.5*12'),
                                                ('12F', '12F')
                                                ))
    steel_wire_structure=models.CharField(verbose_name='钢丝结构',max_length=30,
                                          choices=(('1.4','1.4'),('1.45','1.45'),('1.6','1.6'),('1.7','1.7'),('2.0','2.0'),('2.5','2.5') ))

    steel_wire_weight_kg = models.DecimalField(verbose_name='钢丝重量_kg',max_digits=18, decimal_places=3,null=True,blank=True)
    aluminum_band_weight_kg = models.DecimalField(verbose_name='铝带重量_kg',max_digits=18, decimal_places=3,null=True,blank=True)
    steel_band_weight_kg = models.DecimalField(verbose_name='钢带重量_kg',max_digits=18, decimal_places=3,null=True,blank=True)
    aluminum_band_width_mm = models.DecimalField(verbose_name='铝带宽度_mm',max_digits=18, decimal_places=3,null=True,blank=True)
    cable=models.ForeignKey(CableBOM,on_delete=models.CASCADE)

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)


    def __str__(self):
        return self.no

class Contract(models.Model):
    no=models.CharField(verbose_name='合同编号',max_length=30, unique=True)

    customer=models.ForeignKey(ProcessBOM,verbose_name='客户要求',on_delete=models.CASCADE)
    quantity=models.DecimalField(verbose_name='合同长度_km',max_digits=18, decimal_places=3)


    steel_wire_weight_kg = models.DecimalField(verbose_name='钢丝重量_kg', max_digits=18, decimal_places=3,null=True,blank=True)
    aluminum_band_weight_kg = models.DecimalField(verbose_name='铝带重量_kg', max_digits=18, decimal_places=3,null=True,blank=True)
    steel_band_weight_kg = models.DecimalField(verbose_name='钢带重量_kg', max_digits=18, decimal_places=3,null=True,blank=True)
    aluminum_band_width_mm = models.DecimalField(verbose_name='铝带宽度_mm', max_digits=18, decimal_places=3,null=True,blank=True)

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)


#########################################################################################################
import uuid
class BasicModel(models.Model):
    model_no=models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    model_name=models.CharField(verbose_name=u'模型名称',max_length=30,unique=True)
    model_value=models.CharField(max_length=30,unique=True)#必须以模型英文名开头，便于后期检索

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.model_name
    class Meta:
        verbose_name = u"1.基本模型"
        verbose_name_plural = u"1.基本模型"



class BasicModelExtend(models.Model):
    model_extend_no = models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    model_extend_name = models.CharField(verbose_name=u'扩展属性',max_length=30, unique=True)
    model_extend_value = models.CharField(max_length=30, unique=True) #必须以模型英文名开头，便于后期检索
    model_no=models.ForeignKey(BasicModel,related_name='model_extend',on_delete=models.CASCADE)

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.model_extend_name


class Category(models.Model):
    category_no= models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    category_name=models.CharField(verbose_name=u'类别名称',max_length=20)
    category_value = models.CharField(max_length=30)#必须以模型英文名开始，便于后期检索
    if_sealed=models.BooleanField(verbose_name=u'是否密封类',default=True)
    parent_no=models.ForeignKey("self",verbose_name=u'上级分类',on_delete=models.CASCADE,blank=True,null=True,limit_choices_to={'if_sealed':False})

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.category_name
    class Meta:
        verbose_name = u"2.类别划分"
        verbose_name_plural = u"2.类别划分"

class Material(models.Model):
    material_no = models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    material_name = models.CharField(verbose_name=u'物料名称',max_length=30, null=True)
    material_value = models.CharField(verbose_name=u'物料编码',max_length=40, null=True)
    material_type = models.CharField(verbose_name=u'类型',max_length=30)
    material_specification = models.CharField(verbose_name=u'规格',max_length=30)
    material_unit = models.CharField(verbose_name=u'单位',max_length=30)
    basic_model_no = models.ForeignKey(BasicModel,verbose_name=u'基础模型',related_name='model_material', on_delete=models.CASCADE,limit_choices_to={'model_value__istartswith': 'Material'},)
    category = models.ManyToManyField(Category,verbose_name=u'编码分类',
                                         # through='MaterialCategory',
                                         # through_fields=('material_no', 'category_no'),
                                         limit_choices_to={'category_value__istartswith': 'Material','if_sealed':True},
                                         )

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)

    @property
    def full_name(self):

        aaa='%s %s %s' % (self.material_name, self.material_type,self.material_specification)
        return aaa

    def __str__(self):
        return self.material_name
    class Meta:
        verbose_name = u"3.物料编码"
        verbose_name_plural = u"3.物料编码"

class MaterialExtend(models.Model):
    material_extend_no = models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    material_extend_value=models.CharField(max_length=30)

    material_no=models.ForeignKey(Material,on_delete=models.CASCADE)
    basic_model_extend_no=models.ForeignKey(BasicModelExtend,on_delete=models.CASCADE,
                                            limit_choices_to={'model_extend_value__istartswith':'Material'})

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)

    @property
    def full_name(self):
        "Returns the person's full name."
        return '%s %s' % (self.material_no, self.basic_model_extend_no)
    def __str__(self):
        return self.full_name
    class Meta:
        verbose_name = u"3.1.物料编码_扩展属性"
        verbose_name_plural = u"3.1.物料编码_扩展属性"

class BOM(models.Model):
    bom_no=models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    product_no=models.ForeignKey(Material,verbose_name=u'产品类型',on_delete=models.CASCADE,related_name='pro_bom', limit_choices_to={'material_name__contains':'光缆'})
    customer=models.CharField(max_length=30,verbose_name=u'客户类型',  choices=(('ZY',u'自营'),('DX',u'电信'),('YD',u'移动'),('LT',u'联通')))
    cable_structure= models.ForeignKey(Material,verbose_name=u'光缆结构',on_delete=models.CASCADE,related_name='cs_bom', limit_choices_to={'material_name__contains':'光缆结构'})


    steel_wire_no=models.ForeignKey(Material,verbose_name=u'钢丝型号',on_delete=models.CASCADE,related_name='sw_bom',limit_choices_to={'material_name__contains':'钢丝'},null=True,blank=True)
    aluminum_band_no=models.ForeignKey(Material,verbose_name=u'铝带型号',on_delete=models.CASCADE,related_name='ab_bom',limit_choices_to={'material_name__contains':'铝带'},null=True,blank=True)
    steel_band_no=models.ForeignKey(Material,verbose_name=u'钢带型号',on_delete=models.CASCADE,related_name='sb_bom',limit_choices_to={'material_name__contains':'钢带'},null=True,blank=True)

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
        return '%s %s %s %s' % (self.customer,self.product_no, self.steel_wire_no,self.cable_structure)

    def __str__(self):
        return self.full_name
    class Meta:
        verbose_name = u"4.BOM管理"
        verbose_name_plural = u"4.BOM管理"

class BOMExtend(models.Model):
    bom_extend_no = models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    bom_extend_value=models.CharField(max_length=30)

    bom_no=models.ForeignKey(BOM,on_delete=models.CASCADE)
    basic_model_extend_no=models.ForeignKey(BasicModelExtend,related_name='modelextend_bomextend',on_delete=models.CASCADE,
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
        return '%s %s' % (self.bom_no, self.basic_model_extend_no)

    def __str__(self):
        return self.full_name
    class Meta:
        verbose_name = u"4.1BOM属性扩展"
        verbose_name_plural = u"4.1BOM属性扩展"

class Order(models.Model):
    order_no = models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    order_name=models.CharField(verbose_name=u'订单编号',max_length=30,null=True,blank=True)
    order_value=models.CharField(max_length=30,null=True,blank=True)
    bom_no=models.ForeignKey(BOM,verbose_name='BOM',related_name='bom_order',on_delete=models.CASCADE)
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
        return '%s %s' % (self.order_name, self.bom_no)

    def __str__(self):
        return self.full_name

    class Meta:
        verbose_name = u"5.订单管理"
        verbose_name_plural = u"5.订单管理"





