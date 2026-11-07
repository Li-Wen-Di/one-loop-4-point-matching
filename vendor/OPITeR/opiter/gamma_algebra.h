*
* --------------------------------------------------------------
*
* Simplify gamma structures 

#procedure gammaSimplify

B gam,Gsigma;
.sort
Keep Brackets;

repeat;
id once Gsigma(mu1?,?a,mu2?)=1/fac_(nargs_(?a))*perm_(1,gamm,?a)*gamind(mu1,mu2);
id once gamm(?a)*gamind(mu1?,mu2?)=gam(mu1,?a,mu2);
endrepeat;

repeat;
	id once gam(jj? ,?a ,jj2?)*D3(jj2?,jj3?)=gam(jj ,?a ,jj3); 
	id once gam(jj2? ,?a ,jj?)*D3(jj2?,jj3?)=gam(jj3 ,?a ,jj);
	id once gam(jj? ,?a ,jj2?)*gam(jj2? ,?a1 ,jj3?)= gam(jj ,?a ,?a1 ,jj3);
endrepeat;
id D3(jj1?,jj2?)*D3(jj2?,jj1?)=4;
*
* some gamma simplifications:
*
#do i=1,10
id once gam(jj1?,?a,mu?,mu?,?b,jj2?)=gam(jj1,?a,?b,jj2)*rat(4-2*ep,1); 
id once gam(jj1?,?a,mu?,?c,nu?,mu?,?b,jj2?)= -gam(jj1,?a,mu,?c,mu,nu,?b,jj2)+2*gam(jj1,?a,nu,?c,?b,jj2); 
id once gam(jj1?,?a,mu?,?c,p?,mu?,?b,jj2?)= -gam(jj1,?a,mu,?c,mu,p,?b,jj2)+2*gam(jj1,?a,p,?c,?b,jj2); 
#enddo
#do i=1,50
id once gam(jj1?,?a,p?,p?,?b,jj2?)=gam(jj1,?a,?b,jj2)*p.p; 
id once gam(jj1?,?a,p?,?c,nu?,p?,?b,jj2?)= -gam(jj1,?a,p,?c,p,nu,?b,jj2)+2*p(nu)*gam(jj1,?a,p,?c,?b,jj2); 
id once gam(jj1?,?a,p?,?c,p2?,p?,?b,jj2?)= -gam(jj1,?a,p,?c,p,p2,?b,jj2)+2*p.p2*gam(jj1,?a,p,?c,?b,jj2); 
id once gam(jj1?,?a,p?,p?,?b,jj2?)=gam(jj1,?a,?b,jj2)*p.p; 
#enddo 

*
*trace any fermion loops
*

id gam(mu1?,?a,mu2?)*gam(mu2?,?b,mu1?)=gtr(?a,?b);
id gam(jj?,?mu,jj?)=gtr(?mu);

repeat;
id once gtr(?a)=g_(1,?a);
tracen,1;
endrepeat;

id D=rat(4-2*ep,1);
#endprocedure



*
*--------------------------------------------------------------
*
*recombines momenta into gamma structures 

#procedure tensortogamma

*shift counter back by one (this is to match the counter with muro/musi argument numbers)
 	id counter(c?)=counter(c-1);
*contract musis and muros 	
	repeat;
	id counter(c?)=counter(c-1)*d_(indmusi[c],indmuro[c]);
	id counter(0)=1;
	endrepeat;

	#message gammaalgebra:
	#call gammaSimplify
	#call gamma2Gamma

#endprocedure


*
*--------------------------------------------------------------
*
*converts from gam string to Gsigmas 

#procedure gamma2Gamma
***convert to asymmetric basis***
	#do i=1,5
		id once gam(jj1?,?a,jj2?)=gamind(jj1,jj2)*sum_(c,0,nargs_(?a),2,distrib_(-2,c,sigma,gtr,?a))/4;
*		Antisymmetrize sigma;
*		print[] +s;	
*		.sort
		id Gsigma(?a,mu?,?c,mu?,?b)=0;	
		id Gsigma(?a,p?,?c,p?,?b)=0;	
		id once gamind(jj1?,jj2?)*sigma(?a)=Gsigma(jj1,?a,jj2);
*#############################
*    need to think carfully about the dimension 
*#############################
		id once gtr(?a)=g_(1,?a);
		tracen,1;
 	#enddo
#endprocedure



*
*--------------------------------------------------------------
*
*simplifies Gsigmas 

#procedure simpGsigma
	#do i=1,5
		id once Gsigma(jj1?,?c,jj2?)=gamind(jj1,jj2)*sigma(?c);
		Antisymmetrize sigma;
		.sort
		id once gamind(jj1?,jj2?)*sigma(?a)=Gsigma2(jj1,?a,jj2);
	#enddo
	id Gsigma2(?a)=Gsigma(?a);
#endprocedure