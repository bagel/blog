#!/usr/bin/env python
#-*- coding: utf8 -*-

import os
import sys
import _mysql as mysql
import script

def test():
    ctype = 'text/plain'
    html = ''
    html += 'Python: %s\n' % sys.version
    html += 'mysql: %s\n' % mysql.get_client_info()
    html += 'OPENSHIFT_MYSQL_DB: %s:%d\n' % (os.environ['OPENSHIFT_MYSQL_DB_HOST'], int(os.environ['OPENSHIFT_MYSQL_DB_PORT']))
    return (ctype, html)

def work():
    ctype = 'text/plain'
    response_body = 'It works!'
    return (ctype, response_body)

def html(environ, template):
    ctype = 'text/html'
    ip = environ['HTTP_X_FORWARDED_FOR']
    response_body = script.response(os.path.join(template, 'test.html'), {'val': 'Hello It works!', 'n': 20, 'ip': ip, 'code': '成功'})
    return (ctype, response_body)
