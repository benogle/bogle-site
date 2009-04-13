# Create your views here.
from django.conf import settings
from django.shortcuts import render_to_response, get_object_or_404
from django.http import HttpResponse


from simplesite.models import Image, Sidebar, Page


def index(req):
    page = Page.objects.get(id=settings.INDEX_PAGE_ID)
    return render_to_response('index.html', {'page': page})


def page(req, page_slug):
    page = get_object_or_404(Page, slug=page_slug)
    return render_to_response('page.html', {'page': page})
