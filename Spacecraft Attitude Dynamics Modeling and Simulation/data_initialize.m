clear all;
clc;
global miu;
global IBd;
global B;
miu=398600.44e+9;

r0=1e+6*[-0.24322284327422;-3.79199144866264;6.32444994784559];
v0=1e+3*[-1.64209188480826; 6.17220916529869; 3.63756062689151];

IBd=[93,-0.07,0;-0.07,80,-0.03;0,-0.03,107];
InvIBd= inv(IBd);
Wb0=[0;0;0];
Hb0=IBd*Wb0;
Qb0=[1;0;0;0];

load B;
Re=6378145;
hp=1000e+3;
a=Re+hp;
Womag = sqrt(miu/a^3);
T_orbit = 2*pi/Womag;
M_remain=[10;10;10];
