from simplesite.models import Sidebar, Image, Page
from django.contrib import admin

class ImageAdmin(admin.ModelAdmin):
    list_display = ('name', 'filename')

class SidebarAdmin(admin.ModelAdmin):
    list_display = ['name']
    
class PageAdmin(admin.ModelAdmin):
    list_display = ('title', 'meta_description')

admin.site.register(Sidebar, SidebarAdmin)
admin.site.register(Image, ImageAdmin)
admin.site.register(Page, PageAdmin)
