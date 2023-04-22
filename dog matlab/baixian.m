clc
clear
Ts=1; %����
xs=-0.1; %���xλ��
xf=0.1;  %�յ�xλ��
zs=-0.582; %z���λ��
h=0.1; %̧�ȸ߶�
x=[];
z=[];
for t=0:0.01:Ts
    sigma=2*pi*t/(Ts);
    xep=(xf-xs)*((sigma-sin(sigma))/(2*pi))+xs;
    zep=h*(1-cos(sigma))/2+zs;
    x=[x,xep];
    z=[z,zep];
end
plot(x,z,'r','LineWidth',3)