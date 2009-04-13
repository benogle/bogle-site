from django.conf.urls.defaults import *


urlpatterns = patterns('',
    (r'^$', 'simplesite.views.index'),
    (r'^(?P<page_slug>[a-zA-Z0-9_/-]+)$', 'simplesite.views.page'),
)