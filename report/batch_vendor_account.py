# coding=utf-8
from order.models import Order, OrderLine, ReceivingLine, CheckAccount
from django.http import HttpResponse
import datetime
import xlwt
import StringIO
from report.vendor_account import get_check_account_xls_export_impl, output_book


def batchExportVendorAccount(self, queryset):
    file_type = 'xls'
    now = datetime.datetime.now()
    now = now.strftime("%Y%m%d%H%M%S")
    file_name = "对账单" + now
    response = HttpResponse(mimetype="%s; charset=UTF-8" % 'application/vnd.ms-excel')
    response['Content-Disposition'] = ('attachment; filename=%s.%s' % (file_name, file_type)).encode('utf-8') 
    
    book = xlwt.Workbook(encoding='utf-8')
    
    for obj in queryset:
        checkAccount = CheckAccount.objects.filter(check_account_id = obj.check_account_id)[0]
        receivingLines = ReceivingLine.objects.filter(checkAccount = checkAccount).order_by('receiving_date', 
                                                                                            'orderLine__documentLineItem__projectMaterial__project__name',
                                                                                            'orderLine__documentLineItem__projectMaterial__material__category__name',
                                                                                            'orderLine__documentLineItem__projectMaterial__material__name',
                                                                                            'orderLine__documentLineItem__projectMaterial__material__specification')

        sheetName = checkAccount.vendor.name
        sheet = book.add_sheet(sheetName)
        get_check_account_xls_export_impl(checkAccount, receivingLines, book, sheet)
        
    response.write(output_book(book))
    return response