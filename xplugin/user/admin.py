from django.contrib import admin
from xadmin.sites import site
# from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from xplugin.user.models import UserInfo
from xadmin.plugins.auth import UserAdmin

# Define an inline admin descriptor for Employee model
# which acts a bit like a singleton
class UserInfoInline(admin.StackedInline):
    model = UserInfo
    can_delete = False
    verbose_name_plural = 'UserInfo'

# Define a new User admin
class UserAdmin(UserAdmin):
    inlines = (UserInfoInline,)

# Re-register UserAdmin
# admin.site.unregister(User)
# admin.site.register(User, UserAdmin) 
site.unregister(User)
site.register(User, UserAdmin)