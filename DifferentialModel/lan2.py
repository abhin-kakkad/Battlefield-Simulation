import numpy as np;
import matplotlib.pyplot as plt;

t0=0
tf=20
dt=0.01
t=np.arange(t0,tf,dt)
n=len(t)

armyA1=np.zeros([n])
armyA2=np.zeros([n])
armyB1=np.zeros([n])
armyB2=np.zeros([n])

A1=200
A2=120
B1=140
B2=200

armyA1[0]= A1
armyA2[0]= A2
armyB1[0]= B1
armyB2[0]= B2

f1 = 0.045;
f2 = 0.07;
d1 = 0.008;
p1 = 0.03;
s1 = 0.04;
s2 = 0.06;

for i in range(1,n):
    
    armyA1[i] = armyA1[i-1] - dt*s1*armyB1[i-1] - dt*s2*armyB2[i-1];    
    armyA2[i] = armyA2[i-1] - dt*p1*armyB1[i-1];    
    armyB1[i] = armyB1[i-1] - dt*d1*armyA2[i-1];   
    armyB2[i] = armyB2[i-1] - dt*f1*armyA2[i-1] - dt*f2*armyA1[i-1];
	
	
plt.plot(t,armyA1,'-',label = "Army A Soldiers")
plt.plot(t,armyA2,'-',label = "Army A Heavy Artillery")
plt.plot(t,armyB1,'-',label = "Army B Heavy Artillery")
plt.plot(t,armyB2,'-',label = "Army B Soldiers")

plt.suptitle('Lanchester Conventional 2v2 Model')
axes = plt.gca()
plt.xlabel("Time(in days)")
plt.ylabel("No. of Soldiers")
plt.legend()
plt.grid(True)
plt.show()