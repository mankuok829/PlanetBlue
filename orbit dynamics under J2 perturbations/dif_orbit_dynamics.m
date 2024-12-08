function dx = dif_orbit_dynamics(t,x)
global miu;
global J;
global Re;
miu=398600.44e+9;
Re=6378.145e+03;
J=0.00108263;
rx=x(1);
ry=x(2);
rz=x(3);
vx=x(4);
vy=x(5);
vz=x(6);

r=sqrt(rx^2+ry^2+rz^2);
drx=vx;
dry=vy;
drz=vz;

dvx=-miu*rx/r^3-miu*rx/r^3*(3/2*J*Re^2/r^2*(1-5*rz^2/r^2));
dvy=-miu*ry/r^3-miu*ry/r^3*(3/2*J*Re^2/r^2*(1-5*rz^2/r^2));
dvz=-miu*rz/r^3-miu*rz/r^3*(3/2*J*Re^2/r^2*(3-5*rz^2/r^2));
dx=[drx;dry;drz;dvx;dvy;dvz];

end