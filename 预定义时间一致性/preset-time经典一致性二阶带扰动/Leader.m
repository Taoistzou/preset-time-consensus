function [sys,x0,str,ts] = Leader(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 2;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 3;
sizes.NumInputs      = 0;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [-20 -2];
str = [];
ts  = [0 0];            %ts是一个1×2的向量，ts(1)是采样周期，ts(2)是偏移量

function sys=mdlDerivatives(t,x,u)
u0=0.2*cos(t);                             
sys(1)=x(2);
sys(2)=u0;


function sys=mdlOutputs(t,x,u)
sys(1)=x(1);            %x0t
sys(2)=x(2);            %v0t
sys(3)=0.2*cos(t);      %u0t


