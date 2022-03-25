function [sys,x0,str,ts] = h3(t,x,u,flag)
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
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 1;
sizes.NumInputs      = 0;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];

function sys=mdlOutputs(t,x,u)
    tf=6;
    if t>=0 && t<=tf
%         h=20/5^7*t^7-70/5^6*t^6+80/5^5*t^5-35/5^4*t^4+1;
          h=2*(t/tf)^3-3*(t/tf)^2+1;
        sys(1)=h;
    else
        h=0;
        sys(1)=h;
    end





