#!/usr/bin/env python

import sys
import os
import MySQLdb

class MySQL:
    def connect(self):
        host = os.environ['MYSQL_DB_HOST']
        port = os.environ['MYSQL_DB_PORT']
        user = os.environ['MYSQL_DB_USER']
        passwd = os.environ['MYSQL_DB_PASS']
        conn = MySQLdb.connect(host=host, port=int(port), user=user, passwd=passwd)
        return conn

    def use_db(self, db):
        conn = self.connect()
        try:
            conn.select_db(db)
        except:
            pass
        if not conn.error():
            return conn
        return conn.error()


if __name__ == "__main__":
    db = MySQL().use_db('fox')
