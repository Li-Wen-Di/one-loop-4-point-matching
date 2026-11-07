Table Htable4(0:4,0:4,p1?,p2?,p3?,p4?);

Fill Htable4(0,0) = p1.p1*p2.p2*p3.p3*p4.p4 - p1.p1*p2.p2*p3.p4^2 + 2*p1.p1*
      p2.p3*p2.p4*p3.p4 - p1.p1*p2.p3^2*p4.p4 - p1.p1*p2.p4^2*p3.p3 + 2*p1.p2*
      p1.p3*p2.p3*p4.p4 - 2*p1.p2*p1.p3*p2.p4*p3.p4 - 2*p1.p2*p1.p4*p2.p3*
      p3.p4 + 2*p1.p2*p1.p4*p2.p4*p3.p3 - p1.p2^2*p3.p3*p4.p4 + p1.p2^2*
      p3.p4^2 + 2*p1.p3*p1.p4*p2.p2*p3.p4 - 2*p1.p3*p1.p4*p2.p3*p2.p4 - 
      p1.p3^2*p2.p2*p4.p4 + p1.p3^2*p2.p4^2 - p1.p4^2*p2.p2*p3.p3 + p1.p4^2*
      p2.p3^2;

Fill Htable4(1,1) = invDelta4*p2.p2*p3.p3*p4.p4 - invDelta4*p2.p2*p3.p4^2 + 2*
      invDelta4*p2.p3*p2.p4*p3.p4 - invDelta4*p2.p3^2*p4.p4 - invDelta4*
      p2.p4^2*p3.p3;

Fill Htable4(1,2) =  - invDelta4*p1.p2*p3.p3*p4.p4 + invDelta4*p1.p2*p3.p4^2
       + invDelta4*p1.p3*p2.p3*p4.p4 - invDelta4*p1.p3*p2.p4*p3.p4 - invDelta4
      *p1.p4*p2.p3*p3.p4 + invDelta4*p1.p4*p2.p4*p3.p3;

Fill Htable4(1,3) = invDelta4*p1.p2*p2.p3*p4.p4 - invDelta4*p1.p2*p2.p4*p3.p4
       - invDelta4*p1.p3*p2.p2*p4.p4 + invDelta4*p1.p3*p2.p4^2 + invDelta4*
      p1.p4*p2.p2*p3.p4 - invDelta4*p1.p4*p2.p3*p2.p4;

Fill Htable4(1,4) =  - invDelta4*p1.p2*p2.p3*p3.p4 + invDelta4*p1.p2*p2.p4*
      p3.p3 + invDelta4*p1.p3*p2.p2*p3.p4 - invDelta4*p1.p3*p2.p3*p2.p4 - 
      invDelta4*p1.p4*p2.p2*p3.p3 + invDelta4*p1.p4*p2.p3^2;

Fill Htable4(2,1) =  - invDelta4*p1.p2*p3.p3*p4.p4 + invDelta4*p1.p2*p3.p4^2
       + invDelta4*p1.p3*p2.p3*p4.p4 - invDelta4*p1.p3*p2.p4*p3.p4 - invDelta4
      *p1.p4*p2.p3*p3.p4 + invDelta4*p1.p4*p2.p4*p3.p3;

Fill Htable4(2,2) = invDelta4*p1.p1*p3.p3*p4.p4 - invDelta4*p1.p1*p3.p4^2 + 2*
      invDelta4*p1.p3*p1.p4*p3.p4 - invDelta4*p1.p3^2*p4.p4 - invDelta4*
      p1.p4^2*p3.p3;

Fill Htable4(2,3) =  - invDelta4*p1.p1*p2.p3*p4.p4 + invDelta4*p1.p1*p2.p4*
      p3.p4 + invDelta4*p1.p2*p1.p3*p4.p4 - invDelta4*p1.p2*p1.p4*p3.p4 - 
      invDelta4*p1.p3*p1.p4*p2.p4 + invDelta4*p1.p4^2*p2.p3;

Fill Htable4(2,4) = invDelta4*p1.p1*p2.p3*p3.p4 - invDelta4*p1.p1*p2.p4*p3.p3
       - invDelta4*p1.p2*p1.p3*p3.p4 + invDelta4*p1.p2*p1.p4*p3.p3 - invDelta4
      *p1.p3*p1.p4*p2.p3 + invDelta4*p1.p3^2*p2.p4;

Fill Htable4(3,1) = invDelta4*p1.p2*p2.p3*p4.p4 - invDelta4*p1.p2*p2.p4*p3.p4
       - invDelta4*p1.p3*p2.p2*p4.p4 + invDelta4*p1.p3*p2.p4^2 + invDelta4*
      p1.p4*p2.p2*p3.p4 - invDelta4*p1.p4*p2.p3*p2.p4;

Fill Htable4(3,2) =  - invDelta4*p1.p1*p2.p3*p4.p4 + invDelta4*p1.p1*p2.p4*
      p3.p4 + invDelta4*p1.p2*p1.p3*p4.p4 - invDelta4*p1.p2*p1.p4*p3.p4 - 
      invDelta4*p1.p3*p1.p4*p2.p4 + invDelta4*p1.p4^2*p2.p3;

Fill Htable4(3,3) = invDelta4*p1.p1*p2.p2*p4.p4 - invDelta4*p1.p1*p2.p4^2 + 2*
      invDelta4*p1.p2*p1.p4*p2.p4 - invDelta4*p1.p2^2*p4.p4 - invDelta4*
      p1.p4^2*p2.p2;

Fill Htable4(3,4) =  - invDelta4*p1.p1*p2.p2*p3.p4 + invDelta4*p1.p1*p2.p3*
      p2.p4 - invDelta4*p1.p2*p1.p3*p2.p4 - invDelta4*p1.p2*p1.p4*p2.p3 + 
      invDelta4*p1.p2^2*p3.p4 + invDelta4*p1.p3*p1.p4*p2.p2;

Fill Htable4(4,1) =  - invDelta4*p1.p2*p2.p3*p3.p4 + invDelta4*p1.p2*p2.p4*
      p3.p3 + invDelta4*p1.p3*p2.p2*p3.p4 - invDelta4*p1.p3*p2.p3*p2.p4 - 
      invDelta4*p1.p4*p2.p2*p3.p3 + invDelta4*p1.p4*p2.p3^2;

Fill Htable4(4,2) = invDelta4*p1.p1*p2.p3*p3.p4 - invDelta4*p1.p1*p2.p4*p3.p3
       - invDelta4*p1.p2*p1.p3*p3.p4 + invDelta4*p1.p2*p1.p4*p3.p3 - invDelta4
      *p1.p3*p1.p4*p2.p3 + invDelta4*p1.p3^2*p2.p4;

Fill Htable4(4,3) =  - invDelta4*p1.p1*p2.p2*p3.p4 + invDelta4*p1.p1*p2.p3*
      p2.p4 - invDelta4*p1.p2*p1.p3*p2.p4 - invDelta4*p1.p2*p1.p4*p2.p3 + 
      invDelta4*p1.p2^2*p3.p4 + invDelta4*p1.p3*p1.p4*p2.p2;

Fill Htable4(4,4) = invDelta4*p1.p1*p2.p2*p3.p3 - invDelta4*p1.p1*p2.p3^2 + 2*
      invDelta4*p1.p2*p1.p3*p2.p3 - invDelta4*p1.p2^2*p3.p3 - invDelta4*
      p1.p3^2*p2.p2;

