use hehe;

SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS=0;



delete from hehe.WORKFLOW_TASKHISTORY;
delete from hehe.WORKFLOW_TASKLIST;
delete from hehe.WORKFLOW_ITEM;
delete from hehe.ORDER_RECEIVINGLINE;
delete from hehe.ORDER_ORDERLINE;
delete from hehe.ORDER_ORDER;
delete from hehe.ORDER_INVOICE;
delete from hehe.PAYMENT_PAYMENT;
delete from hehe.ORDER_CHECKACCOUNT;
delete from hehe.DOCUMENT_DOCUMENTLINEITEM;
delete from hehe.DOCUMENT_DOCUMENT;

update hehe.DOCUMENT_DOCUMENTLINEITEM set posted_quantity = 0;
update hehe.PROJECT_PROJECTMATERIAL set received_quantity = 0;
update hehe.ORDER_RECEIVINGLINE set checkAccount_id = 0;