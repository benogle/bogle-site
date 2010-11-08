import os
from django.conf import settings
from django.conf.urls.defaults import *

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
from django.contrib.auth import views as auth_views

admin.autodiscover()

urlpatterns = patterns('',

    # Uncomment the admin/doc line below and add 'django.contrib.admindocs' 
    # to INSTALLED_APPS to enable admin documentation:
    #(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    (r'^admin/(.*)', admin.site.root),
    (r'^passreset/$',auth_views.password_reset),
    (r'^passresetdone/$',auth_views.password_reset_done),
    (r'^passresetconfirm/(?P<uidb36>[-\w]+)/(?P<token>[-\w]+)/$',auth_views.password_reset_confirm),
    (r'^passresetcomplete/$',auth_views.password_reset_complete),
    (r'^password/change/$', auth_views.password_change),
    (r'^password/change/done/$', auth_views.password_change_done),
    
    (r'', include('jsdemo.urls')),
    (r'', include('simplesite.urls')),
)

if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^smedia/(.*)$', 'django.views.static.serve', { 'document_root': settings.MEDIA_ROOT }),
    )
