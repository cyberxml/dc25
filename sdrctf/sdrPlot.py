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
#cur.execute("SELECT * from baseline order by freq")
cur.execute("select freq, max(power) from freqs where date ='2017-07-30' group by freq")

# print all the first cell of all the rows
baseline=cur.fetchall()
#for row in cur.fetchall():
    #print row


cur.execute("SELECT * from sdr30 order by freq;")
sdr=cur.fetchall()
print baseline[0]
print sdr[0]
db.close()
import matplotlib.pyplot as plt
bx=[]
by=[]
cx=[]
cy=[]
dy=[]
for i in baseline:
	bx.append(i[0])
	by.append(i[1])
for i in sdr:
	cx.append(i[0])
	cy.append(i[1])
for i in range(len(sdr)):
	dy.append(by[i]-cy[i])
	
plt.plot(bx,by)
plt.plot(cx,cy)
plt.ylabel('power')
plt.xlabel('freq')
plt.show()

plt.plot(cx,dy)
plt.ylabel('power')
plt.xlabel('freq')
plt.show()

for i in range(len(dy)):
	if dy[i]>8:
		print bx[i],dy[i]

