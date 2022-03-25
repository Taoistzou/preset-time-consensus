function [sys,x0,str,ts] = Plant(t,x,u,flag)
switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1
    sys=mdlDerivatives(t,x,u);
case 3
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 10;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 10;
sizes.NumInputs      = 5;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [20 25 15 30 -25   -5 9 20 4 -15];
str = [];
ts  = [0 0];
function sys=mdlDerivatives(t,x,u)

c1=2*cos(t);
c2=2*sin(t);
c3=2*cos(t);
c4=2*sin(t);
c5=2*cos(t);


sys(6)=u(1)+c1;          
sys(7)=u(2)+c2;
sys(8)=u(3)+c3;
sys(9)=u(4)+c4;
sys(10)=u(5)+c5;

sys(1)=x(6);
sys(2)=x(7);
sys(3)=x(8);
sys(4)=x(9);
sys(5)=x(10);

function sys=mdlOutputs(t,x,u)

sys(1)=x(1);
sys(2)=x(2);        
sys(3)=x(3);
sys(4)=x(4);
sys(5)=x(5);

sys(6)=x(6);
sys(7)=x(7);        
sys(8)=x(8);
sys(9)=x(9);
sys(10)=x(10);




