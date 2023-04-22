function [x,z]=gait_plan1(t,T)
Ts=T/2; %����Ϊ0.5s
xs=-0.1; %���xλ��
xf=0.1; %�յ�xλ��
zs=-0.482; %z���λ��
h=0.1; %̧�ȸ߶�
if(t<=Ts)
    sigma=2*pi*t/Ts;
    x=(xf-xs)*((sigma-sin(sigma))/(2*pi))+xs;
    z=h*(1-cos(sigma))/2+zs;
else
    x=(-(xf-xs)/(T-Ts))*(t-Ts)+xf;
    z=-0.482;
end
end