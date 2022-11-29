
pBH0=0.95     #1-alpha
pBquerH0quer=0.97 #1-beta
pH0=0.05

pB=pH0*pBH0+(1-pH0)*(1-pBquerH0quer)

pH0B=pBH0*pH0/pB
pH0Bquer=(1-pBH0)*pH0/(1-pB)

print "pB=",pB
print "pH0B=",pH0B
print "pH0Bquer=",pH0Bquer
