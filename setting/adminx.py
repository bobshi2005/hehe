# coding=utf-8
import xadmin
from xadmin.plugins.batch import BatchChangeAction
from xadmin.plugins.actions import DeleteSelectedAction
from models import ProjectSetting, VendorSetting
from order.models import OrderNote

class ProjectSettingAdmin(object):
    show_bookmarks = False
    list_display = ('project', 'before_2015_amount')
    list_display_links = ('project',)
    list_editable = ['before_2015_amount']
    search_fields = ['project__name']
    actions = [DeleteSelectedAction, ]




class VendorSettingAdmin(object):
    show_bookmarks = False
    list_display = ('vendor', 'company', 'before_2014_owed_amount', 'before_2014_owed_invoice', 'before_2015_2_owed_amount', 'before_2015_2_owed_invoice', 'before_2015_2_received_amount')
    list_display_links = ('vendor',)
    list_editable = ['before_2014_owed_amount', 'before_2014_owed_invoice', 'before_2015_2_owed_amount', 'before_2015_2_owed_invoice', 'before_2015_2_received_amount']
    search_fields = ['vendor__name']
    actions = [DeleteSelectedAction, ]
    
class OrderNoteAdmin(object):
    show_bookmarks = False
    list_display = ('name', )
    actions = [DeleteSelectedAction,]  


xadmin.site.register(ProjectSetting, ProjectSettingAdmin)    
xadmin.site.register(VendorSetting, VendorSettingAdmin) 
xadmin.site.register(OrderNote, OrderNoteAdmin) 
        
        


