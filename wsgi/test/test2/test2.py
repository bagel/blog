#!/usr/bin/env python

import os
import sys
import _mysql as mysql


def test2():
    ctype = 'text/plain'
    response_body = 'test2 works!'
    return (ctype, response_body)
