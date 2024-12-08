function Tm = magnetic_Torque(u)
global B;
miu= 398600.44e+9;
Re=6378145;
hp=1000e+3;
a=Re+hp;
Womag=sqrt(miu/a^3);
T_orbit=2*pi/Womag;
M_remain=[10;10;10];
CbI=reshape(u(1:9),3,3);
tc=u(10);
t_remain= rem(tc,T_orbit);
Bx=interp1((1:308)/308*T_orbit,B(:,1),t_remain,'spline');
By=interp1((1:308)/308*T_orbit,B(:,2),t_remain,'spline');
Bz=interp1((1:308)/308*T_orbit,B(:,3),t_remain,'spline');
Bb=CbI*[Bx;By;Bz];
Tm = cross(M_remain,Bb);
