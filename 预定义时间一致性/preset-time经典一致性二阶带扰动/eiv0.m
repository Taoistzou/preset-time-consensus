function [sys,x0,str,ts] = eiv0(t,x,u,flag)
switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
case 3
    sys=mdlOutputs(t,x,u);
case {1,2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 5;
sizes.NumInputs      = 0;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)

aij=[0 2 0 0 0;
     1 0 0 0 -1;
     -2 0 0 0 1;
     0 0 2 0 0;
     0 0 0 3 0];
 b=[2 0 0 0 0];
 
 d=[1 1 -1 -1 -1];
 
v1=-5;
v2=9;
v3=20;
v4=4;
v5=-15;
v0=-2;

ev1=abs(aij(1,1))*(v1-sign(aij(1,1))*v1)+abs(aij(1,2))*(v1-sign(aij(1,2))*v2)+abs(aij(1,3))*(v1-sign(aij(1,3))*v3)+abs(aij(1,4))*(v1-sign(aij(1,4))*v4)+abs(aij(1,5))*(v1-sign(aij(1,5))*v5)+b(1)*(v1-d(1)*v0);
ev2=abs(aij(2,1))*(v2-sign(aij(2,1))*v1)+abs(aij(2,2))*(v2-sign(aij(2,2))*v2)+abs(aij(2,3))*(v2-sign(aij(2,3))*v3)+abs(aij(2,4))*(v2-sign(aij(2,4))*v4)+abs(aij(2,5))*(v2-sign(aij(2,5))*v5)+b(2)*(v2-d(2)*v0);
ev3=abs(aij(3,1))*(v3-sign(aij(3,1))*v1)+abs(aij(3,2))*(v3-sign(aij(3,2))*v2)+abs(aij(3,3))*(v3-sign(aij(3,3))*v3)+abs(aij(3,4))*(v3-sign(aij(3,4))*v4)+abs(aij(3,5))*(v3-sign(aij(3,5))*v5)+b(3)*(v3-d(3)*v0);
ev4=abs(aij(4,1))*(v4-sign(aij(4,1))*v1)+abs(aij(4,2))*(v4-sign(aij(4,2))*v2)+abs(aij(4,3))*(v4-sign(aij(4,3))*v3)+abs(aij(4,4))*(v4-sign(aij(4,4))*v4)+abs(aij(4,5))*(v4-sign(aij(4,5))*v5)+b(4)*(v4-d(4)*v0);
ev5=abs(aij(5,1))*(v5-sign(aij(5,1))*v1)+abs(aij(5,2))*(v5-sign(aij(5,2))*v2)+abs(aij(5,3))*(v5-sign(aij(5,3))*v3)+abs(aij(5,4))*(v5-sign(aij(5,4))*v4)+abs(aij(5,5))*(v5-sign(aij(5,5))*v5)+b(5)*(v5-d(5)*v0);
sys(1)=ev1;
sys(2)=ev2;
sys(3)=ev3;
sys(4)=ev4;
sys(5)=ev5;







