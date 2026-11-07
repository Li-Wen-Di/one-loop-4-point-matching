Table Htable3(0:3,0:3,p1?,p2?,p3?);

Fill Htable3(0,0) = p1.p1*p2.p2*p3.p3 - p1.p1*p2.p3^2 + 2*p1.p2*p1.p3*p2.p3 - 
      p1.p2^2*p3.p3 - p1.p3^2*p2.p2;

Fill Htable3(1,1) = invDelta3*p2.p2*p3.p3 - invDelta3*p2.p3^2;

Fill Htable3(1,2) =  - invDelta3*p1.p2*p3.p3 + invDelta3*p1.p3*p2.p3;

Fill Htable3(1,3) = invDelta3*p1.p2*p2.p3 - invDelta3*p1.p3*p2.p2;

Fill Htable3(2,1) =  - invDelta3*p1.p2*p3.p3 + invDelta3*p1.p3*p2.p3;

Fill Htable3(2,2) = invDelta3*p1.p1*p3.p3 - invDelta3*p1.p3^2;

Fill Htable3(2,3) =  - invDelta3*p1.p1*p2.p3 + invDelta3*p1.p2*p1.p3;

Fill Htable3(3,1) = invDelta3*p1.p2*p2.p3 - invDelta3*p1.p3*p2.p2;

Fill Htable3(3,2) =  - invDelta3*p1.p1*p2.p3 + invDelta3*p1.p2*p1.p3;

Fill Htable3(3,3) = invDelta3*p1.p1*p2.p2 - invDelta3*p1.p2^2;

