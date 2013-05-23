#!/usr/bin/env python

import sys
import proxy


def urls(environ):
    if environ['PATH_INFO'] == '/fun/page':
        return proxy.page(environ)
    else:
        return proxy.proxy(environ)
