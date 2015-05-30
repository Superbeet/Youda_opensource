#!/usr/bin/env python
# -*- coding: utf-8 -*-
#用于测试
from django.shortcuts import render_to_response
from django.http.response import HttpResponse, HttpResponseRedirect
from apps.form import ContactForm
from django.core.mail import send_mail
def test1(request):
    return render_to_response('file_upload_test.html');
def test2(request):
    li = {'name1':'tomcat','name2':'apache'};
    return HttpResponse(li);

def contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            send_mail(
                cd['subject'],
                cd['message'],
                cd.get('email', 'noreply@example.com'),
                ['siteowner@example.com'],
            )
            return HttpResponseRedirect('/contact/thanks/')
    else:
        form = ContactForm()
    return render_to_response('contact_form.html', {'form': form})