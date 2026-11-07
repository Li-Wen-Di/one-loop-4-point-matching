#: IncDir opiter
*-----------------------------------
#include- opiter.frm
*-----------------------------------

Autodeclare Vector q;

Off statistics;


*Example1: vacuum example at rank=4 and loops=2:
*this example is done twice, the second time we use the symmetriser 
*to write out all terms
L F1a=ext()*loop(p1,p2)*p1(mu1)*p2(mu2)*p2(mu3)*p2(mu4);
L F1b=F1a;

*Example2: with two external momenta q1,q2 at rank 2, L=2:
L F2=ext(q1,q2)*loop(p1,p2)*p1(mu1)*p2(mu2);

*Example3: with spinor indices
L F3=ext(q1)*loop(p1,p2)*p1(mu1)*gam(1,p2,mu2);


*Example4: with an external projector
L F4=proj(<q1(mu1)>*...*<q1(mu10)>)*ext()*loop(p1,p2)
         *<p1(mu1)>*...*<p1(mu5)>
         *<p2(mu6)>*...*<p2(mu10)>;


#call opiter
.sort


hide F1a;        
    #call symmetrise
unhide F1a;    


*uncomment the following to go to standard basis (d_,q1(mu),..):
*#call leavedualtransverse


B loop,ext,Gsigma,d_,ddts,dual,sym,deno;
print +s;
.end


