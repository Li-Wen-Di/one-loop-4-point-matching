*
* File created Mon Jun 24 12:59:27 2024
*
Fill Prt4(1,1,1,1) = dt(p1,p1)^2*rat(1,Dt^2+2*Dt);
Fill Prt4(1,1,1,2) = dt(p1,p1)*dt(p1,p2)*rat(1,Dt^2+2*Dt);
Fill Prt4(1,1,2,2) = dt(p1,p1)*dt(p2,p2)*rat(Dt+1,Dt^3+Dt^2-2*Dt)+dt(p1
 ,p2)^2*rat(-2,Dt^3+Dt^2-2*Dt);
Fill Prt4(1,1,2,3) = dt(p1,p1)*dt(p2,p3)*rat(Dt+1,Dt^3+Dt^2-2*Dt)+dt(p1
 ,p2)*dt(p1,p3)*rat(-2,Dt^3+Dt^2-2*Dt);
Fill Prt4(1,2,1,2) = dt(p1,p1)*dt(p2,p2)*rat(-1,Dt^3+Dt^2-2*Dt)+dt(p1,
 p2)^2*rat(1,Dt^2+Dt-2);
Fill Prt4(1,2,1,3) = dt(p1,p1)*dt(p2,p3)*rat(-1,Dt^3+Dt^2-2*Dt)+dt(p1,
 p2)*dt(p1,p3)*rat(1,Dt^2+Dt-2);
Fill Prt4(1,2,2,2) = dt(p1,p2)*dt(p2,p2)*rat(1,Dt^2+2*Dt);
Fill Prt4(1,2,2,3) = dt(p1,p2)*dt(p2,p3)*rat(1,Dt^2+Dt-2)+dt(p1,p3)*dt(
 p2,p2)*rat(-1,Dt^3+Dt^2-2*Dt);
Fill Prt4(1,2,3,2) = dt(p1,p2)*dt(p2,p3)*rat(1,Dt^2+Dt-2)+dt(p1,p3)*dt(
 p2,p2)*rat(-1,Dt^3+Dt^2-2*Dt);
Fill Prt4(1,2,3,3) = dt(p1,p2)*dt(p3,p3)*rat(Dt+1,Dt^3+Dt^2-2*Dt)+dt(p1
 ,p3)*dt(p2,p3)*rat(-2,Dt^3+Dt^2-2*Dt);
Fill Prt4(1,2,3,4) = dt(p1,p2)*dt(p3,p4)*rat(Dt+1,Dt^3+Dt^2-2*Dt)+dt(p1
 ,p3)*dt(p2,p4)*rat(-1,Dt^3+Dt^2-2*Dt)+dt(p1,p4)*dt(p2,p3)*rat(-1,Dt^3+
 Dt^2-2*Dt);
