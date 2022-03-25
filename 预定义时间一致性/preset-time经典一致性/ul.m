function [sys,x0,str,ts] = ul(t,x,u,flag)
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
aij=[0 1 0 0 0;
     1 0 0 0 1;
     1 0 0 0 1;
     0 0 1 0 0;
     0 0 0 1 0];
 b=[1 0 0 0 0];

 
u_1=u(1);
u_2=u(2);
u_3=u(3);
u_4=u(4);
u_5=u(5);

ex10=u(1+5);
ex20=u(2+5);
ex30=u(3+5);
ex40=u(4+5);
ex50=u(5+5);

u0=u(2+5+5);

doth3=u(1+2+5+5);

u1=(1+1)^(-1)*(aij(1,1)*u_1+aij(1,2)*u_2+aij(1,3)*u_3+aij(1,4)*u_4+aij(1,5)*u_5+b(1)*u0+doth3*ex10);
u2=(2+0)^(-1)*(aij(2,1)*u_1+aij(2,2)*u_2+aij(2,3)*u_3+aij(2,4)*u_4+aij(2,5)*u_5+b(2)*u0+doth3*ex20);
u3=(2+0)^(-1)*(aij(3,1)*u_1+aij(3,2)*u_2+aij(3,3)*u_3+aij(3,4)*u_4+aij(3,5)*u_5+b(3)*u0+doth3*ex30);
u4=(1+0)^(-1)*(aij(4,1)*u_1+aij(4,2)*u_2+aij(4,3)*u_3+aij(4,4)*u_4+aij(4,5)*u_5+b(4)*u0+doth3*ex40);
u5=(1+0)^(-1)*(aij(5,1)*u_1+aij(5,2)*u_2+aij(5,3)*u_3+aij(5,4)*u_4+aij(5,5)*u_5+b(5)*u0+doth3*ex50);

sys(1)=u1;
sys(2)=u2;
sys(3)=u3;
sys(4)=u4;
sys(5)=u5;










