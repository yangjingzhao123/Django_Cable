
from django.db import models
from mptt.models import MPTTModel, TreeForeignKey,TreeManyToManyField
import uuid


# 系统模型
class BasicModel(models.Model):
    model_id = models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    model_name = models.CharField(verbose_name=u'模型名称', max_length=30, unique=True)
    model_value = models.CharField(max_length=30, unique=True)#必须以模型英文名开头，便于后期检索

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.model_name

    class Meta:
        verbose_name = u"1.系统模型"
        verbose_name_plural = u"1.系统模型"


# 模型扩展
class BasicModelExtend(models.Model):
    extend_id = models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    extend_name = models.CharField(verbose_name=u'扩展属性', max_length=30, unique=True)
    extend_value = models.CharField(max_length=30, unique=True)
    model = models.ForeignKey(BasicModel, related_name='model_extend', on_delete=models.CASCADE)

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.extend_name


#  分类设置
class Category(MPTTModel):
    category_id = models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    category_name = models.CharField(verbose_name=u'类别名称', max_length=20)
    category_value = models.CharField(max_length=30)  # 必须以模型英文名开始，便于后期检索
    if_sealed = models.BooleanField(verbose_name=u'是否密封类', default=False)
    parent = TreeForeignKey('self', verbose_name=u'上级分类', on_delete=models.CASCADE, null=True, blank=True,
                            related_name='children')

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.category_name

    class MPTTMeta:
        order_insertion_by = ['category_name']

    class Meta:
        verbose_name = u"2.分类设置"
        verbose_name_plural = u"2.分类设置"


# 编码设置
class ObjectCode(models.Model):
    object_id=models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    object_name = models.CharField(verbose_name=u'名称', max_length=30, null=True)
    object_value = models.CharField(verbose_name=u'编码',max_length=40, null=True)
    model = models.ForeignKey(BasicModel, verbose_name=u'基础模型', related_name='model_material', on_delete=models.CASCADE,)
                              #limit_choices_to={'model_value__istartswith': 'Material'}, )
    category = TreeManyToManyField(Category, verbose_name=u'编码分类',)
                                   #limit_choices_to={'category_value__istartswith': 'Material', 'if_sealed': True})
    type = models.CharField(verbose_name=u'类型', max_length=30)
    specification = models.CharField(verbose_name=u'规格', max_length=30, blank=True, null=True)
    unit = models.CharField(verbose_name=u'单位', max_length=30, blank=True, null=True)

    create_by = models.CharField(max_length=30, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    update_by = models.CharField(max_length=30, blank=True, null=True)
    update_time = models.DateTimeField(auto_now=True, blank=True, null=True)
    del_flag = models.BooleanField(blank=True, null=True)
    remark = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.object_name

    class Meta:
        verbose_name = u"3.系统编码"
        verbose_name_plural = u"3.系统编码"


# 编码扩展属性
class ObjectExtend(models.Model):
    extend_id = models.UUIDField(primary_key=True, default=uuid.uuid1, editable=False)
    extend_value = models.CharField(max_length=30)

    object_code = models.ForeignKey(ObjectCode,on_delete=models.CASCADE)
    basic_model_extend=models.ForeignKey(BasicModelExtend,on_delete=models.CASCADE,)
                                            #limit_choices_to={'model_extend_value__istartswith':'Material'})

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


