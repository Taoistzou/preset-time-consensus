function [sys,x0,str,ts] = ul(t,x,u,flag)
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
sizes.NumInputs      = 37;
sizes.DirFeedthrough = 1;       %没有求导了是1，有求导了是0
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
 v=[12 8 12 8 12];
 k=100;
 
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

ev10=u(1+10);
ev20=u(2+10);
ev30=u(3+10);
ev40=u(4+10);
ev50=u(5+10);

si10=u(1+5+5+5);
si20=u(2+5+5+5);
si30=u(3+5+5+5);
si40=u(4+5+5+5);
si50=u(5+5+5+5);

u0=u(3+20);

doth1=u(24);
doth2=u(25);

ddoth1=u(26);
ddoth2=u(27);

% ext10=u(1+27);
% ext20=u(2+27);
% ext30=u(3+27);
% ext40=u(4+27);
% ext50=u(5+27);

evt10=u(1+32);
evt20=u(2+32);
evt30=u(3+32);
evt40=u(4+32);
evt50=u(5+32);


u1=(2+2)^(-1)*(aij(1,1)*u_1+aij(1,2)*u_2+aij(1,3)*u_3+aij(1,4)*u_4+aij(1,5)*u_5+b(1)*d(1)*u0+ddoth1*ex10+ddoth2*ev10-k*(evt10-doth1*ex10-doth2*ev10)-v(1)*sign(si10));
u2=(2+0)^(-1)*(aij(2,1)*u_1+aij(2,2)*u_2+aij(2,3)*u_3+aij(2,4)*u_4+aij(2,5)*u_5+b(2)*d(2)*u0+ddoth1*ex20+ddoth2*ev20-k*(evt20-doth1*ex20-doth2*ev20)-v(2)*sign(si20));
u3=(3+0)^(-1)*(aij(3,1)*u_1+aij(3,2)*u_2+aij(3,3)*u_3+aij(3,4)*u_4+aij(3,5)*u_5+b(3)*d(3)*u0+ddoth1*ex30+ddoth2*ev30-k*(evt30-doth1*ex30-doth2*ev30)-v(3)*sign(si30));
u4=(2+0)^(-1)*(aij(4,1)*u_1+aij(4,2)*u_2+aij(4,3)*u_3+aij(4,4)*u_4+aij(4,5)*u_5+b(4)*d(4)*u0+ddoth1*ex40+ddoth2*ev40-k*(evt40-doth1*ex40-doth2*ev40)-v(4)*sign(si40));
u5=(3+0)^(-1)*(aij(5,1)*u_1+aij(5,2)*u_2+aij(5,3)*u_3+aij(5,4)*u_4+aij(5,5)*u_5+b(5)*d(5)*u0+ddoth1*ex50+ddoth2*ev50-k*(evt50-doth1*ex50-doth2*ev50)-v(5)*sign(si50));

sys(1)=u1;
sys(2)=u2;
sys(3)=u3;
sys(4)=u4;
sys(5)=u5;










