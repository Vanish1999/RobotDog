function [x,z]=gait_plan1(t,T)
Ts=T/2; %周期为0.5s
xs=-0.1; %起点x位置
xf=0.1; %终点x位置
zs=-0.482; %z起点位置
h=0.1; %抬腿高度
if(t<=Ts)
    sigma=2*pi*t/Ts;
    x=(xf-xs)*((sigma-sin(sigma))/(2*pi))+xs;
    z=h*(1-cos(sigma))/2+zs;
else
    x=(-(xf-xs)/(T-Ts))*(t-Ts)+xf;
    z=-0.482;
end
end