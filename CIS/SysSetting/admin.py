from django.contrib import admin
from mptt.admin import MPTTModelAdmin
from .models import *

admin.site.site_header = '天津长飞鑫茂光缆有限公司CIS系统'
admin.site.site_title = '天津长飞鑫茂光缆有限公司'


class BasicModelExtendInLine(admin.TabularInline):
    model = BasicModelExtend
    fields = ('extend_name', 'extend_value', 'model')
    extra = 2


@admin.register(BasicModel)
class BasicModelAdmin(admin.ModelAdmin):
    fields = ('model_name', 'model_value')
    inlines = [BasicModelExtendInLine]
    list_display = ('model_name', 'model_value')
    list_filter = ('model_name', 'model_value')
    search_fields = ('model_name', 'model_value')


@admin.register(Category)
class Category(MPTTModelAdmin):
    mptt_level_indent = 20
    mptt_indent_field = "category_name"

    fields = ('parent', 'category_name', 'category_value', 'if_sealed')
    list_display = ('category_name', 'category_value', 'if_sealed', 'parent')
    list_filter = ('category_name', 'category_value', 'if_sealed', 'parent')
    search_fields = ('category_name', 'category_value', 'if_sealed')
    date_hierarchy = 'create_time'  # 详细时间分层筛选
    # ordering = ('create_time',)


@admin.register(ObjectCode)
class ObjectCode(admin.ModelAdmin):
    fields = ('model', 'category', 'object_name', 'object_value',  'type', 'specification', 'unit')
    list_display = ('object_name', 'object_value',  'type', 'specification', 'unit')
    list_filter = ('category','object_name',   'type', 'specification',)
    search_fields = ( 'object_name',   'type', 'specification',)
    ordering = ('create_time',)
