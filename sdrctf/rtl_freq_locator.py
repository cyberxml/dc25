import sys

dblo=-20

#print sys.argv
freqs = sys.argv[7:]
flo=float(sys.argv[3].replace(',',''))
fhi=float(sys.argv[4].replace(',',''))
fstep=float(sys.argv[5].replace(',',''))
#print freqs
#print flo,fhi,fstep

ffreqs=[float(i.replace(',','')) for i in freqs]
m = max(ffreqs)
if m>dblo:
	ii=[i for i, j in enumerate(ffreqs) if j == m]
	print (ii[0])*fstep+flo, ffreqs[ii[0]]
