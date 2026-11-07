Table Htable5(0:5,0:5,p1?,p2?,p3?,p4?,p5?);

Fill Htable5(0,0) = p1.p1*p2.p2*p3.p3*p4.p4*p5.p5 - p1.p1*p2.p2*p3.p3*p4.p5^2
       + 2*p1.p1*p2.p2*p3.p4*p3.p5*p4.p5 - p1.p1*p2.p2*p3.p4^2*p5.p5 - p1.p1*
      p2.p2*p3.p5^2*p4.p4 + 2*p1.p1*p2.p3*p2.p4*p3.p4*p5.p5 - 2*p1.p1*p2.p3*
      p2.p4*p3.p5*p4.p5 - 2*p1.p1*p2.p3*p2.p5*p3.p4*p4.p5 + 2*p1.p1*p2.p3*
      p2.p5*p3.p5*p4.p4 - p1.p1*p2.p3^2*p4.p4*p5.p5 + p1.p1*p2.p3^2*p4.p5^2 + 
      2*p1.p1*p2.p4*p2.p5*p3.p3*p4.p5 - 2*p1.p1*p2.p4*p2.p5*p3.p4*p3.p5 - 
      p1.p1*p2.p4^2*p3.p3*p5.p5 + p1.p1*p2.p4^2*p3.p5^2 - p1.p1*p2.p5^2*p3.p3*
      p4.p4 + p1.p1*p2.p5^2*p3.p4^2 + 2*p1.p2*p1.p3*p2.p3*p4.p4*p5.p5 - 2*
      p1.p2*p1.p3*p2.p3*p4.p5^2 - 2*p1.p2*p1.p3*p2.p4*p3.p4*p5.p5 + 2*p1.p2*
      p1.p3*p2.p4*p3.p5*p4.p5 + 2*p1.p2*p1.p3*p2.p5*p3.p4*p4.p5 - 2*p1.p2*
      p1.p3*p2.p5*p3.p5*p4.p4 - 2*p1.p2*p1.p4*p2.p3*p3.p4*p5.p5 + 2*p1.p2*
      p1.p4*p2.p3*p3.p5*p4.p5 + 2*p1.p2*p1.p4*p2.p4*p3.p3*p5.p5 - 2*p1.p2*
      p1.p4*p2.p4*p3.p5^2 - 2*p1.p2*p1.p4*p2.p5*p3.p3*p4.p5 + 2*p1.p2*p1.p4*
      p2.p5*p3.p4*p3.p5 + 2*p1.p2*p1.p5*p2.p3*p3.p4*p4.p5 - 2*p1.p2*p1.p5*
      p2.p3*p3.p5*p4.p4 - 2*p1.p2*p1.p5*p2.p4*p3.p3*p4.p5 + 2*p1.p2*p1.p5*
      p2.p4*p3.p4*p3.p5 + 2*p1.p2*p1.p5*p2.p5*p3.p3*p4.p4 - 2*p1.p2*p1.p5*
      p2.p5*p3.p4^2 - p1.p2^2*p3.p3*p4.p4*p5.p5 + p1.p2^2*p3.p3*p4.p5^2 - 2*
      p1.p2^2*p3.p4*p3.p5*p4.p5 + p1.p2^2*p3.p4^2*p5.p5 + p1.p2^2*p3.p5^2*
      p4.p4 + 2*p1.p3*p1.p4*p2.p2*p3.p4*p5.p5 - 2*p1.p3*p1.p4*p2.p2*p3.p5*
      p4.p5 - 2*p1.p3*p1.p4*p2.p3*p2.p4*p5.p5 + 2*p1.p3*p1.p4*p2.p3*p2.p5*
      p4.p5 + 2*p1.p3*p1.p4*p2.p4*p2.p5*p3.p5 - 2*p1.p3*p1.p4*p2.p5^2*p3.p4 - 
      2*p1.p3*p1.p5*p2.p2*p3.p4*p4.p5 + 2*p1.p3*p1.p5*p2.p2*p3.p5*p4.p4 + 2*
      p1.p3*p1.p5*p2.p3*p2.p4*p4.p5 - 2*p1.p3*p1.p5*p2.p3*p2.p5*p4.p4 + 2*
      p1.p3*p1.p5*p2.p4*p2.p5*p3.p4 - 2*p1.p3*p1.p5*p2.p4^2*p3.p5 - p1.p3^2*
      p2.p2*p4.p4*p5.p5 + p1.p3^2*p2.p2*p4.p5^2 - 2*p1.p3^2*p2.p4*p2.p5*p4.p5
       + p1.p3^2*p2.p4^2*p5.p5 + p1.p3^2*p2.p5^2*p4.p4 + 2*p1.p4*p1.p5*p2.p2*
      p3.p3*p4.p5 - 2*p1.p4*p1.p5*p2.p2*p3.p4*p3.p5 + 2*p1.p4*p1.p5*p2.p3*
      p2.p4*p3.p5 + 2*p1.p4*p1.p5*p2.p3*p2.p5*p3.p4 - 2*p1.p4*p1.p5*p2.p3^2*
      p4.p5 - 2*p1.p4*p1.p5*p2.p4*p2.p5*p3.p3 - p1.p4^2*p2.p2*p3.p3*p5.p5 + 
      p1.p4^2*p2.p2*p3.p5^2 - 2*p1.p4^2*p2.p3*p2.p5*p3.p5 + p1.p4^2*p2.p3^2*
      p5.p5 + p1.p4^2*p2.p5^2*p3.p3 - p1.p5^2*p2.p2*p3.p3*p4.p4 + p1.p5^2*
      p2.p2*p3.p4^2 - 2*p1.p5^2*p2.p3*p2.p4*p3.p4 + p1.p5^2*p2.p3^2*p4.p4 + 
      p1.p5^2*p2.p4^2*p3.p3;

Fill Htable5(1,1) = invDelta5*p2.p2*p3.p3*p4.p4*p5.p5 - invDelta5*p2.p2*p3.p3*
      p4.p5^2 + 2*invDelta5*p2.p2*p3.p4*p3.p5*p4.p5 - invDelta5*p2.p2*p3.p4^2*
      p5.p5 - invDelta5*p2.p2*p3.p5^2*p4.p4 + 2*invDelta5*p2.p3*p2.p4*p3.p4*
      p5.p5 - 2*invDelta5*p2.p3*p2.p4*p3.p5*p4.p5 - 2*invDelta5*p2.p3*p2.p5*
      p3.p4*p4.p5 + 2*invDelta5*p2.p3*p2.p5*p3.p5*p4.p4 - invDelta5*p2.p3^2*
      p4.p4*p5.p5 + invDelta5*p2.p3^2*p4.p5^2 + 2*invDelta5*p2.p4*p2.p5*p3.p3*
      p4.p5 - 2*invDelta5*p2.p4*p2.p5*p3.p4*p3.p5 - invDelta5*p2.p4^2*p3.p3*
      p5.p5 + invDelta5*p2.p4^2*p3.p5^2 - invDelta5*p2.p5^2*p3.p3*p4.p4 + 
      invDelta5*p2.p5^2*p3.p4^2;

Fill Htable5(1,2) =  - invDelta5*p1.p2*p3.p3*p4.p4*p5.p5 + invDelta5*p1.p2*
      p3.p3*p4.p5^2 - 2*invDelta5*p1.p2*p3.p4*p3.p5*p4.p5 + invDelta5*p1.p2*
      p3.p4^2*p5.p5 + invDelta5*p1.p2*p3.p5^2*p4.p4 + invDelta5*p1.p3*p2.p3*
      p4.p4*p5.p5 - invDelta5*p1.p3*p2.p3*p4.p5^2 - invDelta5*p1.p3*p2.p4*
      p3.p4*p5.p5 + invDelta5*p1.p3*p2.p4*p3.p5*p4.p5 + invDelta5*p1.p3*p2.p5*
      p3.p4*p4.p5 - invDelta5*p1.p3*p2.p5*p3.p5*p4.p4 - invDelta5*p1.p4*p2.p3*
      p3.p4*p5.p5 + invDelta5*p1.p4*p2.p3*p3.p5*p4.p5 + invDelta5*p1.p4*p2.p4*
      p3.p3*p5.p5 - invDelta5*p1.p4*p2.p4*p3.p5^2 - invDelta5*p1.p4*p2.p5*
      p3.p3*p4.p5 + invDelta5*p1.p4*p2.p5*p3.p4*p3.p5 + invDelta5*p1.p5*p2.p3*
      p3.p4*p4.p5 - invDelta5*p1.p5*p2.p3*p3.p5*p4.p4 - invDelta5*p1.p5*p2.p4*
      p3.p3*p4.p5 + invDelta5*p1.p5*p2.p4*p3.p4*p3.p5 + invDelta5*p1.p5*p2.p5*
      p3.p3*p4.p4 - invDelta5*p1.p5*p2.p5*p3.p4^2;

Fill Htable5(1,3) = invDelta5*p1.p2*p2.p3*p4.p4*p5.p5 - invDelta5*p1.p2*p2.p3*
      p4.p5^2 - invDelta5*p1.p2*p2.p4*p3.p4*p5.p5 + invDelta5*p1.p2*p2.p4*
      p3.p5*p4.p5 + invDelta5*p1.p2*p2.p5*p3.p4*p4.p5 - invDelta5*p1.p2*p2.p5*
      p3.p5*p4.p4 - invDelta5*p1.p3*p2.p2*p4.p4*p5.p5 + invDelta5*p1.p3*p2.p2*
      p4.p5^2 - 2*invDelta5*p1.p3*p2.p4*p2.p5*p4.p5 + invDelta5*p1.p3*p2.p4^2*
      p5.p5 + invDelta5*p1.p3*p2.p5^2*p4.p4 + invDelta5*p1.p4*p2.p2*p3.p4*
      p5.p5 - invDelta5*p1.p4*p2.p2*p3.p5*p4.p5 - invDelta5*p1.p4*p2.p3*p2.p4*
      p5.p5 + invDelta5*p1.p4*p2.p3*p2.p5*p4.p5 + invDelta5*p1.p4*p2.p4*p2.p5*
      p3.p5 - invDelta5*p1.p4*p2.p5^2*p3.p4 - invDelta5*p1.p5*p2.p2*p3.p4*
      p4.p5 + invDelta5*p1.p5*p2.p2*p3.p5*p4.p4 + invDelta5*p1.p5*p2.p3*p2.p4*
      p4.p5 - invDelta5*p1.p5*p2.p3*p2.p5*p4.p4 + invDelta5*p1.p5*p2.p4*p2.p5*
      p3.p4 - invDelta5*p1.p5*p2.p4^2*p3.p5;

Fill Htable5(1,4) =  - invDelta5*p1.p2*p2.p3*p3.p4*p5.p5 + invDelta5*p1.p2*
      p2.p3*p3.p5*p4.p5 + invDelta5*p1.p2*p2.p4*p3.p3*p5.p5 - invDelta5*p1.p2*
      p2.p4*p3.p5^2 - invDelta5*p1.p2*p2.p5*p3.p3*p4.p5 + invDelta5*p1.p2*
      p2.p5*p3.p4*p3.p5 + invDelta5*p1.p3*p2.p2*p3.p4*p5.p5 - invDelta5*p1.p3*
      p2.p2*p3.p5*p4.p5 - invDelta5*p1.p3*p2.p3*p2.p4*p5.p5 + invDelta5*p1.p3*
      p2.p3*p2.p5*p4.p5 + invDelta5*p1.p3*p2.p4*p2.p5*p3.p5 - invDelta5*p1.p3*
      p2.p5^2*p3.p4 - invDelta5*p1.p4*p2.p2*p3.p3*p5.p5 + invDelta5*p1.p4*
      p2.p2*p3.p5^2 - 2*invDelta5*p1.p4*p2.p3*p2.p5*p3.p5 + invDelta5*p1.p4*
      p2.p3^2*p5.p5 + invDelta5*p1.p4*p2.p5^2*p3.p3 + invDelta5*p1.p5*p2.p2*
      p3.p3*p4.p5 - invDelta5*p1.p5*p2.p2*p3.p4*p3.p5 + invDelta5*p1.p5*p2.p3*
      p2.p4*p3.p5 + invDelta5*p1.p5*p2.p3*p2.p5*p3.p4 - invDelta5*p1.p5*
      p2.p3^2*p4.p5 - invDelta5*p1.p5*p2.p4*p2.p5*p3.p3;

Fill Htable5(1,5) = invDelta5*p1.p2*p2.p3*p3.p4*p4.p5 - invDelta5*p1.p2*p2.p3*
      p3.p5*p4.p4 - invDelta5*p1.p2*p2.p4*p3.p3*p4.p5 + invDelta5*p1.p2*p2.p4*
      p3.p4*p3.p5 + invDelta5*p1.p2*p2.p5*p3.p3*p4.p4 - invDelta5*p1.p2*p2.p5*
      p3.p4^2 - invDelta5*p1.p3*p2.p2*p3.p4*p4.p5 + invDelta5*p1.p3*p2.p2*
      p3.p5*p4.p4 + invDelta5*p1.p3*p2.p3*p2.p4*p4.p5 - invDelta5*p1.p3*p2.p3*
      p2.p5*p4.p4 + invDelta5*p1.p3*p2.p4*p2.p5*p3.p4 - invDelta5*p1.p3*
      p2.p4^2*p3.p5 + invDelta5*p1.p4*p2.p2*p3.p3*p4.p5 - invDelta5*p1.p4*
      p2.p2*p3.p4*p3.p5 + invDelta5*p1.p4*p2.p3*p2.p4*p3.p5 + invDelta5*p1.p4*
      p2.p3*p2.p5*p3.p4 - invDelta5*p1.p4*p2.p3^2*p4.p5 - invDelta5*p1.p4*
      p2.p4*p2.p5*p3.p3 - invDelta5*p1.p5*p2.p2*p3.p3*p4.p4 + invDelta5*p1.p5*
      p2.p2*p3.p4^2 - 2*invDelta5*p1.p5*p2.p3*p2.p4*p3.p4 + invDelta5*p1.p5*
      p2.p3^2*p4.p4 + invDelta5*p1.p5*p2.p4^2*p3.p3;

Fill Htable5(2,1) =  - invDelta5*p1.p2*p3.p3*p4.p4*p5.p5 + invDelta5*p1.p2*
      p3.p3*p4.p5^2 - 2*invDelta5*p1.p2*p3.p4*p3.p5*p4.p5 + invDelta5*p1.p2*
      p3.p4^2*p5.p5 + invDelta5*p1.p2*p3.p5^2*p4.p4 + invDelta5*p1.p3*p2.p3*
      p4.p4*p5.p5 - invDelta5*p1.p3*p2.p3*p4.p5^2 - invDelta5*p1.p3*p2.p4*
      p3.p4*p5.p5 + invDelta5*p1.p3*p2.p4*p3.p5*p4.p5 + invDelta5*p1.p3*p2.p5*
      p3.p4*p4.p5 - invDelta5*p1.p3*p2.p5*p3.p5*p4.p4 - invDelta5*p1.p4*p2.p3*
      p3.p4*p5.p5 + invDelta5*p1.p4*p2.p3*p3.p5*p4.p5 + invDelta5*p1.p4*p2.p4*
      p3.p3*p5.p5 - invDelta5*p1.p4*p2.p4*p3.p5^2 - invDelta5*p1.p4*p2.p5*
      p3.p3*p4.p5 + invDelta5*p1.p4*p2.p5*p3.p4*p3.p5 + invDelta5*p1.p5*p2.p3*
      p3.p4*p4.p5 - invDelta5*p1.p5*p2.p3*p3.p5*p4.p4 - invDelta5*p1.p5*p2.p4*
      p3.p3*p4.p5 + invDelta5*p1.p5*p2.p4*p3.p4*p3.p5 + invDelta5*p1.p5*p2.p5*
      p3.p3*p4.p4 - invDelta5*p1.p5*p2.p5*p3.p4^2;

Fill Htable5(2,2) = invDelta5*p1.p1*p3.p3*p4.p4*p5.p5 - invDelta5*p1.p1*p3.p3*
      p4.p5^2 + 2*invDelta5*p1.p1*p3.p4*p3.p5*p4.p5 - invDelta5*p1.p1*p3.p4^2*
      p5.p5 - invDelta5*p1.p1*p3.p5^2*p4.p4 + 2*invDelta5*p1.p3*p1.p4*p3.p4*
      p5.p5 - 2*invDelta5*p1.p3*p1.p4*p3.p5*p4.p5 - 2*invDelta5*p1.p3*p1.p5*
      p3.p4*p4.p5 + 2*invDelta5*p1.p3*p1.p5*p3.p5*p4.p4 - invDelta5*p1.p3^2*
      p4.p4*p5.p5 + invDelta5*p1.p3^2*p4.p5^2 + 2*invDelta5*p1.p4*p1.p5*p3.p3*
      p4.p5 - 2*invDelta5*p1.p4*p1.p5*p3.p4*p3.p5 - invDelta5*p1.p4^2*p3.p3*
      p5.p5 + invDelta5*p1.p4^2*p3.p5^2 - invDelta5*p1.p5^2*p3.p3*p4.p4 + 
      invDelta5*p1.p5^2*p3.p4^2;

Fill Htable5(2,3) =  - invDelta5*p1.p1*p2.p3*p4.p4*p5.p5 + invDelta5*p1.p1*
      p2.p3*p4.p5^2 + invDelta5*p1.p1*p2.p4*p3.p4*p5.p5 - invDelta5*p1.p1*
      p2.p4*p3.p5*p4.p5 - invDelta5*p1.p1*p2.p5*p3.p4*p4.p5 + invDelta5*p1.p1*
      p2.p5*p3.p5*p4.p4 + invDelta5*p1.p2*p1.p3*p4.p4*p5.p5 - invDelta5*p1.p2*
      p1.p3*p4.p5^2 - invDelta5*p1.p2*p1.p4*p3.p4*p5.p5 + invDelta5*p1.p2*
      p1.p4*p3.p5*p4.p5 + invDelta5*p1.p2*p1.p5*p3.p4*p4.p5 - invDelta5*p1.p2*
      p1.p5*p3.p5*p4.p4 - invDelta5*p1.p3*p1.p4*p2.p4*p5.p5 + invDelta5*p1.p3*
      p1.p4*p2.p5*p4.p5 + invDelta5*p1.p3*p1.p5*p2.p4*p4.p5 - invDelta5*p1.p3*
      p1.p5*p2.p5*p4.p4 - 2*invDelta5*p1.p4*p1.p5*p2.p3*p4.p5 + invDelta5*
      p1.p4*p1.p5*p2.p4*p3.p5 + invDelta5*p1.p4*p1.p5*p2.p5*p3.p4 + invDelta5*
      p1.p4^2*p2.p3*p5.p5 - invDelta5*p1.p4^2*p2.p5*p3.p5 + invDelta5*p1.p5^2*
      p2.p3*p4.p4 - invDelta5*p1.p5^2*p2.p4*p3.p4;

Fill Htable5(2,4) = invDelta5*p1.p1*p2.p3*p3.p4*p5.p5 - invDelta5*p1.p1*p2.p3*
      p3.p5*p4.p5 - invDelta5*p1.p1*p2.p4*p3.p3*p5.p5 + invDelta5*p1.p1*p2.p4*
      p3.p5^2 + invDelta5*p1.p1*p2.p5*p3.p3*p4.p5 - invDelta5*p1.p1*p2.p5*
      p3.p4*p3.p5 - invDelta5*p1.p2*p1.p3*p3.p4*p5.p5 + invDelta5*p1.p2*p1.p3*
      p3.p5*p4.p5 + invDelta5*p1.p2*p1.p4*p3.p3*p5.p5 - invDelta5*p1.p2*p1.p4*
      p3.p5^2 - invDelta5*p1.p2*p1.p5*p3.p3*p4.p5 + invDelta5*p1.p2*p1.p5*
      p3.p4*p3.p5 - invDelta5*p1.p3*p1.p4*p2.p3*p5.p5 + invDelta5*p1.p3*p1.p4*
      p2.p5*p3.p5 + invDelta5*p1.p3*p1.p5*p2.p3*p4.p5 - 2*invDelta5*p1.p3*
      p1.p5*p2.p4*p3.p5 + invDelta5*p1.p3*p1.p5*p2.p5*p3.p4 + invDelta5*
      p1.p3^2*p2.p4*p5.p5 - invDelta5*p1.p3^2*p2.p5*p4.p5 + invDelta5*p1.p4*
      p1.p5*p2.p3*p3.p5 - invDelta5*p1.p4*p1.p5*p2.p5*p3.p3 - invDelta5*
      p1.p5^2*p2.p3*p3.p4 + invDelta5*p1.p5^2*p2.p4*p3.p3;

Fill Htable5(2,5) =  - invDelta5*p1.p1*p2.p3*p3.p4*p4.p5 + invDelta5*p1.p1*
      p2.p3*p3.p5*p4.p4 + invDelta5*p1.p1*p2.p4*p3.p3*p4.p5 - invDelta5*p1.p1*
      p2.p4*p3.p4*p3.p5 - invDelta5*p1.p1*p2.p5*p3.p3*p4.p4 + invDelta5*p1.p1*
      p2.p5*p3.p4^2 + invDelta5*p1.p2*p1.p3*p3.p4*p4.p5 - invDelta5*p1.p2*
      p1.p3*p3.p5*p4.p4 - invDelta5*p1.p2*p1.p4*p3.p3*p4.p5 + invDelta5*p1.p2*
      p1.p4*p3.p4*p3.p5 + invDelta5*p1.p2*p1.p5*p3.p3*p4.p4 - invDelta5*p1.p2*
      p1.p5*p3.p4^2 + invDelta5*p1.p3*p1.p4*p2.p3*p4.p5 + invDelta5*p1.p3*
      p1.p4*p2.p4*p3.p5 - 2*invDelta5*p1.p3*p1.p4*p2.p5*p3.p4 - invDelta5*
      p1.p3*p1.p5*p2.p3*p4.p4 + invDelta5*p1.p3*p1.p5*p2.p4*p3.p4 - invDelta5*
      p1.p3^2*p2.p4*p4.p5 + invDelta5*p1.p3^2*p2.p5*p4.p4 + invDelta5*p1.p4*
      p1.p5*p2.p3*p3.p4 - invDelta5*p1.p4*p1.p5*p2.p4*p3.p3 - invDelta5*
      p1.p4^2*p2.p3*p3.p5 + invDelta5*p1.p4^2*p2.p5*p3.p3;

Fill Htable5(3,1) = invDelta5*p1.p2*p2.p3*p4.p4*p5.p5 - invDelta5*p1.p2*p2.p3*
      p4.p5^2 - invDelta5*p1.p2*p2.p4*p3.p4*p5.p5 + invDelta5*p1.p2*p2.p4*
      p3.p5*p4.p5 + invDelta5*p1.p2*p2.p5*p3.p4*p4.p5 - invDelta5*p1.p2*p2.p5*
      p3.p5*p4.p4 - invDelta5*p1.p3*p2.p2*p4.p4*p5.p5 + invDelta5*p1.p3*p2.p2*
      p4.p5^2 - 2*invDelta5*p1.p3*p2.p4*p2.p5*p4.p5 + invDelta5*p1.p3*p2.p4^2*
      p5.p5 + invDelta5*p1.p3*p2.p5^2*p4.p4 + invDelta5*p1.p4*p2.p2*p3.p4*
      p5.p5 - invDelta5*p1.p4*p2.p2*p3.p5*p4.p5 - invDelta5*p1.p4*p2.p3*p2.p4*
      p5.p5 + invDelta5*p1.p4*p2.p3*p2.p5*p4.p5 + invDelta5*p1.p4*p2.p4*p2.p5*
      p3.p5 - invDelta5*p1.p4*p2.p5^2*p3.p4 - invDelta5*p1.p5*p2.p2*p3.p4*
      p4.p5 + invDelta5*p1.p5*p2.p2*p3.p5*p4.p4 + invDelta5*p1.p5*p2.p3*p2.p4*
      p4.p5 - invDelta5*p1.p5*p2.p3*p2.p5*p4.p4 + invDelta5*p1.p5*p2.p4*p2.p5*
      p3.p4 - invDelta5*p1.p5*p2.p4^2*p3.p5;

Fill Htable5(3,2) =  - invDelta5*p1.p1*p2.p3*p4.p4*p5.p5 + invDelta5*p1.p1*
      p2.p3*p4.p5^2 + invDelta5*p1.p1*p2.p4*p3.p4*p5.p5 - invDelta5*p1.p1*
      p2.p4*p3.p5*p4.p5 - invDelta5*p1.p1*p2.p5*p3.p4*p4.p5 + invDelta5*p1.p1*
      p2.p5*p3.p5*p4.p4 + invDelta5*p1.p2*p1.p3*p4.p4*p5.p5 - invDelta5*p1.p2*
      p1.p3*p4.p5^2 - invDelta5*p1.p2*p1.p4*p3.p4*p5.p5 + invDelta5*p1.p2*
      p1.p4*p3.p5*p4.p5 + invDelta5*p1.p2*p1.p5*p3.p4*p4.p5 - invDelta5*p1.p2*
      p1.p5*p3.p5*p4.p4 - invDelta5*p1.p3*p1.p4*p2.p4*p5.p5 + invDelta5*p1.p3*
      p1.p4*p2.p5*p4.p5 + invDelta5*p1.p3*p1.p5*p2.p4*p4.p5 - invDelta5*p1.p3*
      p1.p5*p2.p5*p4.p4 - 2*invDelta5*p1.p4*p1.p5*p2.p3*p4.p5 + invDelta5*
      p1.p4*p1.p5*p2.p4*p3.p5 + invDelta5*p1.p4*p1.p5*p2.p5*p3.p4 + invDelta5*
      p1.p4^2*p2.p3*p5.p5 - invDelta5*p1.p4^2*p2.p5*p3.p5 + invDelta5*p1.p5^2*
      p2.p3*p4.p4 - invDelta5*p1.p5^2*p2.p4*p3.p4;

Fill Htable5(3,3) = invDelta5*p1.p1*p2.p2*p4.p4*p5.p5 - invDelta5*p1.p1*p2.p2*
      p4.p5^2 + 2*invDelta5*p1.p1*p2.p4*p2.p5*p4.p5 - invDelta5*p1.p1*p2.p4^2*
      p5.p5 - invDelta5*p1.p1*p2.p5^2*p4.p4 + 2*invDelta5*p1.p2*p1.p4*p2.p4*
      p5.p5 - 2*invDelta5*p1.p2*p1.p4*p2.p5*p4.p5 - 2*invDelta5*p1.p2*p1.p5*
      p2.p4*p4.p5 + 2*invDelta5*p1.p2*p1.p5*p2.p5*p4.p4 - invDelta5*p1.p2^2*
      p4.p4*p5.p5 + invDelta5*p1.p2^2*p4.p5^2 + 2*invDelta5*p1.p4*p1.p5*p2.p2*
      p4.p5 - 2*invDelta5*p1.p4*p1.p5*p2.p4*p2.p5 - invDelta5*p1.p4^2*p2.p2*
      p5.p5 + invDelta5*p1.p4^2*p2.p5^2 - invDelta5*p1.p5^2*p2.p2*p4.p4 + 
      invDelta5*p1.p5^2*p2.p4^2;

Fill Htable5(3,4) =  - invDelta5*p1.p1*p2.p2*p3.p4*p5.p5 + invDelta5*p1.p1*
      p2.p2*p3.p5*p4.p5 + invDelta5*p1.p1*p2.p3*p2.p4*p5.p5 - invDelta5*p1.p1*
      p2.p3*p2.p5*p4.p5 - invDelta5*p1.p1*p2.p4*p2.p5*p3.p5 + invDelta5*p1.p1*
      p2.p5^2*p3.p4 - invDelta5*p1.p2*p1.p3*p2.p4*p5.p5 + invDelta5*p1.p2*
      p1.p3*p2.p5*p4.p5 - invDelta5*p1.p2*p1.p4*p2.p3*p5.p5 + invDelta5*p1.p2*
      p1.p4*p2.p5*p3.p5 + invDelta5*p1.p2*p1.p5*p2.p3*p4.p5 + invDelta5*p1.p2*
      p1.p5*p2.p4*p3.p5 - 2*invDelta5*p1.p2*p1.p5*p2.p5*p3.p4 + invDelta5*
      p1.p2^2*p3.p4*p5.p5 - invDelta5*p1.p2^2*p3.p5*p4.p5 + invDelta5*p1.p3*
      p1.p4*p2.p2*p5.p5 - invDelta5*p1.p3*p1.p4*p2.p5^2 - invDelta5*p1.p3*
      p1.p5*p2.p2*p4.p5 + invDelta5*p1.p3*p1.p5*p2.p4*p2.p5 - invDelta5*p1.p4*
      p1.p5*p2.p2*p3.p5 + invDelta5*p1.p4*p1.p5*p2.p3*p2.p5 + invDelta5*
      p1.p5^2*p2.p2*p3.p4 - invDelta5*p1.p5^2*p2.p3*p2.p4;

Fill Htable5(3,5) = invDelta5*p1.p1*p2.p2*p3.p4*p4.p5 - invDelta5*p1.p1*p2.p2*
      p3.p5*p4.p4 - invDelta5*p1.p1*p2.p3*p2.p4*p4.p5 + invDelta5*p1.p1*p2.p3*
      p2.p5*p4.p4 - invDelta5*p1.p1*p2.p4*p2.p5*p3.p4 + invDelta5*p1.p1*
      p2.p4^2*p3.p5 + invDelta5*p1.p2*p1.p3*p2.p4*p4.p5 - invDelta5*p1.p2*
      p1.p3*p2.p5*p4.p4 + invDelta5*p1.p2*p1.p4*p2.p3*p4.p5 - 2*invDelta5*
      p1.p2*p1.p4*p2.p4*p3.p5 + invDelta5*p1.p2*p1.p4*p2.p5*p3.p4 - invDelta5*
      p1.p2*p1.p5*p2.p3*p4.p4 + invDelta5*p1.p2*p1.p5*p2.p4*p3.p4 - invDelta5*
      p1.p2^2*p3.p4*p4.p5 + invDelta5*p1.p2^2*p3.p5*p4.p4 - invDelta5*p1.p3*
      p1.p4*p2.p2*p4.p5 + invDelta5*p1.p3*p1.p4*p2.p4*p2.p5 + invDelta5*p1.p3*
      p1.p5*p2.p2*p4.p4 - invDelta5*p1.p3*p1.p5*p2.p4^2 - invDelta5*p1.p4*
      p1.p5*p2.p2*p3.p4 + invDelta5*p1.p4*p1.p5*p2.p3*p2.p4 + invDelta5*
      p1.p4^2*p2.p2*p3.p5 - invDelta5*p1.p4^2*p2.p3*p2.p5;

Fill Htable5(4,1) =  - invDelta5*p1.p2*p2.p3*p3.p4*p5.p5 + invDelta5*p1.p2*
      p2.p3*p3.p5*p4.p5 + invDelta5*p1.p2*p2.p4*p3.p3*p5.p5 - invDelta5*p1.p2*
      p2.p4*p3.p5^2 - invDelta5*p1.p2*p2.p5*p3.p3*p4.p5 + invDelta5*p1.p2*
      p2.p5*p3.p4*p3.p5 + invDelta5*p1.p3*p2.p2*p3.p4*p5.p5 - invDelta5*p1.p3*
      p2.p2*p3.p5*p4.p5 - invDelta5*p1.p3*p2.p3*p2.p4*p5.p5 + invDelta5*p1.p3*
      p2.p3*p2.p5*p4.p5 + invDelta5*p1.p3*p2.p4*p2.p5*p3.p5 - invDelta5*p1.p3*
      p2.p5^2*p3.p4 - invDelta5*p1.p4*p2.p2*p3.p3*p5.p5 + invDelta5*p1.p4*
      p2.p2*p3.p5^2 - 2*invDelta5*p1.p4*p2.p3*p2.p5*p3.p5 + invDelta5*p1.p4*
      p2.p3^2*p5.p5 + invDelta5*p1.p4*p2.p5^2*p3.p3 + invDelta5*p1.p5*p2.p2*
      p3.p3*p4.p5 - invDelta5*p1.p5*p2.p2*p3.p4*p3.p5 + invDelta5*p1.p5*p2.p3*
      p2.p4*p3.p5 + invDelta5*p1.p5*p2.p3*p2.p5*p3.p4 - invDelta5*p1.p5*
      p2.p3^2*p4.p5 - invDelta5*p1.p5*p2.p4*p2.p5*p3.p3;

Fill Htable5(4,2) = invDelta5*p1.p1*p2.p3*p3.p4*p5.p5 - invDelta5*p1.p1*p2.p3*
      p3.p5*p4.p5 - invDelta5*p1.p1*p2.p4*p3.p3*p5.p5 + invDelta5*p1.p1*p2.p4*
      p3.p5^2 + invDelta5*p1.p1*p2.p5*p3.p3*p4.p5 - invDelta5*p1.p1*p2.p5*
      p3.p4*p3.p5 - invDelta5*p1.p2*p1.p3*p3.p4*p5.p5 + invDelta5*p1.p2*p1.p3*
      p3.p5*p4.p5 + invDelta5*p1.p2*p1.p4*p3.p3*p5.p5 - invDelta5*p1.p2*p1.p4*
      p3.p5^2 - invDelta5*p1.p2*p1.p5*p3.p3*p4.p5 + invDelta5*p1.p2*p1.p5*
      p3.p4*p3.p5 - invDelta5*p1.p3*p1.p4*p2.p3*p5.p5 + invDelta5*p1.p3*p1.p4*
      p2.p5*p3.p5 + invDelta5*p1.p3*p1.p5*p2.p3*p4.p5 - 2*invDelta5*p1.p3*
      p1.p5*p2.p4*p3.p5 + invDelta5*p1.p3*p1.p5*p2.p5*p3.p4 + invDelta5*
      p1.p3^2*p2.p4*p5.p5 - invDelta5*p1.p3^2*p2.p5*p4.p5 + invDelta5*p1.p4*
      p1.p5*p2.p3*p3.p5 - invDelta5*p1.p4*p1.p5*p2.p5*p3.p3 - invDelta5*
      p1.p5^2*p2.p3*p3.p4 + invDelta5*p1.p5^2*p2.p4*p3.p3;

Fill Htable5(4,3) =  - invDelta5*p1.p1*p2.p2*p3.p4*p5.p5 + invDelta5*p1.p1*
      p2.p2*p3.p5*p4.p5 + invDelta5*p1.p1*p2.p3*p2.p4*p5.p5 - invDelta5*p1.p1*
      p2.p3*p2.p5*p4.p5 - invDelta5*p1.p1*p2.p4*p2.p5*p3.p5 + invDelta5*p1.p1*
      p2.p5^2*p3.p4 - invDelta5*p1.p2*p1.p3*p2.p4*p5.p5 + invDelta5*p1.p2*
      p1.p3*p2.p5*p4.p5 - invDelta5*p1.p2*p1.p4*p2.p3*p5.p5 + invDelta5*p1.p2*
      p1.p4*p2.p5*p3.p5 + invDelta5*p1.p2*p1.p5*p2.p3*p4.p5 + invDelta5*p1.p2*
      p1.p5*p2.p4*p3.p5 - 2*invDelta5*p1.p2*p1.p5*p2.p5*p3.p4 + invDelta5*
      p1.p2^2*p3.p4*p5.p5 - invDelta5*p1.p2^2*p3.p5*p4.p5 + invDelta5*p1.p3*
      p1.p4*p2.p2*p5.p5 - invDelta5*p1.p3*p1.p4*p2.p5^2 - invDelta5*p1.p3*
      p1.p5*p2.p2*p4.p5 + invDelta5*p1.p3*p1.p5*p2.p4*p2.p5 - invDelta5*p1.p4*
      p1.p5*p2.p2*p3.p5 + invDelta5*p1.p4*p1.p5*p2.p3*p2.p5 + invDelta5*
      p1.p5^2*p2.p2*p3.p4 - invDelta5*p1.p5^2*p2.p3*p2.p4;

Fill Htable5(4,4) = invDelta5*p1.p1*p2.p2*p3.p3*p5.p5 - invDelta5*p1.p1*p2.p2*
      p3.p5^2 + 2*invDelta5*p1.p1*p2.p3*p2.p5*p3.p5 - invDelta5*p1.p1*p2.p3^2*
      p5.p5 - invDelta5*p1.p1*p2.p5^2*p3.p3 + 2*invDelta5*p1.p2*p1.p3*p2.p3*
      p5.p5 - 2*invDelta5*p1.p2*p1.p3*p2.p5*p3.p5 - 2*invDelta5*p1.p2*p1.p5*
      p2.p3*p3.p5 + 2*invDelta5*p1.p2*p1.p5*p2.p5*p3.p3 - invDelta5*p1.p2^2*
      p3.p3*p5.p5 + invDelta5*p1.p2^2*p3.p5^2 + 2*invDelta5*p1.p3*p1.p5*p2.p2*
      p3.p5 - 2*invDelta5*p1.p3*p1.p5*p2.p3*p2.p5 - invDelta5*p1.p3^2*p2.p2*
      p5.p5 + invDelta5*p1.p3^2*p2.p5^2 - invDelta5*p1.p5^2*p2.p2*p3.p3 + 
      invDelta5*p1.p5^2*p2.p3^2;

Fill Htable5(4,5) =  - invDelta5*p1.p1*p2.p2*p3.p3*p4.p5 + invDelta5*p1.p1*
      p2.p2*p3.p4*p3.p5 - invDelta5*p1.p1*p2.p3*p2.p4*p3.p5 - invDelta5*p1.p1*
      p2.p3*p2.p5*p3.p4 + invDelta5*p1.p1*p2.p3^2*p4.p5 + invDelta5*p1.p1*
      p2.p4*p2.p5*p3.p3 - 2*invDelta5*p1.p2*p1.p3*p2.p3*p4.p5 + invDelta5*
      p1.p2*p1.p3*p2.p4*p3.p5 + invDelta5*p1.p2*p1.p3*p2.p5*p3.p4 + invDelta5*
      p1.p2*p1.p4*p2.p3*p3.p5 - invDelta5*p1.p2*p1.p4*p2.p5*p3.p3 + invDelta5*
      p1.p2*p1.p5*p2.p3*p3.p4 - invDelta5*p1.p2*p1.p5*p2.p4*p3.p3 + invDelta5*
      p1.p2^2*p3.p3*p4.p5 - invDelta5*p1.p2^2*p3.p4*p3.p5 - invDelta5*p1.p3*
      p1.p4*p2.p2*p3.p5 + invDelta5*p1.p3*p1.p4*p2.p3*p2.p5 - invDelta5*p1.p3*
      p1.p5*p2.p2*p3.p4 + invDelta5*p1.p3*p1.p5*p2.p3*p2.p4 + invDelta5*
      p1.p3^2*p2.p2*p4.p5 - invDelta5*p1.p3^2*p2.p4*p2.p5 + invDelta5*p1.p4*
      p1.p5*p2.p2*p3.p3 - invDelta5*p1.p4*p1.p5*p2.p3^2;

Fill Htable5(5,1) = invDelta5*p1.p2*p2.p3*p3.p4*p4.p5 - invDelta5*p1.p2*p2.p3*
      p3.p5*p4.p4 - invDelta5*p1.p2*p2.p4*p3.p3*p4.p5 + invDelta5*p1.p2*p2.p4*
      p3.p4*p3.p5 + invDelta5*p1.p2*p2.p5*p3.p3*p4.p4 - invDelta5*p1.p2*p2.p5*
      p3.p4^2 - invDelta5*p1.p3*p2.p2*p3.p4*p4.p5 + invDelta5*p1.p3*p2.p2*
      p3.p5*p4.p4 + invDelta5*p1.p3*p2.p3*p2.p4*p4.p5 - invDelta5*p1.p3*p2.p3*
      p2.p5*p4.p4 + invDelta5*p1.p3*p2.p4*p2.p5*p3.p4 - invDelta5*p1.p3*
      p2.p4^2*p3.p5 + invDelta5*p1.p4*p2.p2*p3.p3*p4.p5 - invDelta5*p1.p4*
      p2.p2*p3.p4*p3.p5 + invDelta5*p1.p4*p2.p3*p2.p4*p3.p5 + invDelta5*p1.p4*
      p2.p3*p2.p5*p3.p4 - invDelta5*p1.p4*p2.p3^2*p4.p5 - invDelta5*p1.p4*
      p2.p4*p2.p5*p3.p3 - invDelta5*p1.p5*p2.p2*p3.p3*p4.p4 + invDelta5*p1.p5*
      p2.p2*p3.p4^2 - 2*invDelta5*p1.p5*p2.p3*p2.p4*p3.p4 + invDelta5*p1.p5*
      p2.p3^2*p4.p4 + invDelta5*p1.p5*p2.p4^2*p3.p3;

Fill Htable5(5,2) =  - invDelta5*p1.p1*p2.p3*p3.p4*p4.p5 + invDelta5*p1.p1*
      p2.p3*p3.p5*p4.p4 + invDelta5*p1.p1*p2.p4*p3.p3*p4.p5 - invDelta5*p1.p1*
      p2.p4*p3.p4*p3.p5 - invDelta5*p1.p1*p2.p5*p3.p3*p4.p4 + invDelta5*p1.p1*
      p2.p5*p3.p4^2 + invDelta5*p1.p2*p1.p3*p3.p4*p4.p5 - invDelta5*p1.p2*
      p1.p3*p3.p5*p4.p4 - invDelta5*p1.p2*p1.p4*p3.p3*p4.p5 + invDelta5*p1.p2*
      p1.p4*p3.p4*p3.p5 + invDelta5*p1.p2*p1.p5*p3.p3*p4.p4 - invDelta5*p1.p2*
      p1.p5*p3.p4^2 + invDelta5*p1.p3*p1.p4*p2.p3*p4.p5 + invDelta5*p1.p3*
      p1.p4*p2.p4*p3.p5 - 2*invDelta5*p1.p3*p1.p4*p2.p5*p3.p4 - invDelta5*
      p1.p3*p1.p5*p2.p3*p4.p4 + invDelta5*p1.p3*p1.p5*p2.p4*p3.p4 - invDelta5*
      p1.p3^2*p2.p4*p4.p5 + invDelta5*p1.p3^2*p2.p5*p4.p4 + invDelta5*p1.p4*
      p1.p5*p2.p3*p3.p4 - invDelta5*p1.p4*p1.p5*p2.p4*p3.p3 - invDelta5*
      p1.p4^2*p2.p3*p3.p5 + invDelta5*p1.p4^2*p2.p5*p3.p3;

Fill Htable5(5,3) = invDelta5*p1.p1*p2.p2*p3.p4*p4.p5 - invDelta5*p1.p1*p2.p2*
      p3.p5*p4.p4 - invDelta5*p1.p1*p2.p3*p2.p4*p4.p5 + invDelta5*p1.p1*p2.p3*
      p2.p5*p4.p4 - invDelta5*p1.p1*p2.p4*p2.p5*p3.p4 + invDelta5*p1.p1*
      p2.p4^2*p3.p5 + invDelta5*p1.p2*p1.p3*p2.p4*p4.p5 - invDelta5*p1.p2*
      p1.p3*p2.p5*p4.p4 + invDelta5*p1.p2*p1.p4*p2.p3*p4.p5 - 2*invDelta5*
      p1.p2*p1.p4*p2.p4*p3.p5 + invDelta5*p1.p2*p1.p4*p2.p5*p3.p4 - invDelta5*
      p1.p2*p1.p5*p2.p3*p4.p4 + invDelta5*p1.p2*p1.p5*p2.p4*p3.p4 - invDelta5*
      p1.p2^2*p3.p4*p4.p5 + invDelta5*p1.p2^2*p3.p5*p4.p4 - invDelta5*p1.p3*
      p1.p4*p2.p2*p4.p5 + invDelta5*p1.p3*p1.p4*p2.p4*p2.p5 + invDelta5*p1.p3*
      p1.p5*p2.p2*p4.p4 - invDelta5*p1.p3*p1.p5*p2.p4^2 - invDelta5*p1.p4*
      p1.p5*p2.p2*p3.p4 + invDelta5*p1.p4*p1.p5*p2.p3*p2.p4 + invDelta5*
      p1.p4^2*p2.p2*p3.p5 - invDelta5*p1.p4^2*p2.p3*p2.p5;

Fill Htable5(5,4) =  - invDelta5*p1.p1*p2.p2*p3.p3*p4.p5 + invDelta5*p1.p1*
      p2.p2*p3.p4*p3.p5 - invDelta5*p1.p1*p2.p3*p2.p4*p3.p5 - invDelta5*p1.p1*
      p2.p3*p2.p5*p3.p4 + invDelta5*p1.p1*p2.p3^2*p4.p5 + invDelta5*p1.p1*
      p2.p4*p2.p5*p3.p3 - 2*invDelta5*p1.p2*p1.p3*p2.p3*p4.p5 + invDelta5*
      p1.p2*p1.p3*p2.p4*p3.p5 + invDelta5*p1.p2*p1.p3*p2.p5*p3.p4 + invDelta5*
      p1.p2*p1.p4*p2.p3*p3.p5 - invDelta5*p1.p2*p1.p4*p2.p5*p3.p3 + invDelta5*
      p1.p2*p1.p5*p2.p3*p3.p4 - invDelta5*p1.p2*p1.p5*p2.p4*p3.p3 + invDelta5*
      p1.p2^2*p3.p3*p4.p5 - invDelta5*p1.p2^2*p3.p4*p3.p5 - invDelta5*p1.p3*
      p1.p4*p2.p2*p3.p5 + invDelta5*p1.p3*p1.p4*p2.p3*p2.p5 - invDelta5*p1.p3*
      p1.p5*p2.p2*p3.p4 + invDelta5*p1.p3*p1.p5*p2.p3*p2.p4 + invDelta5*
      p1.p3^2*p2.p2*p4.p5 - invDelta5*p1.p3^2*p2.p4*p2.p5 + invDelta5*p1.p4*
      p1.p5*p2.p2*p3.p3 - invDelta5*p1.p4*p1.p5*p2.p3^2;

Fill Htable5(5,5) = invDelta5*p1.p1*p2.p2*p3.p3*p4.p4 - invDelta5*p1.p1*p2.p2*
      p3.p4^2 + 2*invDelta5*p1.p1*p2.p3*p2.p4*p3.p4 - invDelta5*p1.p1*p2.p3^2*
      p4.p4 - invDelta5*p1.p1*p2.p4^2*p3.p3 + 2*invDelta5*p1.p2*p1.p3*p2.p3*
      p4.p4 - 2*invDelta5*p1.p2*p1.p3*p2.p4*p3.p4 - 2*invDelta5*p1.p2*p1.p4*
      p2.p3*p3.p4 + 2*invDelta5*p1.p2*p1.p4*p2.p4*p3.p3 - invDelta5*p1.p2^2*
      p3.p3*p4.p4 + invDelta5*p1.p2^2*p3.p4^2 + 2*invDelta5*p1.p3*p1.p4*p2.p2*
      p3.p4 - 2*invDelta5*p1.p3*p1.p4*p2.p3*p2.p4 - invDelta5*p1.p3^2*p2.p2*
      p4.p4 + invDelta5*p1.p3^2*p2.p4^2 - invDelta5*p1.p4^2*p2.p2*p3.p3 + 
      invDelta5*p1.p4^2*p2.p3^2;

