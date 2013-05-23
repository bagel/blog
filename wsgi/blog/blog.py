#!/usr/bin/env python

import os
import sys
import time
import script
import db
import re
import urllib
import cgi
#import MySQLdb


def count(ip):
    conn = db.MySQL().use_db('fox')
    #conn = MySQLdb.connect(user='admin', passwd='QqsFwIkuh4zI', host='127.0.250.129', port=3306, db='fox')
    cu = conn.cursor()
    date = time.strftime('%Y-%m-%d')
    c = 1
    #if re.match('192\.168|10\.|127\.0\.0\.1', ip):
    if re.match('10\.', ip):
        c = 0
    cu.execute('select count from count where date=%s',  (date,))
    if not cu.fetchall():
        cu.execute('insert into count values (%s, %s)', (date, c))
    else:
        cu.execute('update count set count=count+%s where date=%s', (c, date))
    cu.execute('select sum(count) from count')
    counts = cu.fetchall()[0][0]
    conn.commit()
    cu.close()
    conn.close()
    return counts

def blogdb(sql):
    conn = db.MySQL().use_db('fox')
    cu = conn.cursor()
    cu.execute(sql)
    blogs = dict()
    row = cu.fetchone()
    while row:
        blogs[row[0]] = row
        row = cu.fetchone()
    return blogs

def blog(environ, template, sql, bdict={}):
    ctype = 'text/html'
    try:
        user_ip = environ['HTTP_X_FORWARDED_FOR']
    except:
        user_ip = environ['REMOTE_ADDR']
    counts = count(user_ip)
    blogs = blogdb(sql)
    tdict = {'ip': user_ip, 'count': counts, 'blog': blogs, \
             'url': environ['HTTP_HOST'] + '/blog', \
             'path': environ['PATH_INFO']}
    tdict.update(bdict)
    response_body = script.response(os.path.join(template, 'blog.html'), tdict)
    return (ctype, response_body)

def home(environ, template):
    sql = 'select id,date,title,content,category,tags from blog order by date desc limit 10'
    sum = blogdb('select count(id) from blog').values()[0][0]
    if int(sum) < 10:
        sum = 0
    return blog(environ, template, sql, {'path': 'page', 'sum': sum, 'page': 1})

def page(environ, template):
    page_id = int(os.path.basename(environ['PATH_INFO'].rstrip('/')))
    if page_id == 1:
        return home(environ, template)
    sum = blogdb('select count(id) from blog').values()[0][0]
    dates = blogdb('select date from blog order by date desc limit %s' % ((page_id-1) * 10))
    last_date = dates.values()[-1][0]
    sql = 'select id,date,title,content,category,tags from blog where date < "%s" order by date desc limit 10' % last_date
    return blog(environ, template, sql, {'path': 'page', 'sum': sum, 'page': page_id})
    

def about(environ, template):
    sql = 'select id,date,title,content,category,tags from blog where title like "%about%"'
    return blog(environ, template, sql)

def each(environ, template):
    id = os.path.basename(environ['PATH_INFO'].rstrip('/'))
    sql = 'select id,date,title,content,category,tags from blog where id=%s' % id
    return blog(environ, template, sql)

def edit(environ, template):
    ctype = 'text/html'
    id = os.path.basename(environ['PATH_INFO'].rstrip('/'))
    date = title = content = category = tags = str()
    if id.isdigit():
        sql = 'select id,date,title,content,category,tags from blog where id=%s' % id
        blog = blogdb(sql)[int(id)]
        date, title, content, category, tags = blog[1:]
    else:
        tdict = {'id': 0}
    #if content:
    #    content = content.replace('<br>', '\n')
    tdict = {'id': id, 'date': date, 'title': title, 'content': content, \
             'category': category, 'tags': tags}
    response_body = script.response(os.path.join(template, 'edit.html'), tdict)
    return (ctype, response_body)
    

def post(environ):
    ctype = 'text/plain'
    length = int(environ['CONTENT_LENGTH'])
    data = cgi.parse_qs(environ['wsgi.input'].read(length))
    conn = db.MySQL().use_db('fox')
    cu = conn.cursor()
    post_time = time.strftime('%Y-%m-%d %H:%M:%S')
    id = os.path.basename(environ['PATH_INFO'].rstrip('/'))
    if not id.isdigit():
        cu.execute('insert into blog (date, title, content, category, tags) \
                    values (%s, %s, %s, %s, %s)', (post_time, \
                    data['title'][0], data['content'][0], \
                    data.get('category', [''])[0], data.get('tags', [''])[0]))
    else:
        cu.execute('update blog set date=%s, title=%s, content=%s, category=%s,\
                    tags=%s where id=%s', (post_time, data['title'][0], \
                    data['content'][0], data.get('category', [''])[0], \
                    data.get('tags', [''])[0], id))
    conn.commit()
    cu.close()
    conn.close()
    response_body = '\n'.join(["%s => %s" % (key, value[0]) for (key, value) in data.items()])
    return (ctype, response_body)


if __name__ == '__main__':
    print count('192.168')
