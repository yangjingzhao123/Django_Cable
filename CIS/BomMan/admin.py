from django.contrib import admin
from .models import  *
admin.site.site_header = '天津长飞鑫茂光缆有限公司CIS系统'
admin.site.site_title = '天津长飞鑫茂光缆有限公司'
# Register your models here.

@admin.register(BOM)
class BOMAdmin(admin.ModelAdmin):
    # fields = ('product_no','customer')
    fieldsets = (
        ('产品信息：', {
            'fields': ('product','customer','cable_structure',)
        }),
        ('材料选择：', {
            'fields': ('steel_wire','aluminum_band','steel_band',)
        }),
        ('标准消耗：', {
            'fields': ('steel_wire_weight','aluminum_band_weight','steel_band_weight',)
        }),
        ('标准消耗：', {
            'fields': ('consume_coefficient_sw', 'consume_coefficient_ab', 'consume_coefficient_sb',)
        }),
        ('工艺要求：', {
            'fields': ('aluminum_band_width', )
        }),

    )


    list_display = ('product','customer','cable_structure',
                    'steel_wire','aluminum_band','steel_band',
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
    list_filter = ('product','customer')
    # 搜索字段
    search_fields = ('product','customer')
    date_hierarchy = 'create_time'  # 详细时间分层筛选

