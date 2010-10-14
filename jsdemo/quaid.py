from django.shortcuts import render_to_response, get_object_or_404
from django.http import HttpResponse
from django.utils import simplejson as json
from django import forms
from decorator import decorator

class ClientException(Exception):
    """
    """
    def __init__(self, msg, code=None, field=None):
        self.msg = msg
        self.code = code
        self.field = field

    def __str__(self):
        return '%s: %s (%s)' % (self.__repr__(), self.msg, self.code)

class FormException(Exception):
    def __init__(self, errors):
        self.errors = errors

    def __str__(self):
        return '%s: %s' % (self.__repr__(), self.errors)

def validate(form):
    if form.is_valid():
        return form.cleaned_data
    raise FormException(form.errors)

def client_async(func, *args, **kwargs):
    """
    A decorator to interface with async client requests,
    including returning controller exceptions.
    """
    STATUS_FAIL = 'fail'
    STATUS_SUCCESS = 'success'
    status = 200
    # run the function
    try:
        res = func(*args)
        if res == True:
            res = {u'status': STATUS_SUCCESS}
        elif res == False:
            res = {u'status': STATUS_FAIL}
        else:
            res = {
                u'status': STATUS_SUCCESS,
                u'results': res
            }
    
    except ClientException, (e):
        status = 400
        
        res = {'status': STATUS_FAIL}
        
        res['errors'] = [{'value': None, 'message': e.msg, 'code': e.code}]
        if e.field:
            res['errors'][0]['field'] = e.field
    
    except FormException, (e):
        status = 400
        res = {'status': STATUS_FAIL}
        
        res['errors'] = []
        for k, v in e.errors.items():
            res['errors'].extend([{'value': None, 'message': unicode(msg), 'field': k} for msg in v])
    
    #import pdb; pdb.set_trace()
    
    return HttpResponse(json.dumps(res), status=status)
client_async = decorator(client_async)

def index(req):
    return render_to_response('quaid.html', {'form':None})
def core(req):
    return render_to_response('quaid_core.html', {'form':None})
def log(req):
    return render_to_response('quaid_log.html', {'form':None})
def widget(req):
    return render_to_response('quaid_widget.html', {'form':None})
def form(req):
    return render_to_response('quaid_form.html', {'form':None})
def util(req):
    return render_to_response('quaid_util.html', {'form':None})
def validation(req):
    return render_to_response('quaid_validation.html', {'form':None})

@client_async
def example1(req):
    
    import time
    time.sleep(1)
    
    class ExampleForm(forms.Form):
        name = forms.CharField()
        miles = forms.FloatField()
        programmers = forms.IntegerField()
    form = validate(ExampleForm(req.POST))

    name = form['name']
    miles = form['miles']
    programmers = form['programmers']
    
    if name.lower() in ['bob', 'jim', 'jack']:
        raise ClientException('Oops, the name "%s" is already taken' % name, field='name')
    
    return {
        'name': name,
        'mileage': miles,
        'mileage_message': miles == 100.0 and 'Nice job!' or 'Oops try again',
        'programmers': programmers,
        'programmers_message': programmers == 0 and 'Yeah, that\'s a hardware problem' or 'Sadly, no.',
    }
