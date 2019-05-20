# coding=utf-8
from django.db.models import Q, Sum
from django.db.models.query import QuerySet
from django.utils.html import escape,format_html
from django.contrib.auth.models import User, Group, Permission
from document.models import Document, DocumentLineItem
from workflow.models import Item, TaskHistory, ITEM_REJECTED, ITEM_APPROVED,APPROVED, ITEM_STATUS
from workflow.workflow import getPayment
from order.models import Order, OrderLine, ReceivingLine, CheckAccount, Invoice
from material.models import Vendor, Material, Category, Unit
from project.models import Company, Project, ProjectMaterial
from payment.models import Payment
from setting.models import VendorSetting
from report.vendor_account import * 
import datetime 
from django.http import HttpResponse
import xlwt
import StringIO
from workflow.workflow import Workflow,getMyApplayItems,getMyHandleItems,getMyHandledItems, handlePayment
from hehe.constant import MAX_PROJECT_MATERIAL_QANTITY
from django.http import  HttpResponseRedirect

ESTIMATE_GROUP_MANAGER = U'预算部门经理'
# PROJECT_GROUP_MANAGER = u'工程部门经理'
PURCHASE_GROUP_MANAGER = u'采购部门经理'
ACCOUNT_GROUP_MANAGER = u'财务部门经理'
VICE_GENERAL_MANAGER = u'副总经理'
GENERAL_MANAGER = u'总经理'

ACCOUNT_GROUP = u'财务部门'
PROJECT_GROUP = u'工程部门'
PURCHASE_GROUP = u'采购部门' 
ESTIMATE_GROUP = u'预算部门'



def isGroup(self, GROUP_NAME):
    result = False
    if len(self.user.groups.all()) > 0:
        result = GROUP_NAME == self.user.groups.all()[0].name
    return result 


def isMyProject(self, document_id):
    try:     
        document = Document.objects.get(id=document_id)
    except Document.DoesNotExist:
        return False
    if document is not None:
        return document.user == self.user

def getItem(document_id):
    result = None
    query_set = Item.objects.filter(document__id=document_id)
    if query_set.exists(): 
        result = query_set[0]
    return result

def getItemByDocumentId(document_id):
    result = None
    query_set = Item.objects.filter(document__document_id=document_id)
    if query_set.exists(): 
        result = query_set[0]
    return result

def hasTaskHistory(document_id):
    result = False
    query_set = TaskHistory.objects.filter(item__document__document_id=document_id)
    if query_set.exists(): 
        result = True
    return result

# def isShowAuditQty(document_id):
#     result = True
#     item = getItemByDocumentId(document_id)
#     # 当审核状态不等于审批不通过时要显示 audit quantity
#     if (ITEM_REJECTED != item.status):
#         result = False
#     return result

def canEditAuditQty(self):
    return isGroup(self, ESTIMATE_GROUP_MANAGER) or isGroup(self, VICE_GENERAL_MANAGER) or isGroup(self, GENERAL_MANAGER)

def canSubmitToApproveForDocument(self, document_id):
    result = False
    document_set = Document.objects.filter(document_id=document_id)
    if document_set.exists():
        document = document_set[0]
        if document.create_date is None and document.user == self.user:
            result = True
        else:
            #被打回可以重新申请
            query_set = Item.objects.filter(document=document)
            if query_set.exists(): 
                if (ITEM_REJECTED == query_set[0].status):
                    result = True
            
    return result


def canDeleteOrAddDocumentLine(self):
    result = False
    if "_rel_document__id__exact" in self.request.GET:
        document_id = self.request.GET['_rel_document__id__exact']
        if isMyProject(self, document_id):
            item = getItem(document_id)
            if item is not None:
                if (item.status == ITEM_REJECTED):
                    result = True
            else:
                result = True 
    return result 

def close_payment(payment_id):
    payment = Payment.objects.filter(payment_id=payment_id)[0]
    if not payment.payment_date :
        payment.payment_date = datetime.datetime.now()
    payment.is_closed = True
    payment.save(update_fields=['payment_date', 'is_closed'])
    
    
def close_order(order_id):
    order = Order.objects.filter(order_id=order_id)[0]
    order.is_closed = True
    order.save(update_fields=['is_closed'])
    
def is_Receivied(order_id):
    lines = OrderLine.objects.filter(order__order_id = order_id)
    result = True
    for line in lines:
        receivingLines = ReceivingLine.objects.filter(orderLine = line)
        sum_receiving_quantity = 0
        for receiving in receivingLines:
            sum_receiving_quantity += receiving.receiving_quantity
            if receiving.receiving_date is None:
                result = False
                break;
        if sum_receiving_quantity != line.purchase_quantity:
            result = False
            break;
    return result
            

            

def is_closed(order_id):
    closed = False
    try:
        order = Order.objects.filter(order_id=order_id)[0]
        closed = order.is_closed
    except IndexError:
        pass
    
    return closed

def isPurchCompleted(document):
    result = False
    if document.purch_status == '采购完成':
        result = True
    return result


def isClosedByDocument(document_id):
    closed = True
    orders = Order.objects.filter(document__document_id=document_id)
    if len(orders) <= 0:
        closed = False
    else:
        for order in orders:
            if not order.is_closed:
                closed = False
    return closed

def is_closed_by_order_id(self):
        result = False
        if "_rel_order__id__exact" in self.request.GET:
            order_id = self.request.GET['_rel_order__id__exact']
            order = Order.objects.get(id = order_id)
            if order is not None and order.is_closed:
                result = True
        return result
    
def is_closed_by_order_line_id(self):
        result = False
        if "_rel_orderLine__id__exact" in self.request.GET:
            order_line_id = self.request.GET['_rel_orderLine__id__exact']
            orderline = OrderLine.objects.get(id = order_line_id)
            if orderline is not None:
                order = orderline.order
                if order is not None and order.is_closed:
                    result = True
        return result    
    
def checkAccount(ids, request):
    if 'start_date' in request.POST:
        start_date = request.POST['start_date']
    if 'end_date' in request.POST:
        end_date = request.POST['end_date']
    if 'vendor' in request.POST:
        vendor_name = request.POST['vendor']        
    if 'company' in request.POST:
        company_name = request.POST['company']
    
    checkAccount = CheckAccount()
    if bool(start_date):
        checkAccount.start_date = start_date
        
    if bool(end_date):
        checkAccount.end_date = end_date
        
    if bool(vendor_name):
        vendor = Vendor.objects.filter(name=vendor_name)[0]
        checkAccount.vendor = vendor
    
    if bool(company_name) and 'None' != company_name and 'all' != company_name:
        company = Company.objects.filter(name=company_name)[0]
        checkAccount.company = company
            
        
            
    now = datetime.datetime.now()
    now = now.strftime("%Y%m%d%H%M%S")
    check_account_id = "CA" + now
    checkAccount.check_account_id = check_account_id
    
    checkAccount.save()
    
    receivingLines = ReceivingLine.objects.filter(id__in=ids).order_by('receiving_date', 
                                                                       'orderLine__documentLineItem__projectMaterial__project__name',
                                                                       'orderLine__documentLineItem__projectMaterial__material__category__name',
                                                                       'orderLine__documentLineItem__projectMaterial__material__name',
                                                                       'orderLine__documentLineItem__projectMaterial__material__specification')
    order_ids = set()
    for receivingLine in receivingLines:
        receivingLine.checkAccount = checkAccount
        receivingLine.save(update_fields=['checkAccount'])
        
        order_ids.add(receivingLine.orderLine.order.id)
        
    
    update_orders(order_ids)
    
    return exportCheckAccountExcel(checkAccount, receivingLines)

#如果所有的材料都已经到货并且已对帐，更新采购单为已闭合
def update_orders(order_ids):
    for id in order_ids:
        result = True
        lines = OrderLine.objects.filter(order__id = id)
        for line in lines:
            total_quantity = ReceivingLine.objects.filter(orderLine = line, checkAccount__isnull = False).aggregate(Sum('receiving_quantity'))
            total_receiving_quantity = (total_quantity['receiving_quantity__sum'] or 0)
            if total_receiving_quantity != line.purchase_quantity:
                result = False
                break;
        
        if result:
            order = Order.objects.get(id = id)
            order.is_closed = True
            order.save(update_fields=['is_closed'])
                

def paymentAuditStatus(payment, ITEM_STATUS):
    result = False
    if hasattr(payment, 'payment_id'):
        item = getItemByDocumentId(payment.payment_id)
        if item and item.status == ITEM_STATUS:
            result = True
    return result

def getPaymentAuditStatus(payment_id):
    result = ''
    item = getItemByDocumentId(payment_id)
    if item:
        result = item.status
    return result;
            
    

def getYears():
    now = datetime.datetime.now()
    year = int(now.strftime("%Y")) + 1
        
    years = []
    for i in range(2014, year):
        years.append(i)
        
    current_year = int(now.strftime("%Y"))  
    result = {'years':years, 'year':current_year} 
    return result

def getMonths():
    now = datetime.datetime.now()
    current_month = int(now.strftime("%m"))
        
    months = []
    for i in range(1, 13):
        months.append(i)
        
    result = {'months':months, 'month':current_month} 
    return result
    
def getProjects(self):
    if isGroup(self, PROJECT_GROUP):
        projects = Project.objects.filter(users__in = [self.user]).order_by('-id')
    else:
        projects = Project.objects.all().order_by('-id')
    return projects   

def getMateriales(self):
    materiales = Material.objects.all()
    return materiales 

def getCompany(companies, company_name):
    result = None
    for company in companies:
        if company_name == company.name:
            result = company
            break
    return result
            
def getPurchasedQuantity(self, documentLineItem):
        total_quantity = OrderLine.objects.filter(documentLineItem__id = documentLineItem.id).aggregate(Sum('purchase_quantity'))
        return total_quantity['purchase_quantity__sum'] if total_quantity['purchase_quantity__sum'] is not None else ''        

def getAvailableQuantity(self, documentLineItem):
    #要求数量
    available_quantity = documentLineItem.expected_quantity
            
    #审批数量
    if documentLineItem.audit_quantity >= 0:
        available_quantity = documentLineItem.audit_quantity
                
    #已采购量    
    purchasedQuantity = getPurchasedQuantity(self, documentLineItem)
    if purchasedQuantity != '':
        available_quantity = available_quantity - purchasedQuantity
        
    return available_quantity  

            
def getTotalReceivedQuantity(self, orderLine):
        total_quantity = ReceivingLine.objects.filter(orderLine = orderLine).aggregate(Sum('receiving_quantity'))
        return (total_quantity['receiving_quantity__sum'] or 0)
    
def get_received_quantity(self, projectMaterial):
        total_quantity = DocumentLineItem.objects.filter(projectMaterial = projectMaterial).aggregate(Sum('posted_quantity'))
        return (total_quantity['posted_quantity__sum'] or 0)
    
def serialize_results(results):
    return [
        {'value': item.pk, 'text': unicode(item)} for item in results
    ]
    
def handle_audit(self, item, audit, comments):
    workflow = Workflow()
    if str(APPROVED) == audit:
            handlePayment(item)
            workflow.approveWorkflow(item, self.user, comments)
    else:
            workflow.rejectWorkflow(item, self.user, comments)
    return HttpResponseRedirect("/workflow/my/handle/tasks/")

def doAudit(self, request):
        audit = request.POST['audit']
        comments = request.POST['comments']
        document_id = request.POST['document_id']
        item = getItem(document_id)
        return handle_audit(self, item, audit, comments)

#采购退回    
def doReturn(self, request):
        comments = request.POST['comments']
        document_id = request.POST['document_id']
        item = getItem(document_id)
        
        workflow = Workflow()
        workflow.returnWorkflow(item, self.user, comments)
        
        return HttpResponseRedirect("/document/request/order/")

    
def assign_material_to_project(self, project_id, material):
    project = Project.objects.get(id = project_id)
    if isGroup(self, PROJECT_GROUP):
        ProjectMaterial.objects.get_or_create(project = project,
                                              material = material,
                                              category = material.category,
                                              quantity = MAX_PROJECT_MATERIAL_QANTITY)
    else:
        ProjectMaterial.objects.get_or_create(project = project,
                                              material = material,
                                              category = material.category)
def has_audit_comment_by_document_id(document_id):
    count = TaskHistory.objects.filter(item__document__document_id=document_id, comments__isnull=False).exclude(comments__exact='').count()
    return count > 0  

def get_audit_comments_by_document_id(document_id):
    histories = TaskHistory.objects.filter(item__document__document_id=document_id, comments__isnull=False).exclude(comments__exact='')
    
    comments = ''
    for history in histories:
        comments += str(history.user) + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + history.comments + '<br>'
        
    return format_html(comments)

def has_audit_comment_by_item_id(item_id):
    count = TaskHistory.objects.filter(item__id=item_id, comments__isnull=False).exclude(comments__exact='').count()
    return count > 0  

def get_audit_comments_by_item_id(item_id):
    histories = TaskHistory.objects.filter(item__id=item_id, comments__isnull=False).exclude(comments__exact='')
    
    comments = ''
    for history in histories:
        comments += str(history.user) + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + history.comments + '<br>'
        
    return format_html(comments)

def getAuditComments(item):
        if has_audit_comment_by_item_id(item.id):
            data = get_audit_comments_by_item_id(item.id)
            title = '意见'
            return ('<a data-content="%s" class="details-handler" rel="tooltip" title="%s"><i class="fa fa-info-circle"></i></a>'
                                         % (data, title))
        else:
            return ''
    
def buildPaymentItems(items):
    lines = []
    index = 0
    payment_amount_total = 0
    applied_amount_total = 0
    result = {}
    for item in items:
        line = {}
        index = index + 1
        line['index'] = index
        line['id'] = item.id
        line['document_id'] = item.document.id
        line['document_number'] = item.document.document_id
        line['status'] = ITEM_STATUS[item.status][1]
        line['status_code'] = item.status
        line['audit_comments'] = format_html(getAuditComments(item))
        payment = getPayment(item.document.document_id)
        if payment is not None:
            line['vendor'] = payment.vendor.name
            line['payment_id'] = payment.id
            line['payment_amount'] = payment.payment_amount
            line['applied_amount'] = payment.applied_amount or ''
            line['payment_type'] = payment.paymentType.name
            payment_amount_total += payment.payment_amount
            applied_amount_total += payment.applied_amount or 0
            
        lines.append(line)
        
    result['payment_amount_total'] = payment_amount_total
    result['applied_amount_total'] = applied_amount_total
    result['payment_items'] = lines
    return result
                  
def buildProjectItems(items):
    lines = []
    index = 0
    for item in items:
        line = {}
        index = index + 1
        line['index'] = index
        line['id'] = item.id
        line['document_id'] = item.document.id
        line['document_number'] = item.document.document_id
        line['user'] = item.user
        line['status'] = ITEM_STATUS[item.status][1]
        line['status_code'] = item.status
        line['project_name'] = item.document.project
        line['audit_comments'] = format_html(getAuditComments(item))
        lines.append(line)
    return lines

def document_apply_submit_check(self, document_id):
        result = True
        document = Document.objects.filter(document_id = document_id)[0]
        documentLines = DocumentLineItem.objects.filter(document=document)
        for documentLine in documentLines:
            if documentLine.expected_quantity is None or documentLine.expected_quantity == 0:
                result = False
                break 
                
        
        return result
    
import json    
def GetMaterial(request):
    if request.method == 'GET' and request.is_ajax():
        pid = request.GET.get('pid','')
        
        if len(pid) > 0:
            queryset = Material.objects.filter(category__id=pid)
        else:
            queryset = Material.objects.all()
        
        
        serialized_results = serialize_results(queryset)
        results_json = json.dumps(serialized_results)
        return HttpResponse(results_json, content_type='application/json')
    
                
def uploadProjectMaterial(project, row):
    print row['seq']
    print row['category']
    print row['name']
    print row['specification']
    print row['unit']
    
    
    print row['quantity']
    print row['price']
    print row['total']
    
    try:
        
        m = Material.objects.filter(name = row['name'], category__name = row['category'], specification = row['specification'], unit__name = row['unit'])[0]
    except IndexError:
        m = None  
    
    projectMaterial = ProjectMaterial()
    projectMaterial.project = project
    
    if row['quantity']:
        projectMaterial.quantity = row['quantity']
        
    if row['price']:
        projectMaterial.price = row['price']
        
    if row['total']:
        projectMaterial.total = row['total']
        
    if m is not None:
        projectMaterial.material = m
    else:
        m = Material()
        if row['name']:
            m.name = row['name']
            
        if row['specification']:
            m.specification = row['specification']
            
        if row['category']:
            try:
                category = Category.objects.filter(name = row['category'])[0]
            except IndexError:
                category = Category() 
                category.name = row['category']
                category.save()
                
            m.category = category   
                     
        if row['unit']:
            try:
                unit = Unit.objects.filter(name = row['unit'])[0]
            except IndexError:
                unit = Unit() 
                unit.name = row['unit']
                unit.save()
            
            m.unit = unit
        
        m.save()
        
        projectMaterial.material = m
        
        
    projectMaterial.save()            
