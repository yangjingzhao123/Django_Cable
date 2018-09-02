


from django.contrib import admin
from .models import BOM, BOMExtend
from django.utils.translation import ugettext_lazy as _
from django.contrib.admin import SimpleListFilter
admin.site.site_header = '天津长飞鑫茂光缆有限公司CIS系统'
admin.site.site_title = '天津长飞鑫茂光缆有限公司'


class CustomerFilter(SimpleListFilter):
    title = 'customer'
    parameter_name = 'customer'

    def lookups(self, request, model_admin):
        products= set([c.customer for c in model_admin.model.objects.all()])

        return [(c.object_id, c.object_name) for c in products]

    def queryset(self, request, queryset):

         return queryset.filter(customer__object_id__exact=self.value())


class ProductFilter(SimpleListFilter):
    title = '产品类型'
    parameter_name = 'product'

    def lookups(self, request, model_admin):
        products= set([p.product for p in model_admin.model.objects.all()])
        return [(p.object_id, p.object_name) for p in products]

    def queryset(self, request, queryset):
        return queryset.filter(product__object_id__exact=self.value())


class CableStructureFilter(SimpleListFilter):
    title = '光缆结构'
    parameter_name = 'cable_structure'

    def lookups(self, request, model_admin):
        cable_structures= set([c_s.cable_structure for c_s in model_admin.model.objects.all()])
        return [(c_s.object_id, c_s.object_name) for c_s in cable_structures]

    def queryset(self, request, queryset):
        return queryset.filter(cable_structure__object_id__exact=self.value())


class CustomerFilter(SimpleListFilter):
    title = '客户名称'
    parameter_name = 'customer'

    def lookups(self, request, model_admin):
        return (
            ('DX', _(u'电信')),
            ('YD', _(u'移动')),
            ('LT', _(u'联通')),
            ('ZY', _(u'自营')),
        )

    def queryset(self, request, queryset):
        if self.value() == 'DX':
            return queryset.filter(customer__type='电信')
        if self.value() == 'YD':
            return queryset.filter(customer__type='移动')
        if self.value() == 'LT':
            return queryset.filter(customer__type='联通')
        if self.value() == 'ZY':
            return queryset.filter(customer__type='自营')


@admin.register(BOM)
class BOMAdmin(admin.ModelAdmin):
    # fields = ('product_no','customer')
    fieldsets = (
        ('产品信息：', {
            'fields': ('customer', 'product', 'cable_structure',)
        }),
        ('材料选择：', {
            'fields': ('steel_wire', 'aluminum_band', 'steel_band',)
        }),
        ('标准消耗：', {
            'fields': ('steel_wire_weight', 'aluminum_band_weight', 'steel_band_weight',)
        }),
        ('消耗系数：', {
            'fields': ('consume_coefficient_sw', 'consume_coefficient_ab', 'consume_coefficient_sb',)
        }),
        ('工艺要求：', {
            'fields': ('aluminum_band_width', )
        }),

    )

    list_display = ('customer', 'product', 'cable_structure',
                    'steel_wire', 'aluminum_band', 'steel_band',
                    'steel_wire_weight','aluminum_band_weight','steel_band_weight',
                    'consume_coefficient_sw', 'consume_coefficient_ab', 'consume_coefficient_sb',
                    'aluminum_band_width'
                    )
    list_per_page = 50
    # ordering设置默认排序字段，负号表示降序排序
    ordering = ('create_time',)
    # list_editable 设置默认可编辑字段
    # list_editable = [ 'material_value']
    # fk_fields 设置显示外键字段
    # fk_fields = ('machine_room_id',)
    # 过滤器
    list_filter = (CustomerFilter,)
    # 搜索字段
    search_fields = ('customer__object_name','product__object_name','cable_structure__object_name')
    date_hierarchy = 'create_time'  # 详细时间分层筛选

