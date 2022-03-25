function [sys,x0,str,ts] = eixt(t,x,u,flag)
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
 
% x1=20;
% x2=25;
% x3=15;
% x4=30;
% x5=-25;

xit1=u(1);
xit2=u(2);
xit3=u(3);
xit4=u(4);
xit5=u(5);

x0t=u(11);

% x0=-20;
ext1=abs(aij(1,1))*(xit1-sign(aij(1,1))*xit1)+abs(aij(1,2))*(xit1-sign(aij(1,2))*xit2)+abs(aij(1,3))*(xit1-sign(aij(1,3))*xit3)+abs(aij(1,4))*(xit1-sign(aij(1,4))*xit4)+abs(aij(1,5))*(xit1-sign(aij(1,5))*xit5)+b(1)*(xit1-d(1)*x0t);
ext2=abs(aij(2,1))*(xit2-sign(aij(2,1))*xit1)+abs(aij(2,2))*(xit2-sign(aij(2,2))*xit2)+abs(aij(2,3))*(xit2-sign(aij(2,3))*xit3)+abs(aij(2,4))*(xit2-sign(aij(2,4))*xit4)+abs(aij(2,5))*(xit2-sign(aij(2,5))*xit5)+b(2)*(xit2-d(2)*x0t);
ext3=abs(aij(3,1))*(xit3-sign(aij(3,1))*xit1)+abs(aij(3,2))*(xit3-sign(aij(3,2))*xit2)+abs(aij(3,3))*(xit3-sign(aij(3,3))*xit3)+abs(aij(3,4))*(xit3-sign(aij(3,4))*xit4)+abs(aij(3,5))*(xit3-sign(aij(3,5))*xit5)+b(3)*(xit3-d(3)*x0t);
ext4=abs(aij(4,1))*(xit4-sign(aij(4,1))*xit1)+abs(aij(4,2))*(xit4-sign(aij(4,2))*xit2)+abs(aij(4,3))*(xit4-sign(aij(4,3))*xit3)+abs(aij(4,4))*(xit4-sign(aij(4,4))*xit4)+abs(aij(4,5))*(xit4-sign(aij(4,5))*xit5)+b(4)*(xit4-d(4)*x0t);
ext5=abs(aij(5,1))*(xit5-sign(aij(5,1))*xit1)+abs(aij(5,2))*(xit5-sign(aij(5,2))*xit2)+abs(aij(5,3))*(xit5-sign(aij(5,3))*xit3)+abs(aij(5,4))*(xit5-sign(aij(5,4))*xit4)+abs(aij(5,5))*(xit5-sign(aij(5,5))*xit5)+b(5)*(xit5-d(5)*x0t);
sys(1)=ext1;
sys(2)=ext2;
sys(3)=ext3;
sys(4)=ext4;
sys(5)=ext5;







