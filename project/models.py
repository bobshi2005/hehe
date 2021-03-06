# coding=utf-8
from django.db import models
from django.db.models import Q, Sum
from material.models import Material, Category
from xplugin.user.models import UserInfo

class Company(models.Model):
    class Meta:
        verbose_name = u'公司管理'
        verbose_name_plural = verbose_name

    name  = models.CharField(u'公司名称',max_length=50)
    short_name  = models.CharField(u'简称',max_length=50)
    address  = models.CharField(u'地址',max_length=50)
    phone  = models.CharField(u'电话',max_length=50)
    fax  = models.CharField(u'传真',max_length=50)
    zip  = models.CharField(u'邮编',max_length=50)

    def __unicode__(self):
        return self.short_name


class Project(models.Model):
    class Meta:
        verbose_name = u'项目'
        verbose_name_plural = verbose_name

    name = models.CharField(u'项目名称',max_length=50)
    full_name = models.CharField(u'项目全称',max_length=50, blank=True,null=True)
    company = models.ForeignKey(Company,verbose_name=u'所属单位')
    
    construct_unit = models.CharField(u'建设单位',max_length=50, blank=True,null=True)
    property = models.CharField(u'项目性质',max_length=50, blank=True,null=True)
    scale = models.CharField(u'项目规模',max_length=50, blank=True,null=True)
    estimate_user = models.ForeignKey(UserInfo, related_name='estimateGroup', verbose_name=u'预算负责人', limit_choices_to = Q( groups__name = u'预算部门') | Q( groups__name = u'预算部门经理'))
    users = models.ManyToManyField(UserInfo, related_name='projectGroup', verbose_name=u'项目负责人', blank=True, limit_choices_to = Q( groups__name = u'工程部门'))
    
    amount = models.DecimalField(u'合同金额',max_digits = 15, decimal_places=2, blank=True, null=True)
    material_amount = models.DecimalField(u'主材费用',max_digits = 15, decimal_places=2, blank=True, null=True)
    contract_format = models.CharField(u'合同方式',max_length=50, blank=True,null=True)
    payment_type = models.TextField(u'付款方式', blank=True,null=True)
    bid_date = models.DateField(u'中标日期', blank=True,null=True)
    start_date = models.DateField(u'开工日期', blank=True,null=True)
    end_date = models.DateField(u'竣工日期', blank=True,null=True)
    settlement_method = models.CharField(u'结算方式',max_length=50, blank=True,null=True)
    settlement_amount = models.DecimalField(u'结算金额',max_digits = 15, decimal_places=2, blank=True, null=True)
    file = models.FileField(u'竣工报告', upload_to='.', help_text='竣工报告', blank=True)
    settlement_status = models.BooleanField(u'结算状态', default=False)
    settlement_file = models.FileField(u'结算附件', upload_to='.', help_text='结算附件', blank=True)
    
#     one_month_amount = models.DecimalField(u'1月费用',max_digits = 15, decimal_places=2, blank=True, null=True)
#     two_month_amount = models.DecimalField(u'2月费用',max_digits = 15, decimal_places=2, blank=True, null=True)
    

    def __unicode__(self):
        return self.name 
    
from smart_selects.db_fields import ChainedForeignKey
    
class ProjectMaterial(models.Model):
    class Meta:
        ordering = ["project__id", "material__category__name", "material__name"]
        verbose_name = u'项目材料'
        verbose_name_plural = verbose_name

    project = models.ForeignKey(Project,verbose_name=u'所属项目')
    category = models.ForeignKey(Category,verbose_name=u'类别', blank=True, null=True)
    
    material = models.ForeignKey(Material,verbose_name=u'材料')
#     material = ChainedForeignKey(
#         Material, 
#         chained_field="category",
#         chained_model_field="category", 
#         show_all=False, 
#         auto_choose=True,
#         verbose_name=u'材料'
#     )
    quantity = models.IntegerField(u'预算量', default=0)
#     received_quantity = models.IntegerField(u'到货数量', default=0)
    price = models.DecimalField(u'单价',max_digits = 15, decimal_places=2, blank=True, null=True)
    total = models.DecimalField(u'金额',max_digits = 15, decimal_places=2, blank=True, null=True)
   
    def save(self, *args, **kwargs):
        self.total = self.quantity * (self.price or 0)
        super(ProjectMaterial, self).save()
    
    def getMaterialName(self):
        return self.material.getName()
    getMaterialName.short_description = "材料"
    
        
    
    def __unicode__(self):
        full_name = self.project.name + "   " +self.getMaterialName()
        return full_name   
      
  
class SelectedLineItem(models.Model):  
    class Meta:
        ordering = ['projectMaterial']
        verbose_name = u'材料选择'
        verbose_name_plural = verbose_name 
    
    projectMaterial = models.ForeignKey(ProjectMaterial,verbose_name=u'项目材料')
    user = models.ForeignKey(UserInfo,verbose_name=u'申请人')
    
    def getProject(self):
        return  self.projectMaterial.project.name
    getProject.short_description = "项目"
    
    def getMaterial(self):
        return self.projectMaterial.getMaterialName()
    getMaterial.short_description = "材料"
    
    def __unicode__(self):
        return self.getProject() + "   " +self.getMaterial()   
    
        
    