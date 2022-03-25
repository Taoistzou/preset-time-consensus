function [sys,x0,str,ts] = eix(t,x,u,flag)
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

aij=[0 1 0 0 0;
     1 0 0 0 1;
     1 0 0 0 1;
     0 0 1 0 0;
     0 0 0 1 0];
 b=[1 0 0 0 0];
 
x1=4;
x2=-13;
x3=-15;
x4=13;
x5=7;

x0=11;
ex1=aij(1,1)*(x1-x1)+aij(1,2)*(x1-x2)+aij(1,3)*(x1-x3)+aij(1,4)*(x1-x4)+aij(1,5)*(x1-x5)+b(1)*(x1-x0);
ex2=aij(2,1)*(x2-x1)+aij(2,2)*(x2-x2)+aij(2,3)*(x2-x3)+aij(2,4)*(x2-x4)+aij(2,5)*(x2-x5)+b(2)*(x2-x0);
ex3=aij(3,1)*(x3-x1)+aij(3,2)*(x3-x2)+aij(3,3)*(x3-x3)+aij(3,4)*(x3-x4)+aij(3,5)*(x3-x5)+b(3)*(x3-x0);
ex4=aij(4,1)*(x4-x1)+aij(4,2)*(x4-x2)+aij(4,3)*(x4-x3)+aij(4,4)*(x4-x4)+aij(4,5)*(x4-x5)+b(4)*(x4-x0);
ex5=aij(5,1)*(x5-x1)+aij(5,2)*(x5-x2)+aij(5,3)*(x5-x3)+aij(5,4)*(x5-x4)+aij(5,5)*(x5-x5)+b(5)*(x5-x0);
sys(1)=ex1;
sys(2)=ex2;
sys(3)=ex3;
sys(4)=ex4;
sys(5)=ex5;







