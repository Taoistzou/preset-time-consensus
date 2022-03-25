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
sizes.NumContStates  = 1;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;
sizes.NumInputs      = 0;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [11];
str = [];
ts  = [0 0];
function sys=mdlDerivatives(t,x,u)
% u0=0.2*cos(t);
u0=0;
sys(1)=u0;


function sys=mdlOutputs(t,x,u)
% u0=0.2*cos(t);
u0=0;
sys(1)=x(1);
sys(2)=u0;


