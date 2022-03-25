function [sys,x0,str,ts] = si(t,x,u,flag)
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
sizes.NumInputs      = 24;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)

 
ext10=u(1);
ext20=u(2);
ext30=u(3);
ext40=u(4);
ext50=u(5);

evt10=u(1+5);
evt20=u(2+5);
evt30=u(3+5);
evt40=u(4+5);
evt50=u(5+5);

ex10=u(1+10);
ex20=u(2+10);
ex30=u(3+10);
ex40=u(4+10);
ex50=u(5+10);

ev10=u(1+15);
ev20=u(2+15);
ev30=u(3+15);
ev40=u(4+15);
ev50=u(5+15);

doth1=u(21);
doth2=u(22);

ddoth1=u(23);
ddoth2=u(24);


zxt10=ext10-doth1*ex10-doth2*ev10;
zxt20=ext20-doth1*ex20-doth2*ev20;
zxt30=ext30-doth1*ex30-doth2*ev30;
zxt40=ext40-doth1*ex40-doth2*ev40;
zxt50=ext50-doth1*ex50-doth2*ev50;

zvt10=evt10-ddoth1*ex10-ddoth2*ev10;
zvt20=evt20-ddoth1*ex20-ddoth2*ev20;
zvt30=evt30-ddoth1*ex30-ddoth2*ev30;
zvt40=evt40-ddoth1*ex40-ddoth2*ev40;
zvt50=evt50-ddoth1*ex50-ddoth2*ev50;
m=1;
if m==1;
si10=8*zxt10+zvt10;
si20=8*zxt20+zvt20;
si30=8*zxt30+zvt30;
si40=8*zxt40+zvt40;
si50=8*zxt50+zvt50;
else
   si10=0;
   si20=0;
   si30=0;
   si40=0;
   si50=0;
end

sys(1)=si10;
sys(2)=si20;
sys(3)=si30;
sys(4)=si40;
sys(5)=si50;







