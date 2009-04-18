from django.db import models
from django.conf import settings
from simplesite import textile

# Create your models here.
class Sidebar(models.Model):
    name = models.CharField(max_length=30)
    content = models.TextField()
    
    def __unicode__(self):
        return self.name
    
    def gethtml(self):
        return textile.textile(self.content)
    
class Image(models.Model):
    name = models.CharField(max_length=30)
    filename = models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.name
        
    def geturl(self):
        return '%s%s' % (settings.IMAGE_URL, self.filename)
    
class Page(models.Model):
    title = models.CharField(max_length=30)
    slug = models.CharField(max_length=100)
    header_image = models.ForeignKey(Image, related_name="headers")
    accent_image = models.ForeignKey(Image, related_name="accents")
    sidebar = models.ForeignKey(Sidebar)
    meta_description = models.CharField(max_length=256)
    meta_keywords = models.CharField(max_length=100)
    content = models.TextField()
    
    def __unicode__(self):
        return self.title
        
    def gethtml(self):
        return textile.textile(self.content)