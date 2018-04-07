import numpy as np;
import matplotlib.pyplot as plt;

t0=0
tf=15
dt=0.01
t=np.arange(t0,tf,dt)
n=len(t)

armyA=np.zeros([n])
armyB=np.zeros([n])

Ai=300
Bi=400

armyA[0]= Ai
armyB[0]= Bi

alpha=0.09
beta=0.07

for i in range(1,n):

	armyA[i]=armyA[i-1] - dt*(beta*armyB[i-1])
	armyB[i]=armyB[i-1] - dt*(alpha*armyA[i-1])
	
	
plt.plot(t,armyA,'-',label = "Army A Soldiers")
plt.plot(t,armyB,'-',label = "Army B Soldiers")

plt.suptitle('Lanchester Conventional-Conventional Model')
axes = plt.gca()
plt.xlabel("Time(in days)")
plt.ylabel("No. of Soldiers")
plt.legend()
plt.grid(True)
plt.show()