#!/usr/bin/env python

import sys


def urls(environ):
    if environ['PATH_INFO'] == '/ip':
        import ip
        return ip.search(environ)
