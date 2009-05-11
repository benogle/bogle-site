from django.conf.urls.defaults import *


urlpatterns = patterns('',
    (r'^demo/listadd$', 'jsdemo.views.listadd_index'),
    (r'^demo/listadd/add$', 'jsdemo.views.listadd_add'),
)