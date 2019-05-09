# coding=utf-8
from django.db.models import Q
from django.http import  HttpResponseRedirect
from document.models import Document, DocumentLineItem
from order.models import Order, OrderLine, ReceivingLine
from project.models import Project
import xlwt
import datetime
ezxf = xlwt.easyxf
from xlwt import *
from xplugin.excel.excel_util import write_details, getNewBorder, write_line, write_two_lines
from report.vendor_account import *
import datetime 
from receiving_list import generate_project_receiving_list

def get_checked_project(year, month):
    
    start_date = get_first_date_of_month(year, month)
    end_date = get_last_date_of_month(year, month)
    
    args_list = [] 
    
    args_list.append(Q(checkAccount__start_date__gte=start_date)) 
    args_list.append(Q(checkAccount__end_date__lte=end_date))
    args = Q() 
    for each_args in args_list :
        args = args & each_args
        
    receivingLines = ReceivingLine.objects.filter(*(args,)).order_by('receiving_date', 
                                                                     'orderLine__documentLineItem__projectMaterial__project__name',
                                                                     'orderLine__documentLineItem__projectMaterial__material__category__name',
                                                                     'orderLine__documentLineItem__projectMaterial__material__name',
                                                                     'orderLine__documentLineItem__projectMaterial__material__specification')
    projects = set()
    for receivingLine in receivingLines:
        line = {}
        line['id'] = receivingLine.orderLine.order.project.id
        line['name'] = receivingLine.orderLine.order.project.name
        projects.add(tuple(line.items()))
    
    lines = []
    index = 0
    for project in projects:
        newProject = dict(project)
        line = {}
        index = index + 1
        line['index'] = index
        line['id'] = newProject['id']
        line['name'] = newProject['name']
        lines.append(line)
           
    return lines
        
def export_checked_project_impl(ids, request):
        
        
    year = -1
    if 'year' in request.POST:
        year = int(request.POST['year'])
    month = -1    
    if 'month' in request.POST:
        month = int(request.POST['month'])
        
    start_date = get_first_date_of_month(year, month)
    end_date = get_last_date_of_month(year, month)
    
    
    file_type = 'xls'
    file_name = 'receiving' + str(year) + str(month)
    response = HttpResponse(mimetype="%s; charset=UTF-8" % 'application/vnd.ms-excel')
    response['Content-Disposition'] = ('attachment; filename=%s.%s' % (file_name, file_type)).encode('utf-8')
    
    book = xlwt.Workbook(encoding='utf-8')
    
    for id in ids:
        args_list = [] 
        
        args_list.append(Q(checkAccount__start_date__gte=start_date)) 
        args_list.append(Q(checkAccount__end_date__lte=end_date))
        args_list.append(Q(orderLine__order__project__id=id))
        args = Q() 
        for each_args in args_list :
            args = args & each_args
            
        receivingLines = ReceivingLine.objects.filter(*(args,)).order_by('receiving_date', 
                                                                         'orderLine__documentLineItem__projectMaterial__project__name',
                                                                         'orderLine__documentLineItem__projectMaterial__material__category__name',
                                                                         'orderLine__documentLineItem__projectMaterial__material__name',
                                                                         'orderLine__documentLineItem__projectMaterial__material__specification')
            
        
        details = combine_lines(receivingLines)    
        project = Project.objects.get(id = id)
        
        result = {}
        result['project_name'] = project.name
        result['start_date'] = str(start_date)
        result['end_date'] = str(end_date)
        result['sum'] = details['sum']
        result['lines'] = details['lines']
        
        sheetName = project.name
        sheet = book.add_sheet(sheetName)
        
        generate_project_receiving_list(result, book, sheet)
            
    response.write(output_book(book))
    return response

def output_book(book):
    output = StringIO.StringIO()
    book.save(output)
    output.seek(0)
    return output.getvalue()

def export_all(self, year):
    now = datetime.datetime.now()
    current_year = int(now.strftime("%Y"))
    current_month = int(now.strftime("%m"))
    
    max_month = 12
    if year == current_year:
        max_month = current_month
    
    
    start_date = get_first_date_of_month(year, 1)
    end_date = get_last_date_of_month(year, max_month)
    
    args_list = [] 
    
    args_list.append(Q(checkAccount__start_date__gte=start_date)) 
    args_list.append(Q(checkAccount__end_date__lte=end_date))
    args = Q() 
    for each_args in args_list :
        args = args & each_args
        
    receivingLines = ReceivingLine.objects.filter(*(args,)).order_by('checkAccount__start_date',
                                                                     'receiving_date', 
                                                                     'orderLine__documentLineItem__projectMaterial__project__name',
                                                                     'orderLine__documentLineItem__projectMaterial__material__category__name',
                                                                     'orderLine__documentLineItem__projectMaterial__material__name',
                                                                     'orderLine__documentLineItem__projectMaterial__material__specification')
    
    
    if (len(receivingLines) != 0):
        details = combine_lines(receivingLines)
        result = {}
        result['lines'] = details['lines']
        return generate_project_receiving_list_by_year(year, result)
    else:
        self.message_user(str(year) + "年没有已对账的到货单")
        url = "/report/project/receiving/checked/list"
        return HttpResponseRedirect(url)  
    

def generate_project_receiving_list_by_year(year, result):
    file_type = 'xls'
    file_name = 'receiving' + str(year)
    response = HttpResponse(mimetype="%s; charset=UTF-8" % 'application/vnd.ms-excel')
    response['Content-Disposition'] = ('attachment; filename=%s.%s' % (file_name, file_type)).encode('utf-8')
    
    book = xlwt.Workbook(encoding='utf-8')
    sheetName = str(year) + u'材料汇总'
    sheet = book.add_sheet(sheetName)
    
    write_project_receiving_list(year, result, book, sheet)
    
    response.write(output_book(book))
    return response
    
    
    
def write_project_receiving_list(year, result, book, sheet):
    column = 13
    
    report_title = str(year) + u'材料汇总'
    report_title_xf = ezxf('font: bold on, height 400; align: wrap on, vert centre, horiz center') 
    sheet.write_merge(0, 2, 0, column, report_title, report_title_xf)
    
    write_line(sheet, 3, column)
    
    write_receiving_list_impl(sheet, result, 4)
    
    return book

def write_receiving_list_impl(sheet, result, rowx):
    detail_head = [u'序号', u'材料名称', u'品牌', u'规格', u'单位', u'数量', u'单价', u'金额', u'送货日期', u'送货单位', u'项目名称', u'公司', u'月份']
    head_width =  [0x0d00,   5000,   5000, 5000,  0x0d00,  0x0d00,  0x0d00, 0x0d00,  4000,   8000,  8000, 4000, 4000]
    merge_col =   [1,         1,          1,    1,       1,     1,         1,     1,       1,      1,  1,   1,    1]
    kinds =       'int       text      text    text    text     int     price   money     date    text    text text int'.split()
    style =       [ezxf('font: bold on, height 240; align: wrap on, vert centre, horiz right'), 
                   ezxf('font: bold on, height 240; align: wrap on, vert centre, horiz left'),
                   ezxf('font: bold on, height 240; align: wrap on, vert centre, horiz left'),
                   ezxf('font: bold on, height 240; align: wrap on, vert centre, horiz left'),
                   ezxf('font: bold on, height 240; align: wrap on, vert centre, horiz left'),
                   ezxf('font: bold on, height 240; align: wrap on, vert centre, horiz right'),
                   ezxf('font: bold on, height 240; align: wrap on, vert centre, horiz right'),
                   ezxf('font: bold on, height 240; align: wrap on, vert centre, horiz right'),
                   ezxf('font: bold on, height 240; align: wrap on, vert centre, horiz left'),
                   ezxf('font: bold on, height 240; align: wrap on, vert centre, horiz left'),
                   ezxf('font: bold on, height 240; align: wrap on, vert centre, horiz left'),
                   ezxf('font: bold on, height 240; align: wrap on, vert centre, horiz left'),
                   ezxf('font: bold on, height 240; align: wrap on, vert centre, horiz left')]

    heading_xf = {'style' : style,
                   'width' : head_width,
                   'merge_col' : merge_col}
    data_format = 'font: height 240; align: wrap on, vert centre, horiz left'
    number_format = 'font: height 240; align: wrap on, vert centre, horiz right'
    kind_to_xf_map = {
            'date': ezxf(data_format ,num_format_str='yyyy-mm-dd'),
            'int': ezxf(number_format, num_format_str='#,##0'),
            'money': ezxf(number_format ,num_format_str='#,##0.00'),
            'price': ezxf(number_format,num_format_str='#0.00'),
            'text': ezxf(data_format),
            }
    data_xfs = [kind_to_xf_map[k] for k in kinds]
    
    data = []
    index = 1
    for line in result['lines']:
        row = []
        row.append(index)
        row.append(line['projectMaterialName'])
        row.append(line['brand'])
        row.append(line['specification'])
        row.append(line['unit'])
        row.append(line['receiving_quantity'])
        row.append(line['price'])
        row.append(line['totalPrice'])
        row.append(line['receiving_date'])
        row.append(line['vendor'])
        row.append(line['project'])
        row.append(line['company'])
        row.append(line['checked_month'])
        data.append(row)
        index = index + 1
    
    write_details(sheet, rowx, detail_head, data, heading_xf, data_xfs)
        