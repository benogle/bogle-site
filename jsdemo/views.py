from django.shortcuts import render_to_response, get_object_or_404
from django.http import HttpResponse
from django.utils import simplejson as json
from django import forms

class ListAddForm(forms.Form):
    id = forms.IntegerField(widget=forms.widgets.HiddenInput())
    subject = forms.CharField(max_length=100)
    message = forms.CharField(widget=forms.widgets.Textarea())
    
def listadd_index(req):
    return render_to_response('demo_listadd.html', {'form':ListAddForm()})
    
def listadd_add(req):
    form = ListAddForm(req.POST)
    
    if form.is_valid():
        subject = form.cleaned_data['subject']
        message = form.cleaned_data['message']
        
        status = { 
            'success': True, 
            'item': '<div class="myitem"><h3>%s</h3><p>%s</p></div>' % (subject, message)
        }
        
        
    else:
        errs = {}
        for k in form.errors.keys():
            errs[k] = str(form.errors[k])
            
        status = {
            'success': False,
            'errors': errs
        }
        
    return HttpResponse(json.dumps(status))
    
    
def listedit_index(req):
    return render_to_response('demo_listedit.html', {'form':ListAddForm()})
    
def listedit_data(req):
    '''
    yeah, this is stupid.
    '''
    data = {
        'id': req.GET['id'],
        'subject': req.GET['subject'],
        'message': req.GET['message']
    }
    return HttpResponse(json.dumps(data))
    
def listedit_edit(req):
    form = ListAddForm(req.POST)
    
    if form.is_valid():
        subject = form.cleaned_data['subject']
        message = form.cleaned_data['message']
        id = form.cleaned_data['id']
    
        status = { 
            'success': True, 
            'item': '''<div class="myitem">

				<div class="display-data">
					<h3><a class="edit-link" href="#">edit</a> <span class="head-data">%s</span></h3>
					<p><span class="body-data">%s</span></p>
				</div>

				<div class="edit-data">
					<div input="id">%s</div>
					<div input="subject">%s</div>
					<div input="message">%s</div>
				</div>

			</div>''' % (subject, message, id, subject, message)
        }
        
        
    else:
        errs = {}
        for k in form.errors.keys():
            errs[k] = str(form.errors[k])
            
        status = {
            'success': False,
            'errors': errs
        }
        
    return HttpResponse(json.dumps(status))