#!/usr/bin/env python

import os
import urllib2
import re

def proxy(environ):
    ctype = 'text/html'
    head = 'https://fox-we.rhcloud.com/fun?'
    url = environ['QUERY_STRING']
    if re.match('url=', url):
        url = ''.join(url.split('url=')[1:])
    if not url:
        return (ctype, 'fun')
    if not re.match('https?://', url):
        url = 'http://' + url
    s = urllib2.urlopen(url)
    response = ''
    if s.headers.type != ctype:
        response = s.readlines()
    else:
        line = s.readline()
        while line:
            if re.search('http://', line):
                line = line.replace('http://', head)
            elif re.search('https://', line):
                line = line.replace('https://', head)
            elif re.search('<a href="/', line):
                line = line.replace('<a href="/', '<a href="%s%s/' % (head, url))
            response += line
            line = s.readline()
    return (ctype, response)

def page(environ):
    ctype = 'text/html'
    user_ip = environ['HTTP_X_FORWARDED_FOR']
    proxy_head = '/fun'
    response = '''<!doctype html>
<html>
<head>
    <title>Fun</title>
    <style type="text/css">
        body{
            font-size: 14px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form method="get" action="%s">
        IP: %s
        <br>
        site: 
        <input type="text" name="url" value="www.google.com" maxlength="255" size="40">
        <input type="submit" value="visit">
    </form>
</body>
</html>
''' % (proxy_head, user_ip)
    return (ctype, response)


#test
if __name__ == '__main__':
    c, r = proxy(1)
    print r
