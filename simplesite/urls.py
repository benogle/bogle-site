from django.conf.urls.defaults import *


urlpatterns = patterns('',
    (r'^$', 'simplesite.views.index'),
    (r'^contact$', 'simplesite.views.contact'),
    (r'^(?P<page_slug>[a-zA-Z0-9_/-]+)$', 'simplesite.views.page'),
)