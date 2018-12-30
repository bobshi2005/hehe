# coding=utf-8

from reportlab.lib.pagesizes import A4
from reportlab.lib.units import cm
from reportlab.lib.enums import TA_CENTER, TA_RIGHT

from geraldo import Report, ReportBand, Label, ObjectValue, SystemField,\
    FIELD_ACTION_COUNT, BAND_WIDTH

from geraldo.generators import PDFGenerator


class PurchaseOrderReport(Report):
    title = 'Permissions list'

#     class band_summary(ReportBand):
#         height = 0.7*cm
#         elements = [
#             Label(text="That's all", top=0.1*cm, left=0),
#             ObjectValue(attribute_name='name', top=0.1*cm, left=3*cm,
#                 action=FIELD_ACTION_COUNT,
#                 display_format='%s permissions found'),
#         ]
#         borders = {'all': True}

    class band_page_header(ReportBand):
        height = 1.3*cm
        elements = [
#             SystemField(expression='%(report_title)s', top=0.1*cm,
#                 left=0, width=BAND_WIDTH, style={'fontName': 'Helvetica-Bold',
#                 'fontSize': 14, 'alignment': TA_CENTER}),
            Label(text=u'南京市消防工程有限公司苏州安装分公司', top=0.1*cm,
                left=0, width=BAND_WIDTH, style={
                'fontSize': 14, 'alignment': TA_CENTER}),
                    
            SystemField(text="地址：苏州市南环西路65号二号楼二楼", top=0.3*cm,
                left=0, width=BAND_WIDTH, style={'fontName': 'Helvetica',
                'fontSize': 14, 'alignment': TA_CENTER}),
             
            SystemField(text="邮编：215007", top=0.3*cm,
                left=50, width=BAND_WIDTH, style={'fontName': 'Helvetica',
                'fontSize': 14, 'alignment': TA_CENTER}),
                     
            SystemField(text="电话：0512-65290001", top=0.5*cm,
                left=0, width=BAND_WIDTH, style={'fontName': 'Helvetica',
                'fontSize': 14, 'alignment': TA_CENTER}),
             
            SystemField(text="传真：0512-65290422", top=0.5*cm,
                left=50, width=BAND_WIDTH, style={'fontName': 'Helvetica',
                'fontSize': 14, 'alignment': TA_CENTER}),
                    
            Label(text="ID", top=0.8*cm, left=0),
            Label(text="Name", top=0.8*cm, left=3*cm),
        ]
        borders = {'bottom': True}

    class band_page_footer(ReportBand):
        height = 0.5*cm
        elements = [
            Label(text='Created with Geraldo Reports', top=0.1*cm, left=0),
            SystemField(expression='Page # %(page_number)d of %(page_count)d', top=0.1*cm,
                width=BAND_WIDTH, style={'alignment': TA_RIGHT}),
        ]
        borders = {'top': True}

#     class band_detail(ReportBand):
#         height = 0.5*cm
#         elements = [
#             ObjectValue(attribute_name='id', top=0, left=0),
#             ObjectValue(attribute_name='name', top=0, left=3*cm, width=7*cm),
#         ]


names = ['Mychelle', 'Leticia', 'Tarsila', 'Marta', 'Vera', 'Leni']
report = PurchaseOrderReport(queryset=names)
report.generate_by(PDFGenerator, filename='purchase_order.pdf')