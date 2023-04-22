function [x,z]=gait_plan2(t,T)
Ts=T/4; %����Ϊ0.25s
xs=-0.1; %���xλ��
xf=0.1; %�յ�xλ��
zs=-0.482; %z���λ��
h=0.15; %̧�ȸ߶�
if(t<=Ts)
    sigma=2*pi*t/Ts;
    x=(xf-xs)*((sigma-sin(sigma))/(2*pi))+xs;
    z=h*(1-cos(sigma))/2+zs;
else
    x=(-(xf-xs)/(T-Ts))*(t-Ts)+xf;
    z=-0.482;
end
end