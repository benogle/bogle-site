from django.shortcuts import render_to_response, get_object_or_404
from django.http import HttpResponse
from django.utils import simplejson as json
from django import forms
#from decorator import decorator

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

def client_async(func):
    """
    A decorator to interface with async client requests,
    including returning controller exceptions.
    """
    def new(*args, **kwargs):
        
        STATUS_FAIL = 'fail'
        STATUS_SUCCESS = 'success'
        status = 200
        # run the function
        try:
            res = func(*args, **kwargs)
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
        
        return HttpResponse(json.dumps(res), status=status, mimetype='application/json')
    
    return new

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
        'mileage_message': miles == 2906.0 and 'Nice job!' or 'Oops try again',
        'programmers': programmers,
        'programmers_message': programmers == 0 and 'Yeah, that\'s a hardware problem' or 'Sadly, no.',
    }
example1 = client_async(example1)

def asyncload1(req):
    
    import time
    time.sleep(0.5)
    
    num = req.POST.get('num')
    t = req.POST.get('type')
    
    types = {
        'a': '%s Lorem Ipsum!' % num,
        'b': '%s THIS IS B! zOMG!' % num
    }
    return types.get(t) or 'WTF y0?'
asyncload1 = client_async(asyncload1)

def asyncload2(req):
    
    num = int(req.POST.get('num'))
    
    import time
    time.sleep(num % 2)
    
    return str(num)
asyncload2 = client_async(asyncload2)

def asyncform(req):
    
    name = req.POST.get('name')
    fail = req.POST.get('fail') != None
    
    import time
    time.sleep(0.5)
    
    if fail:
        raise ClientException('This is just an error of some kind.')
    
    return name
asyncform = client_async(asyncform)

def error_example(req):
    type = req.POST.get('errtype')
    """<select name="errtype">
    <option value="none">None (success!)</option>
    <option value="fail">200 OK fail</option>
    <option value="bad_req">400 Bad Request (general error)</option>
    <option value="bad_req_field">400 Bad Request (field error)</option>
    <option value="server">500 Server Error</option>
    <option value="not_found">404 Not Found</option>"""
    
    if type == 'fail':
        res = {'status': 'fail', 'errors': [{'message': 'This is a 200 ok general error'}]}
        status = 200
    elif type == 'bad_req':
        res = {'errors': [{
            'message': 'This is a 400 Bad Request general error',
            'code': 256,
            'value': 'http://redirect.url'
        }]}
        status = 400
    elif type == 'bad_req_field':
        res = {'errors': [{
            'message': 'This is a 400 Bad Request field error',
            'field': 'email'
        }]}
        status = 400
    elif type == 'server':
        res = {'errors': [{
            'message': 'AttributeError'
        }]}
        status = 500
    elif type == 'not_found':
        res = {'errors': [{
            'message': 'Resource "id" was not found',
            'value': '/some/resource/id'
        }]}
        status = 404
    else:
        res = {
            'status': 'success',
            'results':{
                'data1': 23,
                'data2': 'wowza'
            }
        }
        status = 200
    
    return HttpResponse(json.dumps(res), status=status)

def validation_example(req):
    
    class ExampleForm(forms.Form):
        email = forms.EmailField(max_length=25)
    form = validate(ExampleForm(req.POST))

    email = form['email']
    
    if email.lower() in ['bob@zomg.com', 'jim@zomg.com']:
        raise ClientException('Oops, the email "%s" is already taken' % email, field='email')
    
    return {
        'email': email,
    }
validation_example = client_async(validation_example)