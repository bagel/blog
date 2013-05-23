#!/usr/bin/env python

import sys
import os
import test
import test2

def urls(environ):
    template = os.path.join(environ['DOCUMENT_ROOT'], 'test/template')
    if environ['PATH_INFO'] == '/test/work':
        return test.work()
    elif environ['PATH_INFO'] == '/test/html':
        return test.html(environ, template)
    elif environ['PATH_INFO'] == '/test2':
        return test2.test2()
    else:
        return test.test()
