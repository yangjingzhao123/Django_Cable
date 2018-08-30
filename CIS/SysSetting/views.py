from django.http import HttpResponse
from django.template import loader
from django.shortcuts import  get_object_or_404, render

from django.http import Http404


def index(request):
    return HttpResponse("Hello, world. You're at the SysSetting index.")

def sysadd(request):
    return HttpResponse("You're looking at SysModel adding page." )

def sysedit(request, SysModel_id):
    response = "You're looking at the editing page of SysModel %s."
    # try:
    #     sysmodel=SysModel.objects.get(pk=SysModel_id)
    # except SysModel.DoesNotExist:
    #     raise Http404("SysModel does not exist")
   # sysmodel=get_object_or_404(CableBOM,pk=SysModel_id)
    #return render(request,'SysSetting/sysedit.html',{'sysmodel':sysmodel})
def sysdetail(request, SysModel_id):

    # try:
    #     sysmodel=SysModel.objects.get(pk=SysModel_id)
    # except SysModel.DoesNotExist:
    #     raise Http404("SysModel does not exist")
    #sysmodel=get_object_or_404(CableBOM,pk=SysModel_id)
    return render(request,'SysSetting/sysdetail.html',{'sysmodel':sysmodel})


def syslist(request):
    #latest_sysmodel_list =CableBOM.objects.order_by('-create_time')[:5]

    # output = ', '.join([m.model_name for m in latest_sysmodel_list])
    # return HttpResponse(output)

    # context = {
    #     'latest_sysmodel_list': latest_sysmodel_list,
    # }
    # template = loader.get_template('SysSetting/syslist.html')
    # return HttpResponse(template.render(context, request))

    context = {
     #   'latest_sysmodel_list': latest_sysmodel_list,
    }
    return render(request,'SysSetting/syslist.html',context)

# Create your views here.
