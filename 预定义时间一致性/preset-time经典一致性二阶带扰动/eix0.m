function [sys,x0,str,ts] = eix0(t,x,u,flag)
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
 
x1=20;
x2=25;
x3=15;
x4=30;
x5=-25;

x0=-20;
ex1=abs(aij(1,1))*(x1-sign(aij(1,1))*x1)+abs(aij(1,2))*(x1-sign(aij(1,2))*x2)+abs(aij(1,3))*(x1-sign(aij(1,3))*x3)+abs(aij(1,4))*(x1-sign(aij(1,4))*x4)+abs(aij(1,5))*(x1-sign(aij(1,5))*x5)+b(1)*(x1-d(1)*x0);
ex2=abs(aij(2,1))*(x2-sign(aij(2,1))*x1)+abs(aij(2,2))*(x2-sign(aij(2,2))*x2)+abs(aij(2,3))*(x2-sign(aij(2,3))*x3)+abs(aij(2,4))*(x2-sign(aij(2,4))*x4)+abs(aij(2,5))*(x2-sign(aij(2,5))*x5)+b(2)*(x2-d(2)*x0);
ex3=abs(aij(3,1))*(x3-sign(aij(3,1))*x1)+abs(aij(3,2))*(x3-sign(aij(3,2))*x2)+abs(aij(3,3))*(x3-sign(aij(3,3))*x3)+abs(aij(3,4))*(x3-sign(aij(3,4))*x4)+abs(aij(3,5))*(x3-sign(aij(3,5))*x5)+b(3)*(x3-d(3)*x0);
ex4=abs(aij(4,1))*(x4-sign(aij(4,1))*x1)+abs(aij(4,2))*(x4-sign(aij(4,2))*x2)+abs(aij(4,3))*(x4-sign(aij(4,3))*x3)+abs(aij(4,4))*(x4-sign(aij(4,4))*x4)+abs(aij(4,5))*(x4-sign(aij(4,5))*x5)+b(4)*(x4-d(4)*x0);
ex5=abs(aij(5,1))*(x5-sign(aij(5,1))*x1)+abs(aij(5,2))*(x5-sign(aij(5,2))*x2)+abs(aij(5,3))*(x5-sign(aij(5,3))*x3)+abs(aij(5,4))*(x5-sign(aij(5,4))*x4)+abs(aij(5,5))*(x5-sign(aij(5,5))*x5)+b(5)*(x5-d(5)*x0);
sys(1)=ex1;
sys(2)=ex2;
sys(3)=ex3;
sys(4)=ex4;
sys(5)=ex5;







