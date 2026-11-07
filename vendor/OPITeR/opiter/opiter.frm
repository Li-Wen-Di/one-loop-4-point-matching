*     OPITeR: Orbit Partition approach for Integral Tensor Reduction  
*	  A Form procedure for reducing Tensor Feynman integrals 
*
*     Copyright (C) 2024  Jae Goode, Franz Herzog, Sam Teale

*     This program is free software: you can redistribute it and/or modify
*     it under the terms of the GNU General Public License as published by
*     the Free Software Foundation, either version 3 of the License, or
*     (at your option) any later version.

*     This program is distributed in the hope that it will be useful,
*     but WITHOUT ANY WARRANTY; without even the implied warranty of
*     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*     GNU General Public License for more details.

*     You should have received a copy of the GNU General Public License
*     along with this program.  If not, see <https://www.gnu.org/licenses/>.


* Some variables which may overlap with other programs

* ========= *
* variables *
* ========= *

Symbol Dt,D,ep;
Dimension D;

CF s,counter,counter2,counter3,rat,gamind,ind,ind1,ind2,vec,tag,gtr,D3(symmetric),dt(symmetric),ddt,ddts(symmetric), Prt,gamm,T,TI;
CF sym,symn,proj,Gsigma,Gsigma2,sigma,cgam,ext,loop,ext1,ext2,loop1,dual,H,deno;*should we relabel H??

Autodeclare Index jj,MMu,NNu,musi,muro,mumu,nunu,mu,nu;

Tensor Pr,Prat(symmetric),gam;

Autodeclare Vector RR,qq,pp,p,Q,q;
Autodeclare Symbol c,invDelta;

Autodeclare CF FF;

*Format nospaces;
polyratfun rat;

set indmuro: muro1,...,muro100;
set indmusi: musi1,...,musi100;
set indmumu:mumu1,...,mumu100;
set indnunu:nunu1,...,nunu100;
set qqset:qq1,...,qq30;
set ppset:pp1,...,pp30;
set indMMu:MMu1,...,MMu30;
set indNNu:NNu1,...,NNu30;

Table sparse, Prt2(2,p1?,p2?,p3?,p4?);
Table sparse, Prt4(4,p1?,p2?,p3?,p4?);
Table sparse, Prt6(6,p1?,p2?,p3?,p4?);
Table sparse, Prt8(8,p1?,p2?,p3?,p4?);
Table sparse, Prt10(10,p1?,p2?,p3?,p4?);
Table sparse, Prt12(12,p1?,p2?,p3?,p4?);
Table sparse, Prt14(14,p1?,p2?,p3?,p4?);
Table sparse, Prt16(16,p1?,p2?,p3?,p4?);
Table sparse, Prt18(18,p1?,p2?,p3?,p4?);
Table sparse, Prt20(20,p1?,p2?,p3?,p4?);

#do ii =1,10
Table sparse PrtExplicit{2*`ii'}(1,<mu1?,nu1?>,...,<mu`ii'?,nu`ii'?>,ep?);
#enddo

#include gamma_algebra.h  

#include opitersettings.dat


#do k=2,`MaxN',2
*#do k=2,20,2
    #include-  projectors/Prt_table`k'.h
#enddo  

*#do k=2,8
#do k=2,`MaxE'
    #include-  grammatrix/invgram_table`k'.frm
#enddo  

#include- projectors/projectors_2_16.frm
#if `MaxN'>=16
    #include- projectors/projectors_18_20.frm
#endif



*
* --------------------------------------------------------------
*

*this expands out a transverse metric that may be contracted with momenta
#procedure expanddt
mu counter2(1);
*repeat;
*id once dt(p1?,p2?) = p1(nununu1)*p2(nununu2)*dt(nununu1,nununu2);
repeat id  dt(p1?,p2?)*counter2(c?) = vec(p1,indmumu[c])*vec(p2,indnunu[c])*dt(indmumu[c],indnunu[c])*counter2(c+1);
id counter2(c?)=1;
* sum nununu1;
* sum nununu2;
*endrepeat;
*################
*d_ may be dangerous
repeat id dt(mu?,nu?)*ext(?a) = ext(?a)*(d_(mu,nu)-ext1(nargs_(?a),mu,nu,?a)*ext2(nargs_(?a),mu,nu,?a));
*################
* $EE = nargs_($eee);

repeat id ext2(c2?,mu?,nu?,?bb,Q?)= ext2(c2-1,mu,nu,?bb)+H(tag(mu,nu),c2)*vec(Q,nu);
id ext2(0,?a)=0;
repeat id ext1(c1?,mu?,nu?,?a,Q?)*H(tag(mu?,nu?),c2?) = ext1(c1-1,mu,nu,?a)*H(tag(mu,nu),c2) +vec(Q,mu)*H(tag(mu,nu),c1,c2);
id ext1(0,?a)=0;

id vec(p1?,p2?)=p1.p2;
id vec(p1?,mu?)*vec(p2?,mu?)=p1.p2;
id H(tag(mu?,nu?),c1?,c2?)=H(c1,c2);
id vec(p1?,mu?)=p1(mu);
#endprocedure

*
* --------------------------------------------------------------
*
* this substitues the elements of the inverse gram matrix H(i,j)

#procedure subinvgram

repeat id H(c1?,c2?)*ext(Q1?) = ext(Q1)/(Q1.Q1);

#do ii =2,`MaxE'
repeat id H(c1?,c2?)*ext(Q1?,...,Q`ii'?) = Htable`ii'(c1,c2,Q1,...,Q`ii')*ext(Q1,...,Q`ii');
#enddo

#endprocedure


*
* --------------------------------------------------------------
*
* this substitues the determinant of the inverse gram matrix H(i,j)

#procedure subinvgramdet
#do ii =2,`MaxE'
repeat id invDelta`ii'*ext(Q1?,...,Q`ii'?) = deno(Htable`ii'(0,0,Q1,...,Q`ii'))*ext(Q1,...,Q`ii');
#enddo
#endprocedure

*
* --------------------------------------------------------------
*
* this coverts back to the non-dual-transverse basis:
#procedure leavedualtransverse
id ddts(mu1?,mu2?)=dt(mu1,mu2);
#call expanddt
#call dual2ext
#call subinvgram
#call subinvgramdet
#endprocedure


*
* --------------------------------------------------------------
*
* this conversts duals back to external mom
#procedure dual2ext
id ext(?a$ee)=ext(?a);
$E = nargs_($ee);
repeat id dual(Q?,mu?)*ext(?a,Q?,?b)= ext1($E-nargs_(?b),mu,$E,?a,Q,?b)*ext(?a,Q,?b);
repeat id ext1(c1?,mu?,c2?,?a,Q?) = ext1(c1,mu,c2-1,?a) + H(c1,c2)*Q(mu);
id ext1(?a,0)=0;
#endprocedure

*
* --------------------------------------------------------------
*
* this conversts duals to RR

#procedure simplifydual
	#do ii =1,8
		repeat id ext(p1?,...,p`ii'?,?b)*dual(p`ii'?,mu?) = RR`ii'(mu)*ext(p1,...,p`ii',?b);
	#enddo
*   These tidy up teh output	
	id ext(?a)*ddts(mu?,mu?) = ext(?a)*rat(D-nargs_(?a),1);
	repeat id ddts(mu1?,nu?)*ddts(mu2?,nu?) = ddts(mu1,mu2);
	id ddts(mu?,nu?)*Gsigma(?a,mu?,?b,nu?,?c) = 0;
	id ddts(mu?,nu?)*Gsigma(?a,nu?,?b,mu?,?c) = 0;

*################
*would be good to find alternative to this or just wait till after ddts evaluated 
*  this simplifies some combinations of ddts and Gsigma	
	sum muro1,...,muro8;
*################
#endprocedure

*
* --------------------------------------------------------------
*
* Strip loop momenta from p-slash
#procedure gamtotensor
	id loop(?b$l)=loop(?b)*loop1(?b);
	$ll=nargs_($l);
	mu counter(1);
 	do $i=1,$ll;
 		repeat id gam(?a,p?,?b)*counter(c?)*loop1(p?,?c)=counter(c+1)*gam(?a,indmusi[c],?b)*vec($i,p,indmuro[c])*loop1(p,?c);
		repeat id Gsigma(?a,p?,?b)*counter(c?)*loop1(p?,?c)=counter(c+1)*Gsigma(?a,indmusi[c],?b)*vec($i,p,indmuro[c])*loop1(p,?c);
	   id loop1(p?,?a)=loop1(?a);
 	enddo;
	id counter(1)=1;   

#endprocedure



*
* --------------------------------------------------------------
*
* Performs the sum over permutations in sym-functions.

#procedure symmetrise
id proj(c?)=c;

#do i=1,{`MaxN'/2}
*#do i=1,1
*#do i=1,1

    id once sym(c?)=symn(c);

*print "4%$",$f4;
#do i=1,`MaxN'
*#do i=1,1
    id symn(ind1(mu?)*ind2(nu?))=d_(mu,nu);
    id symn(c?)=FF1(c)*FF2(c)*FF3(c)*FF4(c);

	argument FF4;
    id ind1(mu1?,?c1)*ind2(nu1?,?c2)=
       ind1(?c1)*ind2(?c2);
	repeat id ind1(mu1?,?c1)*ind2(nu1?indMMu[c],?c2)=
		d_(indNNu[c],mu1)*ind1(?c1)*ind2(?c2);
    id ind1()=1;
    id ind2()=1;		
	endargument;

	id FF4(c4?)*FF1(c1?)*FF2(c2?)
		=FF1(c1*c4)*FF2(c2*c4);

    argument FF1;
    id ind1(mu1?,?c)=FF5(mu1)*FF5(?c)/(nargs_(?c)+1);
    shuffle FF5;
    repeat id ind2(?a,mu1?)*FF5(?b,mu2?)=ind2(?a)*FF5(?b)*d_(mu1,mu2);   
    id FF5()=1;
    id ind2()=1;
    endargument;

    argument FF2;
    id ind1(mu1?,?c1)*ind2(nu1?,?c2)=
       ind1(?c1)*ind2(?c2);
    repeat id ind2(?a,mu1?)*ind1(?b,mu2?)=ind2(?a)*ind1(?b)*d_(mu1,mu2);   
    id ind1()=1;
    id ind2()=1;
    endargument;

    argument FF3;
    id ind1(mu1?,?c1)*ind2(nu1?,?c2)=
       symn(ind1(?c1)*ind2(?c2));
    endargument;

    id FF1(c?)=c;
    id FF2(c?)=c;
    id FF3(c?)=c;
    .sort
#enddo
.sort

#enddo
#endprocedure


*--------------------------








*---------------------------------------------------------------------------------
#procedure expandinvars
id FF2(c?)=c*FF2(c);
repeat;
id FF3(p?,?a,mu?)*ddt(?b,p?)=FF3(p,?a)*ddt(?b,mu);
id FF3(p?,?a,mu?)*ddt(p?,?b)=FF3(p,?a)*ddt(?b,mu);
endrepeat;
id FF3(p?)=1;
id FF2(c?)=c;
id ddt(mu1?,mu2?)=ddts(mu1,mu2);
#do i=1,10
	id once FF3(p?,?a)=1/fac_(nargs_(?a))*f2(?a)*perm_(f1,?a);
	mu rep();
	repeat id rep(?c)*f2(?a,mu1?)*f1(?b,mu2?)=f2(?a)*f1(?b)*rep(?c,mu1,mu2);
	id f1()=1;
	id f2()=1;
	id rep(?b)=replace_(?b);
*	.sort
#enddo
#endprocedure

#procedure toPbais 
 	id ddts(mu1?,mu2?)=dt(mu1,mu2);
    #call expanddt
    #call dual2ext
*   sub in the inverse gram elements H(i,j)
	#call subinvgram
*   sub in the inverse gram determinant
	#call subinvgramdet
#endprocedure




*---------------------------------------------------------------------------------

#procedure opiter

#message gamma-algebra `TIMER_' 
#call gamma2Gamma
#call gamtotensor
.sort

#message tensor-reduce `TIMER_' 
#if `tensormode'=1
    #call tenred
#elseif `tensormode'=2
    #call tenredisym    
* 	#call symmetrise
#endif

*expands transverse dot-products of tensors:
#message expand-dts `TIMER_' 
#call expanddt

*#call subinvgram

#call tensortogamma
.sort
#if `tensorbasis'=2
    id ddts(mu1?,mu2?)=dt(mu1,mu2);
    #call expanddt
    #call dual2ext
#endif



#message simplify dual `TIMER_' 
.sort
*#call simplifydual
.sort
*simplify Gsigmas
#message Gsigma `TIMER_' 
#call simpGsigma
* sub in the inverse gram elements H(i,j)
#message sub H(i,j) `TIMER_' 
#call subinvgram

* sub in the inverse gram determinant
#call subinvgramdet


#endprocedure 


