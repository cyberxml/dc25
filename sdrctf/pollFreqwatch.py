#!/usr/bin/python
import MySQLdb

db = MySQLdb.connect(host="localhost",    # your host, usually localhost
                     user="freqwatch",         # your username
                     passwd="freq7532",  # your password
                     db="freqwatch")        # name of the data base

# you must create a Cursor object. It will let
#  you execute all the queries you need
cur = db.cursor()

# Use all the SQL you like
cur.execute("SELECT * from baseline order by freq;")

# print all the first cell of all the rows
baseline=cur.fetchall()
#for row in cur.fetchall():
    #print row


cur.execute("SELECT * from ctf order by freq;")
sdr=cur.fetchall()
print baseline[0]
print sdr[0]
db.close()
