from django.contrib import admin
from .models import *
# Register your models here.
from BomMan.models import BOM
admin.site.site_header = '天津长飞鑫茂光缆有限公司CIS系统'
admin.site.site_title = '天津长飞鑫茂光缆有限公司'


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    fields = ('week_no','order_name','bom','quantity')
    list_display = ('week_no','order_name','bom','quantity','steel_wire_weight','aluminum_band_weight',
                    'steel_band_weight','aluminum_band_width' )
    list_per_page = 50
    # ordering设置默认排序字段，负号表示降序排序
    ordering = ('create_time',)
    list_filter = ('week_no','order_name','bom')
    # 搜索字段
    search_fields = ('week_no','order_name')
    date_hierarchy = 'create_time'  # 详细时间分层筛选

    def save_model(self, request, obj, form, change):
        or_name=request.POST['order_name']
        wk_no=request.POST['week_no']
        con_quantity = request.POST['quantity']
        bom = BOM.objects.get(pk=request.POST['bom'])

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
        obj = Order(week_no=wk_no,order_name=or_name, order_value=or_name, quantity=con_quantity,bom=bom,
                       steel_wire_weight=gszl,aluminum_band_weight=ldzl,
                       steel_band_weight=gdzl, aluminum_band_width=ldkd)
        # obj.user = request.user
        super().save_model(request, obj, form, change)
