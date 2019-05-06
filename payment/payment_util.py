# coding=utf-8
import datetime 
from payment.models import Payment
from workflow.models import Route
from hehe.constant import PAYMENT_APPLY
from document.models import Document, PAYMENT_TYPE
from workflow.models import Item, TaskHistory, ITEM_REJECTED, ITEM_APPROVED,APPROVED, ITEM_STATUS
from workflow.workflow import Workflow,getMyApplayItems,getMyHandleItems,getMyHandledItems, handlePayment


def submitPayment(self, payment_id):
    now = datetime.datetime.now()
    payment = Payment.objects.filter(payment_id = payment_id)[0]
    if not payment.is_applied:
        payment.create_time = now
        payment.is_applied = True
        payment.save(update_fields=['create_time', 'is_applied'])
    
    route = Route.objects.filter(route_name = PAYMENT_APPLY)[0]
    
    document = Document.objects.get_or_create(document_id = payment_id, defaults = {'document_type':PAYMENT_TYPE,
                                                                                    'user':self.user,
                                                                                    'create_date':now})
    
    item = Item.objects.get_or_create(document = document[0],
                                       item_name = PAYMENT_APPLY,
                                       route = route,
                                       user = self.user)
    #重新发起申请
    if item[0].status == ITEM_REJECTED:
        workflow = Workflow()
        workflow.reApplyWorkflow(item[0], self.user, '')
    else:#新申请
        workflow = Workflow()      
        workflow.applyWorkflow(route, item[0], self.user)       
