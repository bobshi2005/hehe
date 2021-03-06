# coding=utf-8
import xlwt
import StringIO
import datetime
from django.template.response import TemplateResponse
from django.http import HttpResponse
from xadmin.views.base import CommAdminView , ModelAdminView
from receiving_list import get_project_receiving_list, generate_project_receiving_list
from vendor_account import get_account_details, generate_account_details, exportCheckAccountExcel
from payment_summary import get_payment_summary, generate_payment_summary
from receiving_checked_list import get_checked_project, export_checked_project_impl, export_all
from project_used import get_project_used_list, generate_project_used_list
from project.models import Project, Company
from material.models import Vendor
from order.models import Order, OrderLine, ReceivingLine, CheckAccount
from hehe.util import checkAccount, getYears, getMonths, getProjects, getCompany
from django.utils.translation import ugettext_lazy as _

class ProjectReceivingCheckedExportAllView(CommAdminView):
    
    def post(self, request, *args, **kwargs):
        year = int(request.POST['year'])
        return export_all(self, year)
        
            
        
    
class ProjectReceivingCheckedListView(CommAdminView):
    need_site_permission = True
    receiving_checked_list_template = 'views/receiving_checked_list.html'
    
    def get_media(self):
        media = super(ProjectReceivingCheckedListView, self).get_media()
        media = media + self.vendor('xadmin.widget.select.js', 'datepicker.js', 'datepicker.css', 'xadmin.widget.datetime.js', 'select.js', 'select.css', 'xadmin.plugin.actions.js', 'xadmin.plugins.css')
        return media
    
    def get(self, request, *args, **kwargs):
        context = super(ProjectReceivingCheckedListView, self).get_context()
        years = getYears()
        months = getMonths()
        context['years'] = years['years']
        context['months'] = months['months']
        context['year'] = years['year']
        context['month'] = months['month']
        return TemplateResponse(request, self.receiving_checked_list_template, context,
                                current_app=self.admin_site.name)
    
    def post(self, request, *args, **kwargs):
        if 'action' in request.POST:
            return self.export_checked_project(request)
        else:
            return self.search(request)
        
        
    def export_checked_project(self, request):
        selected = request.POST.getlist('_selected_action')
        if not selected:
            # Reminder that something needs to be selected or nothing will happen
            msg = _("Items must be selected in order to perform "
                            "actions on them. No items have been changed.")
            self.message_user(msg)
        else:
            return export_checked_project_impl(selected, request)
    
    def search(self, request):
        if 'year' in request.POST:
            year = request.POST['year']
        
        if 'month' in request.POST:
            month = request.POST['month']
        
        response = self.get(request)
        context = response.context_data
        projects = get_checked_project(int(year), int(month))  
        context['projects'] = projects
        context['year'] = int(year)
        context['month'] = int(month)
        if (len(projects) == 0):
            self.message_user(str(year) +"年"+ str(month)+"月" + "没有已对账的到货单")
        return response 
            
        
        
        
    
class ProjectReceivingListView(CommAdminView):
    need_site_permission = True
    receiving_list_template = 'views/receiving_list.html'
    
    
    def get_media(self):
        media = super(ProjectReceivingListView, self).get_media()
        media = media + self.vendor('xadmin.widget.select.js', 'datepicker.js', 'datepicker.css', 'xadmin.widget.datetime.js', 'select.js', 'select.css', 'xadmin.plugin.actions.js', 'xadmin.plugins.css')
        return media
    
    def get(self, request, *args, **kwargs):
        context = super(ProjectReceivingListView, self).get_context()
        projects = getProjects(self)
        context['projects'] = projects
        
        vendors = Vendor.objects.filter(parent__isnull=True)
        context['vendors'] = vendors
        
        return TemplateResponse(request, self.receiving_list_template, context,
                                current_app=self.admin_site.name)
    
    def post(self, request, *args, **kwargs):
        if 'start_date' in request.POST:
            start_date = request.POST['start_date']
        if 'end_date' in request.POST:
            end_date = request.POST['end_date']
        
        project = ''
        if 'project' in request.POST:
            project = request.POST['project']
            
        vendor = ''
        if 'vendor' in request.POST:
            vendor = request.POST['vendor']
        
        response = self.get(request)
        context = response.context_data
        result = get_project_receiving_list(start_date, end_date, project, vendor)  
        context['result'] = result
        return response  

class ProjectReceivingExportExcelView(CommAdminView):
    
    def post(self, request, *args, **kwargs):
        file_type = 'xls'
        file_name = 'receiving'
        response = HttpResponse(mimetype="%s; charset=UTF-8" % 'application/vnd.ms-excel')
        response['Content-Disposition'] = ('attachment; filename=%s.%s' % (file_name, file_type)).encode('utf-8')
        
        context = super(ProjectReceivingExportExcelView, self).get_context()
        if 'start_date' in self.request.POST:
            context['start_date'] = self.request.POST['start_date']
            
        if 'end_date' in self.request.POST:
            context['end_date'] = self.request.POST['end_date']
        
        if 'project_name' in self.request.POST:
            context['project_name'] = self.request.POST['project_name']
        
        if 'vendor' in self.request.POST:
            context['vendor'] = self.request.POST['vendor']
            
        response.write(getattr(self, 'get_xls_export')(context))
        return response
    
    def get_xls_export(self, context):
        output = StringIO.StringIO()
        start_date = context['start_date']
        end_date = context['end_date']
        project = context['project_name']
        vendor = context['vendor']
        result = get_project_receiving_list(start_date, end_date, project, vendor)  
        book = xlwt.Workbook(encoding='utf-8')
        sheet = book.add_sheet("receiving_detail")
        book = generate_project_receiving_list(result, book, sheet)   
        book.save(output)
        output.seek(0)
        return output.getvalue()       
        
class VendorAccountListView(CommAdminView):
    need_site_permission = True
    vendor_account_template = 'views/vendor_account.html'
    
    def get_media(self):
        media = super(VendorAccountListView, self).get_media()
        media = media + self.vendor('xadmin.widget.select.js', 'datepicker.js', 'datepicker.css', 'xadmin.widget.datetime.js', 'select.js', 'select.css', 'xadmin.plugin.actions.js', 'xadmin.plugins.css')
        return media
    
    def get(self, request, *args, **kwargs):
        context = super(VendorAccountListView, self).get_context()
        vendors = Vendor.objects.filter(parent__isnull=True)
        companies = Company.objects.all()
        context['vendors'] = vendors
        context['companies'] = companies
        return TemplateResponse(request, self.vendor_account_template, context,
                                current_app=self.admin_site.name)
    
    def post(self, request, *args, **kwargs):
        if 'action' in request.POST:
            return self.check_account(request)
        else:
            return self.search(request)
             
    def check_account(self, request):
        
        selected = request.POST.getlist('_selected_action')
        if not selected:
            # Reminder that something needs to be selected or nothing will happen
            msg = _("Items must be selected in order to perform "
                            "actions on them. No items have been changed.")
            self.message_user(msg)
        else:
            return checkAccount(selected, request)
                    
        return self.search(request)
               
    def search(self, request):
        if 'start_date' in request.POST:
            start_date = request.POST['start_date']
        if 'end_date' in request.POST:
            end_date = request.POST['end_date']
        vendor = ''
        if 'vendor' in request.POST:
            vendor = request.POST['vendor']
        
        company_name = ''
        if 'company' in request.POST:
            company_name = request.POST['company']
        
        response = self.get(request)
        context = response.context_data
        company = getCompany(context['companies'], company_name )
        
        result = get_account_details(start_date, end_date, vendor, company)  
        context['result'] = result
        return response  
        
#对帐单
class VendorAccountExportExcelView(CommAdminView):
    
    def get(self, request, *args, **kwargs):
        if 'check_account_id' in self.request.GET:
            check_account_id = self.request.GET['check_account_id']
            
            checkAccount = CheckAccount.objects.filter(check_account_id = check_account_id)[0]
            receivingLines = ReceivingLine.objects.filter(checkAccount = checkAccount).order_by('receiving_date', 
                                                                                                'orderLine__documentLineItem__projectMaterial__project__name',
                                                                                                'orderLine__documentLineItem__projectMaterial__material__category__name',
                                                                                                'orderLine__documentLineItem__projectMaterial__material__name',
                                                                                                'orderLine__documentLineItem__projectMaterial__material__specification')
            return exportCheckAccountExcel(checkAccount, receivingLines)

class ProjectUsedListView(CommAdminView):
    need_site_permission = True
    project_used_list_template = 'views/project_used_list.html'
    
    def get_media(self):
        media = super(ProjectUsedListView, self).get_media()
        media = media + self.vendor('xadmin.widget.select.js', 'datepicker.js', 'datepicker.css', 'xadmin.widget.datetime.js', 'select.js', 'select.css', 'xadmin.plugin.actions.js', 'xadmin.plugins.css')
        return media
    
    def get(self, request, *args, **kwargs):
        context = super(ProjectUsedListView, self).get_context()
        companies = Company.objects.all()
        years = getYears()
        context['companies'] = companies
        context['years'] = years['years']
        context['result'] = {'year' : years['year']}
        
        return TemplateResponse(request, self.project_used_list_template, context,
                                current_app=self.admin_site.name)
    
    def post(self, request, *args, **kwargs):
        
        if 'company' in request.POST:
            company = request.POST['company']
            
        if 'year' in request.POST:
            year = request.POST['year']
        
        response = self.get(request)
        context = response.context_data
        result = get_project_used_list(int(year), company)  
        context['result'] = result
        return response 

class ProjectUsedExportExcelView(CommAdminView):
    
    def post(self, request, *args, **kwargs):
        file_type = 'xls'
        file_name = 'project_used'
        response = HttpResponse(mimetype="%s; charset=UTF-8" % 'application/vnd.ms-excel')
        response['Content-Disposition'] = ('attachment; filename=%s.%s' % (file_name, file_type)).encode('utf-8')
        
        context = super(ProjectUsedExportExcelView, self).get_context()
        
        if 'year' in self.request.POST:
            context['year'] = self.request.POST['year']
            
        if 'company' in self.request.POST:
            context['company'] = self.request.POST['company']
        
        response.write(getattr(self, 'get_xls_export')(context))
        return response
    
    def get_xls_export(self, context):
        output = StringIO.StringIO()
        year = context['year']
        company = context['company']
        result = get_project_used_list(int(year), company)  
        book = generate_project_used_list(result)   
        book.save(output)
        output.seek(0)
        return output.getvalue()       
            
class PaymentSummaryView(CommAdminView):
    need_site_permission = True
    payment_summary_template = 'views/payment_summary.html'
    
    def get_media(self):
        media = super(PaymentSummaryView, self).get_media()
        media = media + self.vendor('xadmin.widget.select.js', 'select.js', 'select.css', 'xadmin.plugin.actions.js', 'xadmin.plugins.css')
        return media
    
    def get(self, request, *args, **kwargs):
        context = super(PaymentSummaryView, self).get_context()
        years = getYears()
        months = getMonths()
        context['years'] = years['years']
        context['months'] = months['months']
        context['year'] = years['year']
        context['month'] = months['month']
        return TemplateResponse(request, self.payment_summary_template, context,
                                current_app=self.admin_site.name)
    
    def post(self, request, *args, **kwargs):
        
        if 'year' in request.POST:
            year = request.POST['year']
        
        if 'month' in request.POST:
            month = request.POST['month']
        
        response = self.get(request)
        context = response.context_data
        result = get_payment_summary(int(year), int(month))  
        context['result'] = result
        context['year'] = int(year)
        context['month'] = int(month)
        return response  

class PaymentSummaryExportExcelView(CommAdminView):
    
    def post(self, request, *args, **kwargs):
        file_type = 'xls'
        file_name = 'payment_summary'
        response = HttpResponse(mimetype="%s; charset=UTF-8" % 'application/vnd.ms-excel')
        response['Content-Disposition'] = ('attachment; filename=%s.%s' % (file_name, file_type)).encode('utf-8')
        
        context = super(PaymentSummaryExportExcelView, self).get_context()
        if 'year' in self.request.POST:
            context['year'] = self.request.POST['year']
            
        if 'month' in self.request.POST:
            context['month'] = self.request.POST['month']
            
        if 'exportDetail' in self.request.POST:
            context['exportDetail'] = self.request.POST['exportDetail']
        
        response.write(getattr(self, 'get_xls_export')(context))
        return response
    
    def get_xls_export(self, context):
        output = StringIO.StringIO()
        year = context['year']
        month = context['month']
        exportDetail = context['exportDetail']
        
        result = get_payment_summary(int(year), int(month))   
        book = generate_payment_summary(result, bool(int(exportDetail)))   
        book.save(output)
        output.seek(0)
        return output.getvalue()


            
            
