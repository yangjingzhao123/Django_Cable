from django.contrib import admin
from .models import CableBOM,ProcessBOM,Contract


admin.site.site_header = '天津长飞鑫茂光缆有限公司CIS系统'
admin.site.site_title = '天津长飞鑫茂光缆有限公司'


# class ProcessBOMInLine(admin.StackedInline):
#     model = ProcessBOM
#     fieldsets = [
#         ('工艺要求', {'fields': ('no',('customer_name','steel_wire_structure','cable_structure'))}),
#         ('BOM消耗', {
#             'classes': ('collapse',),
#             'fields': (('steel_wire_weight_kg','aluminum_band_weight_kg'), ('steel_band_weight_kg', 'aluminum_band_width_mm')),
#         }),
#     ]
#     extra =1
#
# class CableTypeAdmin(admin.ModelAdmin):
#     fields = ('no',('type','core_num'))
#     inlines = [ProcessBOMInLine]
#     list_display = ('no','type','core_num')
#     list_filter = ['no','type','core_num']
#     search_fields = ['no','type','core_num']
# admin.site.register(CableBOM,CableTypeAdmin)
#
# class ContractAdmin(admin.ModelAdmin):
#     fields = ('no','customer','quantity')
#
#     list_display = ('no','customer','quantity','steel_wire_weight_kg','aluminum_band_weight_kg',
#                     'steel_band_weight_kg','aluminum_band_width_mm')
#     list_filter = ['no','customer']
#     search_fields = ['no','customer']
#     def save_model(self, request, obj, form, change):
#         contract_no=request.POST['no']
#         processbom=ProcessBOM.objects.get(pk=request.POST['customer'])
#         con_quantity=request.POST['quantity']
#         if not (processbom.steel_wire_weight_kg is None):
#             gszl=float( processbom.steel_wire_weight_kg) *  float(con_quantity)
#         else:
#             gszl=processbom.steel_wire_weight_kg
#         if not(processbom.aluminum_band_weight_kg is None):
#             ldzl=float(processbom.aluminum_band_weight_kg)* float(con_quantity)
#         else:
#             ldzl = processbom.aluminum_band_weight_kg
#         if not(processbom.steel_band_weight_kg is None):
#             gdzl=float(processbom.steel_band_weight_kg)*float(con_quantity)
#         else:
#             gdzl =processbom.steel_band_weight_kg
#
#         ldkd=processbom.aluminum_band_width_mm
#         obj = Contract(no=contract_no, customer=processbom, quantity=con_quantity,
#                        steel_wire_weight_kg=gszl,aluminum_band_weight_kg=ldzl,
#                        steel_band_weight_kg=gdzl, aluminum_band_width_mm=ldkd)
#         # obj.user = request.user
#         super().save_model(request, obj, form, change)
# admin.site.register(Contract,ContractAdmin)


#################################################################################################
# from .models import  BasicModel,BasicModelExtend,Category,Material,MaterialExtend,BOM



from .models import *
class BasicModelExtendInLine(admin.TabularInline):
    model = BasicModelExtend
    fields= ('model_extend_name','model_extend_value','model_no')
    extra =2

@admin.register(BasicModel)
class BasicModelAdmin(admin.ModelAdmin):
    fields = ('model_name','model_value')
    inlines = [BasicModelExtendInLine]
    list_display = ('model_name','model_value')
    list_filter = ('model_name','model_value')
    search_fields = ('model_name','model_value')
@admin.register(Category)
class CategoryModelAdmin(admin.ModelAdmin):
    fields = ('parent_no','category_name','category_value','if_sealed')
    list_display = ('category_name','category_value','if_sealed','parent_no')
    list_filter = ('category_name','category_value','if_sealed','parent_no')
    search_fields = ('category_name','category_value','if_sealed','parent_no')



@admin.register(Material)
class MaterialModelAdmin(admin.ModelAdmin):
   fields = (('material_name','basic_model_no'),('material_value','material_type'),('material_specification','material_unit'),'category')


   filter_horizontal = ('category',)

   #显示字段
   list_display = ('material_name','material_value','material_type','material_specification','material_unit')
   # list_per_page设置每页显示多少条记录，默认是100条
   list_per_page = 50
   # ordering设置默认排序字段，负号表示降序排序
   ordering = ('create_time',)
   # list_editable 设置默认可编辑字段
   #list_editable = [ 'material_value']
   # fk_fields 设置显示外键字段
   #fk_fields = ('machine_room_id',)
   #过滤器
   list_filter = ('material_type','material_specification')
   #搜索字段
   search_fields = ('material_name','material_value','material_type','material_specification')
   date_hierarchy = 'create_time'  # 详细时间分层筛选

@admin.register(BOM)
class BOMAdmin(admin.ModelAdmin):
    # fields = ('product_no','customer')
    fieldsets = (
        ('产品信息：', {
            'fields': (('product_no','customer','cable_structure'),)
        }),
        ('材料选择：', {
            'fields': (('steel_wire_no','aluminum_band_no','steel_band_no'),)
        }),
        ('标准消耗：', {
            'fields': (('steel_wire_weight','aluminum_band_weight','steel_band_weight'),)
        }),
        ('标准消耗：', {
            'fields': (('consume_coefficient_sw', 'consume_coefficient_ab', 'consume_coefficient_sb'),)
        }),
        ('工艺要求：', {
            'fields': ('aluminum_band_width', )
        }),

    )


    list_display = ('product_no','customer','cable_structure',
                    'steel_wire_no','aluminum_band_no','steel_band_no',
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
    list_filter = ('product_no','customer')
    # 搜索字段
    search_fields = ('product_no','customer')
    date_hierarchy = 'create_time'  # 详细时间分层筛选

@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    fields = ('order_name','order_value','bom_no','quantity')
    list_display = ('order_name','order_value','bom_no','quantity','steel_wire_weight','aluminum_band_weight',
                    'steel_band_weight','aluminum_band_width' )
    list_per_page = 50
    # ordering设置默认排序字段，负号表示降序排序
    ordering = ('create_time',)
    list_filter = ('order_name','bom_no')
    # 搜索字段
    search_fields = ('order_name','bom_no')
    date_hierarchy = 'create_time'  # 详细时间分层筛选

    def save_model(self, request, obj, form, change):
        or_name=request.POST['order_name']
        order_value = request.POST['order_value']
        con_quantity = request.POST['quantity']
        bom=BOM.objects.get(pk=request.POST['bom_no'])

        if not (bom.steel_wire_weight is None):
            gszl=float( bom.steel_wire_weight) *  float(con_quantity)* float(bom.consume_coefficient_sw)
        else:
            gszl=bom.steel_wire_weight

        if not(bom.aluminum_band_weight is None):
            ldzl=float(bom.aluminum_band_weight)* float(con_quantity)* float(bom.consume_coefficient_ab)
        else:
            ldzl = bom.aluminum_band_weight

        if not(bom.steel_band_weight is None):
            gdzl=float(bom.steel_band_weight)*float(con_quantity)* float(bom.consume_coefficient_sb)
        else:
            gdzl =bom.steel_band_weight

        ldkd=bom.aluminum_band_width
        obj = Order(order_name=or_name, order_value=order_value, quantity=con_quantity,bom_no=bom,
                       steel_wire_weight=gszl,aluminum_band_weight=ldzl,
                       steel_band_weight=gdzl, aluminum_band_width=ldkd)
        # obj.user = request.user
        super().save_model(request, obj, form, change)
