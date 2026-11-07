*
* File created Mon Jun 24 12:59:34 2024
*
Fill Prt6(1,1,1,1,1,1) = dt(p1,p1)^3*rat(1,Dt^3+6*Dt^2+8*Dt);
Fill Prt6(1,1,1,1,1,2) = dt(p1,p1)^2*dt(p1,p2)*rat(1,Dt^3+6*Dt^2+8*Dt);
Fill Prt6(1,1,1,1,2,2) = dt(p1,p1)^2*dt(p2,p2)*rat(Dt+3,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p1)*dt(p1,p2)^2*rat(-4,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,1,1,1,2,3) = dt(p1,p1)^2*dt(p2,p3)*rat(Dt+3,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p1)*dt(p1,p2)*dt(p1,p3)*rat(-4,Dt^4+5*Dt^3+2*Dt^2-8*
 Dt);
Fill Prt6(1,1,1,2,1,2) = dt(p1,p1)^2*dt(p2,p2)*rat(-1,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p1)*dt(p1,p2)^2*rat(1,Dt^3+5*Dt^2+2*Dt-8);
Fill Prt6(1,1,1,2,1,3) = dt(p1,p1)^2*dt(p2,p3)*rat(-1,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p1)*dt(p1,p2)*dt(p1,p3)*rat(1,Dt^3+5*Dt^2+2*Dt-8);
Fill Prt6(1,1,1,2,2,2) = dt(p1,p1)*dt(p1,p2)*dt(p2,p2)*rat(Dt+1,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)^3*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,1,1,2,2,3) = dt(p1,p1)*dt(p1,p2)*dt(p2,p3)*rat(1,Dt^3+3*
 Dt^2-4*Dt)+dt(p1,p1)*dt(p1,p3)*dt(p2,p2)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*
 Dt)+dt(p1,p2)^2*dt(p1,p3)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,1,1,2,3,2) = dt(p1,p1)*dt(p1,p2)*dt(p2,p3)*rat(1,Dt^3+3*
 Dt^2-4*Dt)+dt(p1,p1)*dt(p1,p3)*dt(p2,p2)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*
 Dt)+dt(p1,p2)^2*dt(p1,p3)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,1,1,2,3,3) = dt(p1,p1)*dt(p1,p2)*dt(p3,p3)*rat(Dt+3,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p1)*dt(p1,p3)*dt(p2,p3)*rat(-2,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p2)*dt(p1,p3)^2*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,1,1,2,3,4) = dt(p1,p1)*dt(p1,p2)*dt(p3,p4)*rat(Dt+3,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p1)*dt(p1,p3)*dt(p2,p4)*rat(-1,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p1)*dt(p1,p4)*dt(p2,p3)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*
 Dt)+dt(p1,p2)*dt(p1,p3)*dt(p1,p4)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,1,2,2,2,2) = dt(p1,p1)*dt(p2,p2)^2*rat(Dt+3,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p2)^2*dt(p2,p2)*rat(-4,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,1,2,2,2,3) = dt(p1,p1)*dt(p2,p2)*dt(p2,p3)*rat(Dt+3,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)^2*dt(p2,p3)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt
 )+dt(p1,p2)*dt(p1,p3)*dt(p2,p2)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,1,2,2,3,3) = dt(p1,p1)*dt(p2,p2)*dt(p3,p3)*rat(Dt^2+3*Dt-2,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p1)*dt(p2,p3)^2*rat(-2,Dt^4+
 Dt^3-10*Dt^2+8*Dt)+dt(p1,p2)^2*dt(p3,p3)*rat(-2,Dt^4+Dt^3-10*Dt^2+8*Dt
 )+dt(p1,p2)*dt(p1,p3)*dt(p2,p3)*rat(16,Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*
 Dt)+dt(p1,p3)^2*dt(p2,p2)*rat(-2,Dt^4+Dt^3-10*Dt^2+8*Dt);
Fill Prt6(1,1,2,2,3,4) = dt(p1,p1)*dt(p2,p2)*dt(p3,p4)*rat(Dt^2+3*Dt-2,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p1)*dt(p2,p3)*dt(p2,p4)*rat(-2
 ,Dt^4+Dt^3-10*Dt^2+8*Dt)+dt(p1,p2)^2*dt(p3,p4)*rat(-2,Dt^4+Dt^3-10*
 Dt^2+8*Dt)+dt(p1,p2)*dt(p1,p3)*dt(p2,p4)*rat(8,Dt^5+3*Dt^4-8*Dt^3-12*
 Dt^2+16*Dt)+dt(p1,p2)*dt(p1,p4)*dt(p2,p3)*rat(8,Dt^5+3*Dt^4-8*Dt^3-12*
 Dt^2+16*Dt)+dt(p1,p3)*dt(p1,p4)*dt(p2,p2)*rat(-2,Dt^4+Dt^3-10*Dt^2+8*
 Dt);
Fill Prt6(1,1,2,3,2,3) = dt(p1,p1)*dt(p2,p2)*dt(p3,p3)*rat(-1,Dt^4+Dt^3
 -10*Dt^2+8*Dt)+dt(p1,p1)*dt(p2,p3)^2*rat(Dt^2+2*Dt-4,Dt^5+3*Dt^4-8*
 Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)^2*dt(p3,p3)*rat(4,Dt^5+3*Dt^4-8*Dt^3-12*
 Dt^2+16*Dt)+dt(p1,p2)*dt(p1,p3)*dt(p2,p3)*rat(-4,Dt^4+3*Dt^3-8*Dt^2-12
 *Dt+16)+dt(p1,p3)^2*dt(p2,p2)*rat(4,Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt);
Fill Prt6(1,1,2,3,2,4) = dt(p1,p1)*dt(p2,p2)*dt(p3,p4)*rat(-1,Dt^4+Dt^3
 -10*Dt^2+8*Dt)+dt(p1,p1)*dt(p2,p3)*dt(p2,p4)*rat(Dt^2+2*Dt-4,Dt^5+3*
 Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)^2*dt(p3,p4)*rat(4,Dt^5+3*Dt^4-8*
 Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p1,p3)*dt(p2,p4)*rat(-2,Dt^4+3*Dt^3-8
 *Dt^2-12*Dt+16)+dt(p1,p2)*dt(p1,p4)*dt(p2,p3)*rat(-2,Dt^4+3*Dt^3-8*
 Dt^2-12*Dt+16)+dt(p1,p3)*dt(p1,p4)*dt(p2,p2)*rat(4,Dt^5+3*Dt^4-8*Dt^3-
 12*Dt^2+16*Dt);
Fill Prt6(1,1,2,3,3,3) = dt(p1,p1)*dt(p2,p3)*dt(p3,p3)*rat(Dt+3,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)*dt(p1,p3)*dt(p3,p3)*rat(-2,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p3)^2*dt(p2,p3)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,1,2,3,3,4) = dt(p1,p1)*dt(p2,p3)*dt(p3,p4)*rat(Dt^2+2*Dt-4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p1)*dt(p2,p4)*dt(p3,p3)*rat(-1
 ,Dt^4+Dt^3-10*Dt^2+8*Dt)+dt(p1,p2)*dt(p1,p3)*dt(p3,p4)*rat(-2,Dt^4+3*
 Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p2)*dt(p1,p4)*dt(p3,p3)*rat(4,Dt^5+3*Dt^4-
 8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)^2*dt(p2,p4)*rat(4,Dt^5+3*Dt^4-8*Dt^3-
 12*Dt^2+16*Dt)+dt(p1,p3)*dt(p1,p4)*dt(p2,p3)*rat(-2,Dt^4+3*Dt^3-8*Dt^2
 -12*Dt+16);
Fill Prt6(1,1,2,3,4,3) = dt(p1,p1)*dt(p2,p3)*dt(p3,p4)*rat(Dt^2+2*Dt-4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p1)*dt(p2,p4)*dt(p3,p3)*rat(-1
 ,Dt^4+Dt^3-10*Dt^2+8*Dt)+dt(p1,p2)*dt(p1,p3)*dt(p3,p4)*rat(-2,Dt^4+3*
 Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p2)*dt(p1,p4)*dt(p3,p3)*rat(4,Dt^5+3*Dt^4-
 8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)^2*dt(p2,p4)*rat(4,Dt^5+3*Dt^4-8*Dt^3-
 12*Dt^2+16*Dt)+dt(p1,p3)*dt(p1,p4)*dt(p2,p3)*rat(-2,Dt^4+3*Dt^3-8*Dt^2
 -12*Dt+16);
Fill Prt6(1,1,2,3,4,4) = dt(p1,p1)*dt(p2,p3)*dt(p4,p4)*rat(Dt^2+3*Dt-2,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p1)*dt(p2,p4)*dt(p3,p4)*rat(-2
 ,Dt^4+Dt^3-10*Dt^2+8*Dt)+dt(p1,p2)*dt(p1,p3)*dt(p4,p4)*rat(-2,Dt^4+
 Dt^3-10*Dt^2+8*Dt)+dt(p1,p2)*dt(p1,p4)*dt(p3,p4)*rat(8,Dt^5+3*Dt^4-8*
 Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)*dt(p1,p4)*dt(p2,p4)*rat(8,Dt^5+3*Dt^4-8*
 Dt^3-12*Dt^2+16*Dt)+dt(p1,p4)^2*dt(p2,p3)*rat(-2,Dt^4+Dt^3-10*Dt^2+8*
 Dt);
Fill Prt6(1,2,1,2,1,2) = dt(p1,p1)*dt(p1,p2)*dt(p2,p2)*rat(-3,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)^3*rat(1,Dt^3+3*Dt^2-4*Dt);
Fill Prt6(1,2,1,2,1,3) = dt(p1,p1)*dt(p1,p2)*dt(p2,p3)*rat(-2,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p1)*dt(p1,p3)*dt(p2,p2)*rat(-1,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p2)^2*dt(p1,p3)*rat(1,Dt^3+3*Dt^2-4*Dt);
Fill Prt6(1,2,1,2,2,2) = dt(p1,p1)*dt(p2,p2)^2*rat(-1,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p2)^2*dt(p2,p2)*rat(1,Dt^3+5*Dt^2+2*Dt-8);
Fill Prt6(1,2,1,2,2,3) = dt(p1,p1)*dt(p2,p2)*dt(p2,p3)*rat(-1,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)^2*dt(p2,p3)*rat(1,Dt^3+3*Dt^2-4*Dt)+dt(p1,
 p2)*dt(p1,p3)*dt(p2,p2)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,1,2,3,2) = dt(p1,p1)*dt(p2,p2)*dt(p2,p3)*rat(-1,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)^2*dt(p2,p3)*rat(1,Dt^3+3*Dt^2-4*Dt)+dt(p1,
 p2)*dt(p1,p3)*dt(p2,p2)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,1,2,3,3) = dt(p1,p1)*dt(p2,p2)*dt(p3,p3)*rat(-1,Dt^4+Dt^3
 -10*Dt^2+8*Dt)+dt(p1,p1)*dt(p2,p3)^2*rat(4,Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+
 16*Dt)+dt(p1,p2)^2*dt(p3,p3)*rat(Dt^2+2*Dt-4,Dt^5+3*Dt^4-8*Dt^3-12*
 Dt^2+16*Dt)+dt(p1,p2)*dt(p1,p3)*dt(p2,p3)*rat(-4,Dt^4+3*Dt^3-8*Dt^2-12
 *Dt+16)+dt(p1,p3)^2*dt(p2,p2)*rat(4,Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt);
Fill Prt6(1,2,1,2,3,4) = dt(p1,p1)*dt(p2,p2)*dt(p3,p4)*rat(-1,Dt^4+Dt^3
 -10*Dt^2+8*Dt)+dt(p1,p1)*dt(p2,p3)*dt(p2,p4)*rat(4,Dt^5+3*Dt^4-8*Dt^3-
 12*Dt^2+16*Dt)+dt(p1,p2)^2*dt(p3,p4)*rat(Dt^2+2*Dt-4,Dt^5+3*Dt^4-8*
 Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p1,p3)*dt(p2,p4)*rat(-2,Dt^4+3*Dt^3-8
 *Dt^2-12*Dt+16)+dt(p1,p2)*dt(p1,p4)*dt(p2,p3)*rat(-2,Dt^4+3*Dt^3-8*
 Dt^2-12*Dt+16)+dt(p1,p3)*dt(p1,p4)*dt(p2,p2)*rat(4,Dt^5+3*Dt^4-8*Dt^3-
 12*Dt^2+16*Dt);
Fill Prt6(1,2,1,3,1,3) = dt(p1,p1)*dt(p1,p2)*dt(p3,p3)*rat(-1,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p1)*dt(p1,p3)*dt(p2,p3)*rat(-2,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p2)*dt(p1,p3)^2*rat(1,Dt^3+3*Dt^2-4*Dt);
Fill Prt6(1,2,1,3,1,4) = dt(p1,p1)*dt(p1,p2)*dt(p3,p4)*rat(-1,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p1)*dt(p1,p3)*dt(p2,p4)*rat(-1,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p1)*dt(p1,p4)*dt(p2,p3)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*
 Dt)+dt(p1,p2)*dt(p1,p3)*dt(p1,p4)*rat(1,Dt^3+3*Dt^2-4*Dt);
Fill Prt6(1,2,1,3,2,2) = dt(p1,p1)*dt(p2,p2)*dt(p2,p3)*rat(-1,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)^2*dt(p2,p3)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt
 )+dt(p1,p2)*dt(p1,p3)*dt(p2,p2)*rat(1,Dt^3+3*Dt^2-4*Dt);
Fill Prt6(1,2,1,3,2,3) = dt(p1,p1)*dt(p2,p2)*dt(p3,p3)*rat(2,Dt^5+3*
 Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p1)*dt(p2,p3)^2*rat(-1,Dt^4+3*Dt^3-8*
 Dt^2-12*Dt+16)+dt(p1,p2)^2*dt(p3,p3)*rat(-1,Dt^4+3*Dt^3-8*Dt^2-12*Dt+
 16)+dt(p1,p2)*dt(p1,p3)*dt(p2,p3)*rat(Dt,Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+
 dt(p1,p3)^2*dt(p2,p2)*rat(-1,Dt^4+3*Dt^3-8*Dt^2-12*Dt+16);
Fill Prt6(1,2,1,3,2,4) = dt(p1,p1)*dt(p2,p2)*dt(p3,p4)*rat(2,Dt^5+3*
 Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p1)*dt(p2,p3)*dt(p2,p4)*rat(-1,Dt^4+3
 *Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p2)^2*dt(p3,p4)*rat(-1,Dt^4+3*Dt^3-8*Dt^2
 -12*Dt+16)+dt(p1,p2)*dt(p1,p3)*dt(p2,p4)*rat(Dt^2+Dt-4,Dt^5+3*Dt^4-8*
 Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p1,p4)*dt(p2,p3)*rat(-Dt+4,Dt^5+3*
 Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)*dt(p1,p4)*dt(p2,p2)*rat(-1,Dt^4+3
 *Dt^3-8*Dt^2-12*Dt+16);
Fill Prt6(1,2,1,3,3,3) = dt(p1,p1)*dt(p2,p3)*dt(p3,p3)*rat(-1,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)*dt(p1,p3)*dt(p3,p3)*rat(1,Dt^3+3*Dt^2-4*Dt
 )+dt(p1,p3)^2*dt(p2,p3)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,1,3,3,4) = dt(p1,p1)*dt(p2,p3)*dt(p3,p4)*rat(-1,Dt^4+3*
 Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p1)*dt(p2,p4)*dt(p3,p3)*rat(2,Dt^5+3*Dt^4-
 8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p1,p3)*dt(p3,p4)*rat(Dt^2+Dt-4,Dt^5
 +3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p1,p4)*dt(p3,p3)*rat(-1,
 Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p3)^2*dt(p2,p4)*rat(-1,Dt^4+3*Dt^3-
 8*Dt^2-12*Dt+16)+dt(p1,p3)*dt(p1,p4)*dt(p2,p3)*rat(-Dt+4,Dt^5+3*Dt^4-8
 *Dt^3-12*Dt^2+16*Dt);
Fill Prt6(1,2,1,3,4,2) = dt(p1,p1)*dt(p2,p2)*dt(p3,p4)*rat(2,Dt^5+3*
 Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p1)*dt(p2,p3)*dt(p2,p4)*rat(-1,Dt^4+3
 *Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p2)^2*dt(p3,p4)*rat(-1,Dt^4+3*Dt^3-8*Dt^2
 -12*Dt+16)+dt(p1,p2)*dt(p1,p3)*dt(p2,p4)*rat(Dt^2+Dt-4,Dt^5+3*Dt^4-8*
 Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p1,p4)*dt(p2,p3)*rat(-Dt+4,Dt^5+3*
 Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)*dt(p1,p4)*dt(p2,p2)*rat(-1,Dt^4+3
 *Dt^3-8*Dt^2-12*Dt+16);
Fill Prt6(1,2,1,3,4,3) = dt(p1,p1)*dt(p2,p3)*dt(p3,p4)*rat(-1,Dt^4+3*
 Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p1)*dt(p2,p4)*dt(p3,p3)*rat(2,Dt^5+3*Dt^4-
 8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p1,p3)*dt(p3,p4)*rat(Dt^2+Dt-4,Dt^5
 +3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p1,p4)*dt(p3,p3)*rat(-1,
 Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p3)^2*dt(p2,p4)*rat(-1,Dt^4+3*Dt^3-
 8*Dt^2-12*Dt+16)+dt(p1,p3)*dt(p1,p4)*dt(p2,p3)*rat(-Dt+4,Dt^5+3*Dt^4-8
 *Dt^3-12*Dt^2+16*Dt);
Fill Prt6(1,2,1,3,4,4) = dt(p1,p1)*dt(p2,p3)*dt(p4,p4)*rat(-1,Dt^4+Dt^3
 -10*Dt^2+8*Dt)+dt(p1,p1)*dt(p2,p4)*dt(p3,p4)*rat(4,Dt^5+3*Dt^4-8*Dt^3-
 12*Dt^2+16*Dt)+dt(p1,p2)*dt(p1,p3)*dt(p4,p4)*rat(Dt^2+2*Dt-4,Dt^5+3*
 Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p1,p4)*dt(p3,p4)*rat(-2,Dt^4+3
 *Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p3)*dt(p1,p4)*dt(p2,p4)*rat(-2,Dt^4+3*
 Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p4)^2*dt(p2,p3)*rat(4,Dt^5+3*Dt^4-8*Dt^3-
 12*Dt^2+16*Dt);
Fill Prt6(1,2,2,2,2,2) = dt(p1,p2)*dt(p2,p2)^2*rat(1,Dt^3+6*Dt^2+8*Dt);
Fill Prt6(1,2,2,2,2,3) = dt(p1,p2)*dt(p2,p2)*dt(p2,p3)*rat(1,Dt^3+5*
 Dt^2+2*Dt-8)+dt(p1,p3)*dt(p2,p2)^2*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,2,2,3,3) = dt(p1,p2)*dt(p2,p2)*dt(p3,p3)*rat(Dt+3,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)*dt(p2,p3)^2*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt
 )+dt(p1,p3)*dt(p2,p2)*dt(p2,p3)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,2,2,3,4) = dt(p1,p2)*dt(p2,p2)*dt(p3,p4)*rat(Dt+3,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)*dt(p2,p3)*dt(p2,p4)*rat(-2,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p3)*dt(p2,p2)*dt(p2,p4)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*
 Dt)+dt(p1,p4)*dt(p2,p2)*dt(p2,p3)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,2,3,2,3) = dt(p1,p2)*dt(p2,p2)*dt(p3,p3)*rat(-1,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)*dt(p2,p3)^2*rat(1,Dt^3+3*Dt^2-4*Dt)+dt(p1,
 p3)*dt(p2,p2)*dt(p2,p3)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,2,3,2,4) = dt(p1,p2)*dt(p2,p2)*dt(p3,p4)*rat(-1,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)*dt(p2,p3)*dt(p2,p4)*rat(1,Dt^3+3*Dt^2-4*Dt
 )+dt(p1,p3)*dt(p2,p2)*dt(p2,p4)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*Dt)+dt(p1,
 p4)*dt(p2,p2)*dt(p2,p3)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,2,3,3,3) = dt(p1,p2)*dt(p2,p3)*dt(p3,p3)*rat(1,Dt^3+3*
 Dt^2-4*Dt)+dt(p1,p3)*dt(p2,p2)*dt(p3,p3)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*
 Dt)+dt(p1,p3)*dt(p2,p3)^2*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,2,3,3,4) = dt(p1,p2)*dt(p2,p3)*dt(p3,p4)*rat(Dt^2+Dt-4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p2,p4)*dt(p3,p3)*rat(-1
 ,Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p3)*dt(p2,p2)*dt(p3,p4)*rat(-1,
 Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p3)*dt(p2,p3)*dt(p2,p4)*rat(-Dt+4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p4)*dt(p2,p2)*dt(p3,p3)*rat(2,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p4)*dt(p2,p3)^2*rat(-1,Dt^4+3*
 Dt^3-8*Dt^2-12*Dt+16);
Fill Prt6(1,2,2,3,4,3) = dt(p1,p2)*dt(p2,p3)*dt(p3,p4)*rat(Dt^2+Dt-4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p2,p4)*dt(p3,p3)*rat(-1
 ,Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p3)*dt(p2,p2)*dt(p3,p4)*rat(-1,
 Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p3)*dt(p2,p3)*dt(p2,p4)*rat(-Dt+4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p4)*dt(p2,p2)*dt(p3,p3)*rat(2,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p4)*dt(p2,p3)^2*rat(-1,Dt^4+3*
 Dt^3-8*Dt^2-12*Dt+16);
Fill Prt6(1,2,2,3,4,4) = dt(p1,p2)*dt(p2,p3)*dt(p4,p4)*rat(Dt^2+2*Dt-4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p2,p4)*dt(p3,p4)*rat(-2
 ,Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p3)*dt(p2,p2)*dt(p4,p4)*rat(-1,
 Dt^4+Dt^3-10*Dt^2+8*Dt)+dt(p1,p3)*dt(p2,p4)^2*rat(4,Dt^5+3*Dt^4-8*Dt^3
 -12*Dt^2+16*Dt)+dt(p1,p4)*dt(p2,p2)*dt(p3,p4)*rat(4,Dt^5+3*Dt^4-8*Dt^3
 -12*Dt^2+16*Dt)+dt(p1,p4)*dt(p2,p3)*dt(p2,p4)*rat(-2,Dt^4+3*Dt^3-8*
 Dt^2-12*Dt+16);
Fill Prt6(1,2,3,2,2,2) = dt(p1,p2)*dt(p2,p2)*dt(p2,p3)*rat(1,Dt^3+5*
 Dt^2+2*Dt-8)+dt(p1,p3)*dt(p2,p2)^2*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,3,2,2,4) = dt(p1,p2)*dt(p2,p2)*dt(p3,p4)*rat(-1,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)*dt(p2,p3)*dt(p2,p4)*rat(1,Dt^3+3*Dt^2-4*Dt
 )+dt(p1,p3)*dt(p2,p2)*dt(p2,p4)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*Dt)+dt(p1,
 p4)*dt(p2,p2)*dt(p2,p3)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,3,2,3,2) = dt(p1,p2)*dt(p2,p2)*dt(p3,p3)*rat(-1,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)*dt(p2,p3)^2*rat(1,Dt^3+3*Dt^2-4*Dt)+dt(p1,
 p3)*dt(p2,p2)*dt(p2,p3)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,3,2,3,4) = dt(p1,p2)*dt(p2,p3)*dt(p3,p4)*rat(Dt^2+Dt-4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p2,p4)*dt(p3,p3)*rat(-1
 ,Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p3)*dt(p2,p2)*dt(p3,p4)*rat(-1,
 Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p3)*dt(p2,p3)*dt(p2,p4)*rat(-Dt+4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p4)*dt(p2,p2)*dt(p3,p3)*rat(2,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p4)*dt(p2,p3)^2*rat(-1,Dt^4+3*
 Dt^3-8*Dt^2-12*Dt+16);
Fill Prt6(1,2,3,2,4,2) = dt(p1,p2)*dt(p2,p2)*dt(p3,p4)*rat(-1,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)*dt(p2,p3)*dt(p2,p4)*rat(1,Dt^3+3*Dt^2-4*Dt
 )+dt(p1,p3)*dt(p2,p2)*dt(p2,p4)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*Dt)+dt(p1,
 p4)*dt(p2,p2)*dt(p2,p3)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,3,2,4,4) = dt(p1,p2)*dt(p2,p3)*dt(p4,p4)*rat(Dt^2+2*Dt-4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p2,p4)*dt(p3,p4)*rat(-2
 ,Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p3)*dt(p2,p2)*dt(p4,p4)*rat(-1,
 Dt^4+Dt^3-10*Dt^2+8*Dt)+dt(p1,p3)*dt(p2,p4)^2*rat(4,Dt^5+3*Dt^4-8*Dt^3
 -12*Dt^2+16*Dt)+dt(p1,p4)*dt(p2,p2)*dt(p3,p4)*rat(4,Dt^5+3*Dt^4-8*Dt^3
 -12*Dt^2+16*Dt)+dt(p1,p4)*dt(p2,p3)*dt(p2,p4)*rat(-2,Dt^4+3*Dt^3-8*
 Dt^2-12*Dt+16);
Fill Prt6(1,2,3,3,2,2) = dt(p1,p2)*dt(p2,p2)*dt(p3,p3)*rat(Dt+3,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)*dt(p2,p3)^2*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt
 )+dt(p1,p3)*dt(p2,p2)*dt(p2,p3)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,3,3,2,4) = dt(p1,p2)*dt(p2,p3)*dt(p3,p4)*rat(-2,Dt^4+3*
 Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p2)*dt(p2,p4)*dt(p3,p3)*rat(Dt^2+2*Dt-4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)*dt(p2,p2)*dt(p3,p4)*rat(4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)*dt(p2,p3)*dt(p2,p4)*rat(-2
 ,Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p4)*dt(p2,p2)*dt(p3,p3)*rat(-1,
 Dt^4+Dt^3-10*Dt^2+8*Dt)+dt(p1,p4)*dt(p2,p3)^2*rat(4,Dt^5+3*Dt^4-8*Dt^3
 -12*Dt^2+16*Dt);
Fill Prt6(1,2,3,3,3,2) = dt(p1,p2)*dt(p2,p3)*dt(p3,p3)*rat(1,Dt^3+3*
 Dt^2-4*Dt)+dt(p1,p3)*dt(p2,p2)*dt(p3,p3)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*
 Dt)+dt(p1,p3)*dt(p2,p3)^2*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,3,3,3,3) = dt(p1,p2)*dt(p3,p3)^2*rat(Dt+3,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p3)*dt(p2,p3)*dt(p3,p3)*rat(-4,Dt^4+5*Dt^3+2*Dt^2-8*
 Dt);
Fill Prt6(1,2,3,3,3,4) = dt(p1,p2)*dt(p3,p3)*dt(p3,p4)*rat(Dt+3,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p3)*dt(p2,p3)*dt(p3,p4)*rat(-2,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p3)*dt(p2,p4)*dt(p3,p3)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*
 Dt)+dt(p1,p4)*dt(p2,p3)*dt(p3,p3)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,3,3,4,2) = dt(p1,p2)*dt(p2,p3)*dt(p3,p4)*rat(-2,Dt^4+3*
 Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p2)*dt(p2,p4)*dt(p3,p3)*rat(Dt^2+2*Dt-4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)*dt(p2,p2)*dt(p3,p4)*rat(4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)*dt(p2,p3)*dt(p2,p4)*rat(-2
 ,Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p4)*dt(p2,p2)*dt(p3,p3)*rat(-1,
 Dt^4+Dt^3-10*Dt^2+8*Dt)+dt(p1,p4)*dt(p2,p3)^2*rat(4,Dt^5+3*Dt^4-8*Dt^3
 -12*Dt^2+16*Dt);
Fill Prt6(1,2,3,3,4,4) = dt(p1,p2)*dt(p3,p3)*dt(p4,p4)*rat(Dt^2+3*Dt-2,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p3,p4)^2*rat(-2,Dt^4+
 Dt^3-10*Dt^2+8*Dt)+dt(p1,p3)*dt(p2,p3)*dt(p4,p4)*rat(-2,Dt^4+Dt^3-10*
 Dt^2+8*Dt)+dt(p1,p3)*dt(p2,p4)*dt(p3,p4)*rat(8,Dt^5+3*Dt^4-8*Dt^3-12*
 Dt^2+16*Dt)+dt(p1,p4)*dt(p2,p3)*dt(p3,p4)*rat(8,Dt^5+3*Dt^4-8*Dt^3-12*
 Dt^2+16*Dt)+dt(p1,p4)*dt(p2,p4)*dt(p3,p3)*rat(-2,Dt^4+Dt^3-10*Dt^2+8*
 Dt);
Fill Prt6(1,2,3,4,2,2) = dt(p1,p2)*dt(p2,p2)*dt(p3,p4)*rat(Dt+3,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p2)*dt(p2,p3)*dt(p2,p4)*rat(-2,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p3)*dt(p2,p2)*dt(p2,p4)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*
 Dt)+dt(p1,p4)*dt(p2,p2)*dt(p2,p3)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
Fill Prt6(1,2,3,4,2,4) = dt(p1,p2)*dt(p2,p3)*dt(p4,p4)*rat(-1,Dt^4+3*
 Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p2)*dt(p2,p4)*dt(p3,p4)*rat(Dt^2+Dt-4,Dt^5
 +3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)*dt(p2,p2)*dt(p4,p4)*rat(2,Dt^5
 +3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)*dt(p2,p4)^2*rat(-1,Dt^4+3*Dt^3
 -8*Dt^2-12*Dt+16)+dt(p1,p4)*dt(p2,p2)*dt(p3,p4)*rat(-1,Dt^4+3*Dt^3-8*
 Dt^2-12*Dt+16)+dt(p1,p4)*dt(p2,p3)*dt(p2,p4)*rat(-Dt+4,Dt^5+3*Dt^4-8*
 Dt^3-12*Dt^2+16*Dt);
Fill Prt6(1,2,3,4,3,2) = dt(p1,p2)*dt(p2,p3)*dt(p3,p4)*rat(Dt^2+Dt-4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p2)*dt(p2,p4)*dt(p3,p3)*rat(-1
 ,Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p3)*dt(p2,p2)*dt(p3,p4)*rat(-1,
 Dt^4+3*Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p3)*dt(p2,p3)*dt(p2,p4)*rat(-Dt+4,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p4)*dt(p2,p2)*dt(p3,p3)*rat(2,
 Dt^5+3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p4)*dt(p2,p3)^2*rat(-1,Dt^4+3*
 Dt^3-8*Dt^2-12*Dt+16);
Fill Prt6(1,2,3,4,3,4) = dt(p1,p2)*dt(p3,p3)*dt(p4,p4)*rat(-1,Dt^4+Dt^3
 -10*Dt^2+8*Dt)+dt(p1,p2)*dt(p3,p4)^2*rat(Dt^2+2*Dt-4,Dt^5+3*Dt^4-8*
 Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)*dt(p2,p3)*dt(p4,p4)*rat(4,Dt^5+3*Dt^4-8*
 Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)*dt(p2,p4)*dt(p3,p4)*rat(-2,Dt^4+3*Dt^3-8
 *Dt^2-12*Dt+16)+dt(p1,p4)*dt(p2,p3)*dt(p3,p4)*rat(-2,Dt^4+3*Dt^3-8*
 Dt^2-12*Dt+16)+dt(p1,p4)*dt(p2,p4)*dt(p3,p3)*rat(4,Dt^5+3*Dt^4-8*Dt^3-
 12*Dt^2+16*Dt);
Fill Prt6(1,2,3,4,4,2) = dt(p1,p2)*dt(p2,p3)*dt(p4,p4)*rat(-1,Dt^4+3*
 Dt^3-8*Dt^2-12*Dt+16)+dt(p1,p2)*dt(p2,p4)*dt(p3,p4)*rat(Dt^2+Dt-4,Dt^5
 +3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)*dt(p2,p2)*dt(p4,p4)*rat(2,Dt^5
 +3*Dt^4-8*Dt^3-12*Dt^2+16*Dt)+dt(p1,p3)*dt(p2,p4)^2*rat(-1,Dt^4+3*Dt^3
 -8*Dt^2-12*Dt+16)+dt(p1,p4)*dt(p2,p2)*dt(p3,p4)*rat(-1,Dt^4+3*Dt^3-8*
 Dt^2-12*Dt+16)+dt(p1,p4)*dt(p2,p3)*dt(p2,p4)*rat(-Dt+4,Dt^5+3*Dt^4-8*
 Dt^3-12*Dt^2+16*Dt);
Fill Prt6(1,2,3,4,4,4) = dt(p1,p2)*dt(p3,p4)*dt(p4,p4)*rat(Dt+3,Dt^4+5*
 Dt^3+2*Dt^2-8*Dt)+dt(p1,p3)*dt(p2,p4)*dt(p4,p4)*rat(-1,Dt^4+5*Dt^3+2*
 Dt^2-8*Dt)+dt(p1,p4)*dt(p2,p3)*dt(p4,p4)*rat(-1,Dt^4+5*Dt^3+2*Dt^2-8*
 Dt)+dt(p1,p4)*dt(p2,p4)*dt(p3,p4)*rat(-2,Dt^4+5*Dt^3+2*Dt^2-8*Dt);
