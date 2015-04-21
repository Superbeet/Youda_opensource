from django.conf.urls import patterns, include, url
from django.contrib import admin
import apps.urls

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'YoudaBE.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'', include(apps.urls)),
)
