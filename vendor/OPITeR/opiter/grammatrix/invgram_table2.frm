Table Htable2(0:2,0:2,p1?,p2?);

Fill Htable2(0,0) = p1.p1*p2.p2 - p1.p2^2;

Fill Htable2(1,1) = invDelta2*p2.p2;

Fill Htable2(1,2) =  - invDelta2*p1.p2;

Fill Htable2(2,1) =  - invDelta2*p1.p2;

Fill Htable2(2,2) = invDelta2*p1.p1;

