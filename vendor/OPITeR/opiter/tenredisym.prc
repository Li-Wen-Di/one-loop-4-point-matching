#procedure tenredisym
**---------------------------------
** This procedure performs tensor reduction with integrand symmetry.
**---------------------------------

id ext(?a)*loop(?b$l)=ext(?a)*loop(?b)*loop1(?b);
$ll=nargs_($l);
 
*write ONLY the loop momenta in vec(p,mu) form
do $i=1,$ll;
    repeat id loop1(p?,?a)*p?(mu?)=loop1(p,?a)*vec($i,p,mu);
    id loop1(p?,?a)=loop1(?a);
enddo;
id loop1()=1;




if ($ll>0);
	mu TI();
*   load the loop momenta to be reduced into the tensor storage  T()*TI() and split into perp and parallel parts (ext2 is the parallel part)  
*   vacuum case:    
    repeat id vec(c1?,p?,mu?)*TI(?b)*ext()=FF2(qqset[c1],mu)*ext()*(TI(?b,qqset[c1])); 
*   with external momenta:    
    repeat id vec(c1?,p?,mu?)*TI(?b)*ext(?c)=FF2(qqset[c1],mu)*ext(?c)*(TI(?b,qqset[c1])+ext2(p,qqset[c1],?c)*TI(?b)); 
*   remove odd intergrals of transvers momenta 
    id TI(?a)=TI(?a)*tag(nargs_(?a));
    id tag(c?odd_)=0;
    id tag(?a)=1; 
*   expand the parallel parts in terms of dual momenta and p.Q    
**    repeat id ext2(p?,qq?,?a,Q?)=ext2(p,qq,?a)+dual(Q,qq)*p.Q;
**    id ext2(p?,mu?)=0;
endif;



.sort

#message expand tensors `TIMER_' 
*write tensor as sum of projectors*terms
id TI(?a$x)=dd_(?a);
id p1?qqset[c1].p2?qqset[c2]=Prat(ppset[c1],ppset[c2])*ddts(p1,p2);

*replace pp`i':
id loop(?a$l)=loop1(?a)*loop(?a);
$ll=nargs_($l);
do $i=1,$ll;
id loop1(p?,?a)=loop1(?a)*replace_(ppset[$i],p);
enddo;
id loop1()=1;

*substitute contracted projectors:
id once Prat(mu?,nu?)=Prt(mu,nu);
repeat id Prt(?a)*Prat(mu?,nu?)=Prt(?a,mu,nu);
*print[] +s ;
B Prt;
.sort
Keep Brackets;

*assemble and sub in the projectors
#message Canonicalize projectors `TIMER_'
#call PrtCanonicalize
.sort
id ext(?a)=ext(?a)*replace_(Dt,D-nargs_(?a));



* expand the parallel parts in terms of dual momenta and p.Q    
repeat id ext2(p?,mu?,?a,Q?)=ext2(p,mu,?a)+dual(Q,mu)*p.Q;
id ext2(p?,mu?)=0;


* the following replaces FF2s and qqset variables with 'sym's
mu counter3(1);
repeat;
id once FF2(p?,mu?)*counter3(c?)=FF4(p,mu)*FF3(p,indMMu[c])*counter3(c+1);
repeat id FF4(p?,?a)*FF3(p?,?b)*FF2(p?,mu?)*counter3(c?)=
		  FF4(p,?a,mu)*FF3(p,?b,indMMu[c])*counter3(c+1);
endrepeat;
*if nothing to symmetrise:
id FF4(p?,mu?)*FF3(p?,nu?)=d_(mu,nu)*FF3(p,nu);
*if non-trivial symmetries: 
id FF4(p?,?a)*FF3(p?,?b)=sym(ind1(?a)*ind2(?b))*FF3(p,?b);


repeat;
id FF3(p?,?a,mu?)*ddts(p?,mu2?)=FF3(p,?a)*ddts(mu2,mu);
id FF3(p?,?a,mu?)*ddts(p1?,p?)=FF3(p,?a)*ddts(p1,mu);
id FF3(p?,?a,mu?)*dual(p1?,p?)=FF3(p,?a)*dual(p1,mu);
*****id FF3(p?,?a,mu?)*ext2(p1?,p?,?b)=FF3(p,?a)*ext2(p1,mu,?b);
endrepeat;
id FF3(p?)=1;
id counter3(?a)=1;


*hack
*print +s;
*.end
*hack
* the following replaces FF2s and qqset variables with 'sym's
*repeat id FF2(p1?,?a)*FF2(p1?,?b)=FF2(p1,?a,?b);
*id FF2(p?,?a)=FF2(ind1(?a))*FF3(p,?a);
*repeat;
*id FF3(p?,?a,mu?)*ddts(p?,mu2?)=FF3(p,?a)*ddts(mu2,mu);
*id FF3(p?,?a,mu?)*ddts(p1?,p?)=FF3(p,?a)*ddts(p1,mu);
*id FF3(p?,?a,mu?)*dual(p1?,p?)=FF3(p,?a)*dual(p1,mu);
*endrepeat;
*id FF3(p?)=1;


#endprocedure