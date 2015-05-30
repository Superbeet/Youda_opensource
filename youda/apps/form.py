#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django import forms
class ContactForm(forms.Form):
    subject = forms.CharField()
    email = forms.EmailField(required=False)
    message = forms.CharField()

class login(forms.Form):
    title = forms.CharField();
    imagefile  = forms.ImageField();