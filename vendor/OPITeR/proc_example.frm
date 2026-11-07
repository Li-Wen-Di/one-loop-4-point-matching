* This code demonstrates the out put of each of the procedures that 
* make up the OPITeR code 
#-
#: IncDir opiter
*-----------------------------------
#include- opiter.frm
*-----------------------------------
Off Statistics;

Autodeclare vector p,q;

L [without_sym] = ext(q1)*loop(p1,p2)*p1(mu1)*p2(mu2)*p2(mu3);
L [with_sym] = ext(q1)*loop(p1,p2)*p1(mu1)*p2(mu2)*p2(mu3);
#message This is the input
print +s;
.sort 
#message now we act with tenred on [without sym] and with tenredisym on [with sym]

hide [with sym];
#call tenred
.sort
unhide [with sym];

hide [without sym];
#call tenredisym
.sort
unhide [without sym];

B dual,ddts,sym;
print;

.sort 
#message now we expand out the dot products of transverse momenta dt(p,p) 
#message using expanddt

#call expanddt
B dual,ddts,sym;
print;

.sort 

#message if we wish to leave dual transverse basis we must 
#message expand transverse metrics ddts(mu1,mu2) using expanddt

id ddts(mu1?,mu2?)=dt(mu1,mu2);
#call expanddt

B dual,d_,sym;
print;

.sort
#message now we may expand the dual momenta dual(q,mu) using dual2ext

#call dual2ext

B d_,sym;
print;
.sort 

#message finally we may substitute values for the inverse gram matrix elements H(i,j)
#message using subinvgram and subinvgramdet
#call subinvgram
#call subinvgramdet

B sym;
print +s;
.end