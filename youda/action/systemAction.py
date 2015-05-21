from django.shortcuts import render_to_response



def toLogin(request):
    return render_to_response('login.html')