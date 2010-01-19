from django.conf.urls.defaults import *


urlpatterns = patterns('',
    (r'^demo/listadd$', 'jsdemo.views.listadd_index'),
    (r'^demo/listadd/add$', 'jsdemo.views.listadd_add'),
    
    (r'^demo/listedit$', 'jsdemo.views.listedit_index'),
    (r'^demo/listedit/edit$', 'jsdemo.views.listedit_edit'),
    (r'^demo/listedit/data$', 'jsdemo.views.listedit_data'),
)