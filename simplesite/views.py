# Create your views here.
from django.conf import settings
from django.shortcuts import render_to_response, get_object_or_404
from django.http import HttpResponse
from django.utils import simplejson as json
from django import forms

from smtplib import SMTPException

from simplesite.models import Image, Sidebar, Page


def index(req):
    page = Page.objects.get(id=settings.INDEX_PAGE_ID)
    return render_to_response('index.html', {'page': page})
    
def page(req, page_slug):
    page = get_object_or_404(Page, slug=page_slug)
    return render_to_response('page.html', {'page': page})



class ContactForm(forms.Form):
    subject = forms.CharField(max_length=100)
    message = forms.CharField(widget=forms.widgets.Textarea())
    sender = forms.EmailField()

def contactpost(req):
    """
    Sends email if possible.
    returns form, status
    """
    
    status = None
    form = ContactForm(req.POST) # A form bound to the POST data
    
    if form.is_valid(): # All validation rules pass
        subject = form.cleaned_data['subject']
        message = form.cleaned_data['message']
        sender = form.cleaned_data['sender']
        recipients = [settings.EMAIL_CONTACT_RECIPIENT]
    
        from django.core.mail import EmailMessage
        
        try:
            em = EmailMessage(subject, message, settings.EMAIL_CONTACT_SENDER, recipients, headers = {'Reply-To': sender})
            em.send()
            status = { 'good': True, 'msg':"" }
        except SMTPException, ex:
            status = { 'good': False, 'msg':str(ex) }
        
    return form, status
    
        
def contactpost_async(req):
    """
    returns json: {good: True|False, msg:'somestr'}
    """
    
    form, status = contactpost(req)
    return HttpResponse(json.dumps(status))


def contact(req):
    if req.method == 'POST':
        if req.POST.has_key('async'):
            return contactpost_async(req)
            
        form, status = contactpost(req)

    else:
        status = None
        form = ContactForm()
    
    page = Page.objects.get(id=settings.CONTACT_PAGE_ID)
    
    return render_to_response('contact.html', {'page': page, 'form': form, 'status':status})
