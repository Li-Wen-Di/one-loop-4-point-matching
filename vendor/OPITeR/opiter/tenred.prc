#procedure tenred
**---------------------------------
** This procedure performs tensor reduction without integrand symmetry.
**---------------------------------

*fix the vec v(i,p,mu) from gammatotensor to vec(p,mu)
id vec(c?,p?,mu?)= vec(p,mu);

id ext(?a)*loop(?b$l)=ext(?a)*loop(?b)*loop1(?b);
$ll=nargs_($l);

*write ONLY the loop momenta in vec(p,mu) form
do $i=1,$ll;
    repeat id loop1(?a,p?)*p?(mu?)=loop1(?a,p)*vec(p,mu);
    id loop1(?a,p?)=loop1(?a);
enddo;
id loop1()=1;

if ($ll>0);
	mu T()*TI();
*   load the loop momenta to be reduced into the tensor storage  T()*TI() and split into perp and parallel parts (ext2 is the parallel part)  
    repeat id vec(p?,mu?)*T(?a)*TI(?b)*ext(?c)= T(?a,p)*TI(?b,mu)*ext(?c)+ext2(p,mu,?c)*T(?a)*TI(?b)*ext(?c); 
*   remove odd intergrals of transvers momenta 
    id TI(?a)=TI(?a)*tag(nargs_(?a));
    id tag(c?odd_)=0;
    id tag(?a)=1; 
*   expand the parallel parts in terms of dual momenta and p.Q    
    repeat id ext2(p?,mu?,?a,Q?)=ext2(p,mu,?a)+dual(Q,mu)*p.Q;
    id ext2(p?,mu?)=0;
endif;

*B ext2;
*print +s;
.sort

#message expand tensors `TIMER_' 
*write tensor as sum of projectors*terms
id TI(?a)=FF2(TI(?a))*dd_(?a);
id once d_(mu1?,mu2?)=Prat(mu1,mu2)*FF1(ddts(mu1,mu2));
repeat id d_(mu1?,mu2?)*FF1(c?)=Prat(mu1,mu2)*FF1(c*ddts(mu1,mu2));
id FF2(c?)=c;

repeat id T(?a,p?)*TI(?b,mu?)=T(?a)*TI(?b)*p(mu);
id T()=1;
id TI()=1;

*release tensor structures (this assumes that all indices have been contracted successfully)
id FF1(c?)=c;

id once Prat(mu?,nu?)=Prt(mu,nu);
repeat id Prt(?a)*Prat(mu?,nu?)=Prt(?a,mu,nu);
*print[] +s ;
B Prt;
.sort
Keep Brackets;

*assemble and sub in the projectors
#call PrtCanonicalize
.sort
id ext(?a)=ext(?a)*replace_(Dt,D-nargs_(?a));

#endprocedure