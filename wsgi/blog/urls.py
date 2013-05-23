#!/usr/bin/env python

import sys
import os
import blog

def urls(environ):
    template = os.path.join(environ['DOCUMENT_ROOT'], 'blog/template')
    if environ['PATH_INFO'][:10] == '/blog/edit':
        return blog.edit(environ, template)
    elif environ['PATH_INFO'][:10] == '/blog/post':
        return blog.post(environ)
    elif environ['PATH_INFO'][:10] == '/blog/page':
        return blog.page(environ, template)
    elif environ['PATH_INFO'] == '/blog/about':
        return blog.about(environ, template)
    elif environ['PATH_INFO'][:6] == '/blog/' and \
         os.path.basename(environ['PATH_INFO'].rstrip('/')).isdigit():
        return blog.each(environ, template)
    else:
        return blog.home(environ, template)
