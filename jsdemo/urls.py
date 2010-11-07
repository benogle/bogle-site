from django.conf.urls.defaults import *
from django.conf import settings
import os

urlpatterns = patterns('',
    #fogure out a better way to do this. This is dumb.
    (r'^quaid$', 'jsdemo.quaid.index'),
    (r'^quaid/core$', 'jsdemo.quaid.core'),
    (r'^quaid/log$', 'jsdemo.quaid.log'),
    (r'^quaid/form$', 'jsdemo.quaid.form'),
    (r'^quaid/util$', 'jsdemo.quaid.util'),
    (r'^quaid/widget$', 'jsdemo.quaid.widget'),
    (r'^quaid/validation$', 'jsdemo.quaid.validation'),
    
    (r'^quaid/example1$', 'jsdemo.quaid.example1'),
    (r'^quaid/asyncload1$', 'jsdemo.quaid.asyncload1'),
    (r'^quaid/asyncload2$', 'jsdemo.quaid.asyncload2'),
    (r'^quaid/asyncform$', 'jsdemo.quaid.asyncform'),
    (r'^quaid/error_example$', 'jsdemo.quaid.error_example'),
    (r'^quaid/validation_example$', 'jsdemo.quaid.validation_example'),
    
    (r'^demo/listadd$', 'jsdemo.views.listadd_index'),
    (r'^demo/listadd/add$', 'jsdemo.views.listadd_add'),
    
    (r'^demo/listedit$', 'jsdemo.views.listedit_index'),
    (r'^demo/listedit/edit$', 'jsdemo.views.listedit_edit'),
    (r'^demo/listedit/data$', 'jsdemo.views.listedit_data'),
)

if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^doc/(.*)$', 'django.views.static.serve', { 'document_root': os.path.join(settings.PROJECT_PATH, 'doc') }),
    )