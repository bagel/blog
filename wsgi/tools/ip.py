#!/usr/bin/env python

import sys
import os
import urllib2
import json


def search(environ):
    ctype = 'text/plain'
    ip = environ['QUERY_STRING']
    if not ip:
        try:
            return (ctype, environ['HTTP_X_FORWARDED_FOR'])
        except:
            return (ctype, environ['REMOTE_ADDR'])
    url = 'http://ip.taobao.com/service/getIpInfo.php?ip=' + ip
    s = urllib2.urlopen(url)
    data = json.loads(s.readline()).get('data')
    keys = ['country', 'region', 'city', 'isp']
    response_body = '\n'.join(['%7s => %s' % (key, data[key]) for key in keys]) + '\n'
    return (ctype, response_body.encode('utf8'))


if __name__ == "__main__":
    environ={'QUERY_STRING': '118.194.218.82'}
    print search(environ)
