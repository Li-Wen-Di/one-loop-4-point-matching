#procedure PrtCanonicalize
**---------------------------------
** This procedure standardizes the projectors (in contracted form) so that they can be substituted from the projector tables.
** Projectors are substituted from the cached tables unless the relevant projector hasn't been cached. 
**---------------------------------

id Prt(?a)=FF4(?a)*FF5(?a)*FF7(?a);
*repeat id FF4(?b,p1?pmom[c],?a)=FF4(?b,c,?a);

*print[] +s;
*B Prt,FF4,FF5;
*.end

if (match(FF5(?a)));
	repeat id FF5(?a,p1?!{Q},?c,p1?!{Q},?b)=FF5(?a,p1,?c,?b);
	#do i=1,3
    	id FF5(p1?,...,p`i'?)=FF5(p1,...,p`i',Q);
	#enddo
	id FF5(?a$y)=FF5(?a)*FF6(?a);
	$z=nargs_($y);
	do $x=1,$z;
		repeat id FF6(p?,?a)*FF4(?b,p?,?d)=FF6(p,?a)*FF4(?b,$x,?d);
		id once FF6(p?,?a)=FF6(?a);
	enddo;
	id FF6()=1;
	id FF4(?a)*FF5(?b)=Prt(?a,?b);
endif;


B Prt,FF7;
.sort
keep brackets;* this is important for id p1?.p2?=dt(p1,p2); below!

#do i=2,20,2
	id Prt(c1?,...,c`i'?,p1?,...,p4?)=Prt`i'(c1,...,c`i',p1,...,p4);
	id Prt`i'(?a)*FF7(?b)=PrtExplicit`i'(`i',?b,(4-Dt)/2);
	id Prt(c1?,...,c`i'?,p1?,...,p5?,?a)*FF7(?b)=PrtExplicit`i'(`i',?b,(4-Dt)/2);
#enddo
id FF7(?a)=1;
id p1?.p2?=dt(p1,p2);
.sort


*this evaluates the contracted projectors brute force contractions if not cached:
*B Prt,FF7;
*ModuleOption,local,$x,$y,$z;
*.sort
*keep brackets;
*if (match(FF7(?a)));
*	id Prt(?a)=1;	
*	id FF7(?a)=Prt(?a,(4-Dt)/2);
*	#do ii = 2,`MaxN',2
*		id Prt(mu1?,...,mu`ii'?,ep?)=PrtExplicit`ii'(`ii',mu1,...,mu`ii',ep);
*	#enddo
*
**	#include projectors/projectors_2_16.frm
**	#if `MaxN'>16
**		#include projectors/projectors_18_20.frm
**	#endif	
*	id p1?.p2?=dt(p1,p2);
*endif;
*.sort




*hack
*print +s;
*.end
*hack

*print +s;
*B Prt;
*.end
#endprocedure