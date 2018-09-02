from django.urls import path
from . import views
app_name='ConMan'
urlpatterns = [
     path('', views.index, name='index'),
    # path('syslist/', views.syslist, name='syslist'),
    # path('sysadd/', views.sysadd, name='sysadd'),
    # path('<int:SysModel_id>/sysedit/', views.sysedit, name='sysedit'),
    # path('<int:SysModel_id>/', views.sysdetail, name='sysdetail'),
]