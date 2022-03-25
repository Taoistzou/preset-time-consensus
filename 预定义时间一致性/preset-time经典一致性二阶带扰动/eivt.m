function [sys,x0,str,ts] = eivt(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 3,
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
sizes.NumInputs      = 13;
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
 
% v1=-5;
% v2=9;
% v3=20;
% v4=4;
% v5=-15;
% v0=-2;

vit1=u(6);
vit2=u(7);
vit3=u(8);
vit4=u(9);
vit5=u(10);

v0t=u(12);

evt1=abs(aij(1,1))*(vit1-sign(aij(1,1))*vit1)+abs(aij(1,2))*(vit1-sign(aij(1,2))*vit2)+abs(aij(1,3))*(vit1-sign(aij(1,3))*vit3)+abs(aij(1,4))*(vit1-sign(aij(1,4))*vit4)+abs(aij(1,5))*(vit1-sign(aij(1,5))*vit5)+b(1)*(vit1-d(1)*v0t);
evt2=abs(aij(2,1))*(vit2-sign(aij(2,1))*vit1)+abs(aij(2,2))*(vit2-sign(aij(2,2))*vit2)+abs(aij(2,3))*(vit2-sign(aij(2,3))*vit3)+abs(aij(2,4))*(vit2-sign(aij(2,4))*vit4)+abs(aij(2,5))*(vit2-sign(aij(2,5))*vit5)+b(2)*(vit2-d(2)*v0t);
evt3=abs(aij(3,1))*(vit3-sign(aij(3,1))*vit1)+abs(aij(3,2))*(vit3-sign(aij(3,2))*vit2)+abs(aij(3,3))*(vit3-sign(aij(3,3))*vit3)+abs(aij(3,4))*(vit3-sign(aij(3,4))*vit4)+abs(aij(3,5))*(vit3-sign(aij(3,5))*vit5)+b(3)*(vit3-d(3)*v0t);
evt4=abs(aij(4,1))*(vit4-sign(aij(4,1))*vit1)+abs(aij(4,2))*(vit4-sign(aij(4,2))*vit2)+abs(aij(4,3))*(vit4-sign(aij(4,3))*vit3)+abs(aij(4,4))*(vit4-sign(aij(4,4))*vit4)+abs(aij(4,5))*(vit4-sign(aij(4,5))*vit5)+b(4)*(vit4-d(4)*v0t);
evt5=abs(aij(5,1))*(vit5-sign(aij(5,1))*vit1)+abs(aij(5,2))*(vit5-sign(aij(5,2))*vit2)+abs(aij(5,3))*(vit5-sign(aij(5,3))*vit3)+abs(aij(5,4))*(vit5-sign(aij(5,4))*vit4)+abs(aij(5,5))*(vit5-sign(aij(5,5))*vit5)+b(5)*(vit5-d(5)*v0t);
sys(1)=evt1;
sys(2)=evt2;
sys(3)=evt3;
sys(4)=evt4;
sys(5)=evt5;







